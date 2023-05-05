Python has built-in support for working with YAML through the PyYAML 
library. For more information on options and usage, 
please refer to the official documentation

- yaml.load(stream):
Load a YAML document from a string or file and convert it into a Python object.
```Python
import yaml

# Load YAML data from a string
yaml_data = """
name: John Smith
age: 35
hobbies:
  - reading
  - hiking
  - cooking
"""

data = yaml.load(yaml_data, Loader=yaml.FullLoader)
print(data)
```
- yaml.dump(data):
Convert a Python object to a YAML document and write it to a file or stream.
```Python
import yaml

# Python data to be written to YAML
data = {
    "name": "John Smith",
    "age": 35,
    "hobbies": ["reading", "hiking", "cooking"]
}

# Write the data to a file as YAML
with open("output.yaml", "w") as f:
    yaml.dump(data, f)
```
- yaml.safe_load(stream):
Same as yaml.load(), but only allows loading of primitive Python objects.
```Python
import yaml

# Load YAML data safely from a file
with open("example.yaml", "r") as f:
    data = yaml.safe_load(f)

print(data)
```
- yaml.add_constructor(tag, constructor):
Add a constructor function for a custom YAML tag.
```Python
import yaml

# Define a custom constructor for the !person tag
def person_constructor(loader, node):
    data = loader.construct_scalar(node)
    name, age = data.split(",")
    return {"name": name, "age": int(age)}

# Add the constructor to the YAML loader
yaml.add_constructor("!person", person_constructor)

# Load YAML data with custom tag
yaml_data = """
- !person John Smith,35
- !person Jane Doe,27
"""

data = yaml.load(yaml_data, Loader=yaml.FullLoader)
print(data)
```