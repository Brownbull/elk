# Operations
This will describe operations on datasets obtained from queries or filters on ElasticSearch requests
- [Operations](#operations)
  - [Pagination](#pagination)
  - [Sorting](#sorting)
    - [Map text sorting trick](#map-text-sorting-trick)
  - [Fuzzy Matches](#fuzzy-matches)
    - [AUTO fuzzines](#auto-fuzzines)
  - [Partial Match](#partial-match)
    - [Prefix](#prefix)
    - [Wildcard](#wildcard)
  - [Search as you type](#search-as-you-type)
    - [query-time search-as-you-type](#query-time-search-as-you-type)
    - [N-gram](#n-gram)
***
## Pagination
Allows you to get 'n' results from 'm' page (starting from 0)
```shell
{
	"from": 2,
	"size": 2,
	"query": {
		"match": {
			"genre": "Sci-Fi"
		}
	}
}
```

## Sorting
Order results in certain order. 
A string field that is analyzed for full-text search can't be used to sort documents. Thsi is because it exists in the inverted index as individual terms, not as the entire string.
```shell
curl -XGET 127.0.0.1:9200/movies/_search?pretty
{
	"sort": "title.raw"
}
```
### Map text sorting trick
But if you need too, here is what you can do(MUST BE DONE ON MAPPING CREATION!!!):
```shell
# Map a keyword copy
curl -XPUT 127.0.0.1:9200/movies
{
  "mappings": {
    "properties": {
      "title": {
        "type": "text",
        "field": {
          "raw": {
            "type": "keyword"
          }
        }      
      }
    }
  }
}

```

## Fuzzy Matches
A way to account for typos and misspellings.
The levenshtein edit distance accounts for:
- substitutions: interstellar -> intersteller
- insertions: interstellar -> instersstellar
- deletion: interstellar -> interstelar

`All of the above have an edit distance of 1`

```shell
curl -XGET 127.0.0.1:9200/movies/_search?pretty -d
{
	"query": {
		"fuzzy": {
			"title": {
				"value": "intrsteller", "fuzziness": 2
			}
		}
	}
}
```

### AUTO fuzzines
- 0 for 1-2 character strings
- 1 for 3-5 character strings
- 2 for anything else

## Partial Match
### Prefix
```shell
{
	"query":{
		"prefix":{
			"year": "201"
		}
	}
}
```
### Wildcard
```shell
{
	"query":{
		"wildcard":{
			"year": "1*"
		}
	}
}
```

## Search as you type
### query-time search-as-you-type
```shell
{
	"query": {
		"match_phrase_prefix": {
			"title": {
				"query": "start t",
				"slop": 10
			}
		}
	}
}
```
### N-gram
"start"
- unigram: [s,t,a,r]
- bigram: [st,ta,at]
- trigram: [sta,tat]
- 4-gram: [star]

```shell

```

