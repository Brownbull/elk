# Queries
- [Queries](#queries)
  - [Sintaxis](#sintaxis)
  - [Use example](#use-example)
  - [Types](#types)
    - [match_all](#matchall)
    - [match](#match)
    - [multi_match](#multimatch)
    - [bool](#bool)
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
### bool
works like a bool filter, but results are scored by relevance
```shell
```
