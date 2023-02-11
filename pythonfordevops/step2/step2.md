The next example: the task is the same, but we implement it using *sax* model.

We can use the same file or ***users2.xml*** with the same structure.

Let's import the needed libraries.

We need also open our file.

After opening, call parser <code>xml.sax.parse()</code>. It admits 2 parameters
for entering: the file itself and some handler class, where defined special methods.

So we should create own class that inherited from the standard <code>ContentHandler</code>
class of *sax* package.

Also, we could create user class for comfortable storing data. In variables of this 
class we can keep some values (*name*, *description* and *type*).

In our custom handler we provide methods to analyse xml file data.
There are:
- <code>startElement</code> corresponds to opening a tag. The input
includes two parameters: *name* and *attrs* - name of element and an object that 
contains attributes. Here we store *name* of user in our custom user class.
- <code>endElement</code> runs when an element ends. The input includes a name of element.
If the name of element is *user*, that is, we have fully read the element that is the 
block of data which we are concerned. We prepare parameters to call the command.
- <code>characters</code> runs while reading an element. Input parameter - *content*
has string type. Reading element - we check if it's sub-element with name *description*
or *type*. If yes, then we store the content.

To run or check code use same command as in the previous step.

<details> <summary>Here you can see solution</summary> 

```
import os, xml.sax

class User:
    uname = ''
    udescr = ''
    utype = ''

class MyContentHandler(xml.sax.ContentHandler):
    def startElement(self, name, attrs):
        self.currentdata = name
        if name == 'user':
            User.uname = attrs.get('name')

    def endElement(self, name):
        if name == 'user':
            if User.utype=='system':
                User.utype = '--system'
            else:
                User.utype = ''
            os.system('useradd ' + User.uname + ' ' + User.utype + ' ' + '--comment "' + User.udescr +'"')
        self.currentdata = ''

    def characters(self, content):
        if self.currentdata == "description":
            User.udescr = content
        elif self.currentdata == "type":
            User.utype = content


input_file = open('users2.xml')
xml.sax.parse(input_file, MyContentHandler())
input_file.close()
```
</details>