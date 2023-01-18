import json
import xml.etree.ElementTree as ET

# parse the XML file
tree = ET.parse("assets/input.xml")
root = tree.getroot()

# create an empty dictionary to store the data
data = {}

# iterate through the root element and its children
for child in root:
    # check if the child has any sub-elements
    if len(list(child)) > 0:
        data[child.tag] = {}
        for subchild in child:
            if child.tag == 'Tools':
                data[child.tag][subchild.attrib['name']] = subchild.attrib['version']
            else:
                print(child.tag, subchild.attrib['name'])
                data[child.tag][subchild.attrib['name']] = subchild.attrib['type']
    else:
        data[child.tag] = child.text

# write the data to a JSON file
with open("correct_output.json", "w") as f:
    json.dump(data, f)
