# Queries
- [Queries](#queries)
  - [Sintaxis](#sintaxis)
  - [Use example](#use-example)
  - [Types](#types)
    - [match_all](#matchall)
    - [bool](#bool)
    - [match](#match)
    - [multi_match](#multimatch)
    - [match_phrase](#matchphrase)
      - [slop](#slop)
        - [example](#example)
    - [proximity queries](#proximity-queries)
***
## Sintaxis
queries are wrapped in:
```shell
"query" : {}
```
## Use example
```shell
curl -XGET 127.0.0.1:9200/movies/_search?pretty -d
{
	"query":
	{
		"bool": {
			"must": {
				"term": {
					"title": "trek"
				}
			},
			"filter": {
				"range": {
					"year": {
						"gte": 2010
					}
				}
			}
		}
	}
} 
```

## Types
### match_all
returns all documens and is the default. Normally used with a filter
```shell
{"match_all": {}}
```
### bool
works like a bool filter, but results are scored by relevance
```shell
```
### match
searches analyzed results, such as full text search
```shell
{"match": {"title": "start" }}
```
### multi_match
run the same query on multiple fields
```shell
{"multi_match": {"query": "start", "fields": ["title", "synopsis" ]}}
```
### match_phrase
must find all terms in right order.
```shell
{"match_phrase": {"title": {"query": "start beyond", "slop": 1}}}
```
#### slop
slop represents how far you're willing to let a term move to satisfy a pharse(in either direction)
##### example
"quick brown fox" would match "quick fox" with a slop of 1.

### proximity queries
match_phrase is a query, so results are sorted by relevance.
You can use a high slop, and will get docs with the words closer together scored higher.
```shell
{
  "query" : {
    "match_phrase": {
      "title": {
       "query": "start beyond",
       "slop": 100
      }
    }
  }
}
```