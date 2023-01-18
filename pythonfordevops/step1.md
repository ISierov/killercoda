There is xml file: ***users1.xml***

File contain structured list of users.
The main attributes of the users are:
- name
- description 
- type: 
  - system
  - ordinary

Our users are services. The creation of the unprivileged user 
for each service corresponds to the best practice of 
configuration servers.

To start coding we should create file with *.py* extension.

First of all, we should import modules to interact with the file system 
<code>os</code> and for working with xml data
(for example <code>xml.etree.ElementTree</code>).

Next, upload our file with the structure with the help of function 
<code>parse(*'name of file'*)</code>.

Return root element of out tree to the variable <code>root</code>.

Create cycle to find all elements with tag *user*.
> We can do it with findall() function

After, ask a found element its attribute *name* with the help of method 
<code>get()</code>.

Search values of elements *description* and *type*.

With simple *if* we can convert type of user to required command.

The last step is to call the user creation function with the appropriate parameters. 

> To run our code we call ```sudo python name_of_file.py```{{exec}} <br>
> To check write ```cat /etc/passwd```{{exec}}

And if it all correct, we can see our users at the bottom of list.

<details> <summary>Here you can see solution</summary>
```import os<br>
import xml.etree.ElementTree as ET<br>
tree = ET.parse('users1.xml')<br>
root = tree.getroot()<br>
for user in root.findall('user'):<br>
&nbsp;&nbsp;&nbsp;&nbsp;uname = user.get('name')<br>
&nbsp;&nbsp;&nbsp;&nbsp;udescript = user.find('description').text<br>
    &nbsp;&nbsp;&nbsp;&nbsp;utype = user.find('type').text<br>
    &nbsp;&nbsp;&nbsp;&nbsp;if utype=='system':<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;utype = '--system'<br>
    &nbsp;&nbsp;&nbsp;&nbsp;else:<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;utype = ''<br>
    &nbsp;&nbsp;&nbsp;&nbsp;os.system('useradd ' + uname + ' ' + utype + ' ' + '--comment "' + udescript +'"')<br>
```{{exec}}
</details>