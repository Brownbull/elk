# Operations
This will describe operations on datasets obtained from queries or filters on ElasticSearch requests
- [Operations](#operations)
  - [Pagination](#pagination)
  - [Sorting](#sorting)
    - [Map text sorting trick](#map-text-sorting-trick)
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