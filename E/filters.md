# Filters
- [Filters](#filters)
  - [Sintaxis](#sintaxis)
  - [Use example](#use-example)
  - [Types](#types)
    - [term](#term)
    - [terms](#terms)
    - [range](#range)
    - [exists](#exists)
    - [missing](#missing)
    - [bool](#bool)
***
## Sintaxis
queries are wrapped in:
```shell
"filter" : {}
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
### term
filter by exact values
```shell
{"term": {"year": 2014 }}
```
### terms
filter if any exact values in a list match
```shell
{"terms": {"genre": ["Sci-Fi", "Adventure"] }}
```
### range
Find numbers or dates in a given range (gt, gte, lt, lte)
```shell
{"range": {"year": {"gte": 2010 }}}
```
### exists
Find documents where a field exists
```shell
{"exists": {"field": "tags" }}
```
### missing
Find documents where a field is missing
```shell
{"missing": {"field": "tags" }}
```
### bool
Combine filters with boolean logic (must, must_not, should)
```shell
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
```