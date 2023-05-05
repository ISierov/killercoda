The ***lxml*** module in Python provides several 
methods for encoding and decoding xml data.
- Parse the XML file:
```Python
from lxml import etree

tree = etree.parse("example.xml")
```
- Find elements with a given tag name
```Python
titles = tree.findall(".//title")
authors = tree.findall(".//author")
years = tree.findall(".//year")
```

- Iterate over elements with a given tag name:
```Python
for title in tree.iter("title"):
    print(title.text)
```

- Access element attributes:
```Python
for book in tree.findall(".//book"):
    print(book.get("id"))
```
- Modify an element's text or attribute values:
```Python
for year in years:
    year.text = str(int(year.text) + 1)
tree.write("modified.xml")
```
- Create a new element and add it to the tree:
```Python
new_book = etree.Element("book", id="4")
new_title = etree.Element("title")
new_title.text = "Harry Potter and the Goblet of Fire"
new_book.append(new_title)
tree.getroot().append(new_book)
tree.write("modified.xml")
```
