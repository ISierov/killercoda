The ***xml.etree.ElementTree*** module in Python provides several 
methods for encoding and decoding xml data.

- To parse the XML file and create an ElementTree object, 
use the ElementTree.parse() function:
```Python
import xml.etree.ElementTree as ET

tree = ET.parse('example.xml')
root = tree.getroot()
```
- To access an element and its attributes, use the 
Element.find() function:
```Python
book = root.find('book')
print(book.get('id'))
```

- To access the text of an element, use the Element.text property:
```Python
title = book.find('title')
print(title.text)
```

- To find elements using an XPath expression, use the 
Element.findall() function:
```Python
books = root.findall("./book[year='1998']")
for book in books:
    title = book.find('title')
    print(title.text)
```

- To create a new element, use the Element() function:
```Python
new_book = ET.Element('book', {'id': '4'})
new_title = ET.Element('title')
new_title.text = 'Harry Potter and the Goblet of Fire'
new_book.append(new_title)
new_author = ET.Element('author')
new_author.text = 'J.K. Rowling'
new_book.append(new_author)
new_year = ET.Element('year')
new_year.text = '2000'
new_book.append(new_year)
root.append(new_book)
```

- To write the modified XML back to a file, use the 
ElementTree.write() function:
```Python
tree.write('updated.xml')
```