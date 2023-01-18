This is xml file: ***users1.xml***

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
> We can do it with <code>root.findall('user')</code> function

After, ask a found element its attribute *name* with the help of method 
<code>get()</code>.

Search values of elements *description* and *type*.

With simple *if* we can convert type of user to required command.

The last step is to call the user creation function with the appropriate parameters. 

### To run our code we call 
<code>
sudo python name_of_file.py
</code>

### To check write 
<code>
cat /etc/passwd
</code>

And if it all correct, we can see our users at the bottom of list.

<details> <summary>Here you can see solution</summary>

```import os
import xml.etree.ElementTree as ET
tree = ET.parse('users1.xml')
root = tree.getroot()
for user in root.findall('user'):
  uname = user.get('name')
  udescript = user.find('description').text
  utype = user.find('type').text
  if utype=='system':
    utype = '--system'
  else:
    utype = ''
  os.system('useradd ' + uname + ' ' + utype + ' ' + '--comment "' + udescript +'"')
```

</details>


