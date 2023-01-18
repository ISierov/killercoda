The next example: the task is the same, but we implement it using *sax* model.

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

<details> <summary>Here you can see solution</summary> <code>
import os, xml.sax<br>
<br>
class User:<br>
    &nbsp;&nbsp;&nbsp;&nbsp;uname = ''<br>
    &nbsp;&nbsp;&nbsp;&nbsp;udescr = ''<br>
    &nbsp;&nbsp;&nbsp;&nbsp;utype = ''<br>
<br>
class MyContentHandler(xml.sax.ContentHandler):<br>
<br>
    &nbsp;&nbsp;&nbsp;&nbsp;def startElement(self, name, attrs):<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.currentdata = name<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if name == 'user':<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User.uname = attrs.get('name')<br>
<br>
    &nbsp;&nbsp;&nbsp;&nbsp;def endElement(self, name):<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if name == 'user':<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if User.utype=='system':<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User.utype = '--system'<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User.utype = ''<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.system('useradd ' + User.uname + ' ' + User.utype + ' ' + '--comment "' + User.udescr +'"')<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.currentdata = ''<br>
<br>
    &nbsp;&nbsp;&nbsp;&nbsp;def characters(self, content):<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if self.currentdata == "description":<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User.udescr = content<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;elif self.currentdata == "type":<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User.utype = content<br>
<br>
<br>
input_file = open('users2.xml')<br>
xml.sax.parse(input_file, MyContentHandler())<br>
input_file.close()<br>
</code></details>