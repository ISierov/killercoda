The json module in Python provides several 
methods for encoding and decoding JSON data.

- json.dumps(): This method converts a Python 
object into a JSON formatted string. 
```Python
import json

data = {
    "name": "John",
    "age": 25,
    "is_student": True,
    "courses": ["Math", "Science", "History"],
    "address": {
        "street": "123 Main St",
        "city": "Anytown",
        "state": "CA",
        "zip": "12345"
    }
}

json_string = json.dumps(data)
print(json_string)
```
- json.loads(): This method converts 
a JSON formatted string into a Python object
```Python
import json

json_string = '{"name": "John", "age": 25, "is_student": true, "courses": ["Math", "Science", "History"], "address": {"street": "123 Main St", "city": "Anytown", "state": "CA", "zip": "12345"}}'

data = json.loads(json_string)
print(data)

```
- json.dump(): This method writes a data to a file in JSON format.
```Python
import json 

data = {
    "name": "John",
    "age": 25,
    "is_student": True,
    "courses": ["Math", "Science", "History"],
    "address": {
        "street": "123 Main St",
        "city": "Anytown",
        "state": "CA",
        "zip": "12345"
    }
}

with open('output.json', "w") as outfile:
    json.dump(data, outfile)
```
- json.load(): This method reads a JSON formatted string from a file 
and converts it into a Python object
```Python
import json

with open("example.json", "r") as infile:
    data = json.load(infile)
    
print(data)
```
