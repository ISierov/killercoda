There is xml file: */example1/users1.xml*

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



<details> <summary>Solution</summary>
<code>import os <br>
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
</code>
</details>