To get the whole picture of working with xml files, let's consider the next example.

Here we use <code>xml.dom</code> package and for curiosity consider the inverse
problem - export system users with appropriate parameters that interest us in xml format.

For this we will read system file with users. This is the same file which we use to see
if our code work correctly. As we remember, attributes are divided by colon *":"*.
We process it, read the parameters which we are concerned and export them into xml file.
So, we will have to work with a simple text file and xml format.

We should import module in the standard way.

Next is defining a set of certain parameters, in order for us to have meaningful names
for variables in the code. To these variables, we will assign values of those fields
of system file which we are concerned for importing.


<details> <summary>Variables</summary>
```
>min_uid = 1000
>uname = 0
>uid = 2
>udescr = 4
```
</details>

<code>min_uid</code> is the minimal meaning of identifier for non-system users because
we need to somehow recognize a system-user. For this system and for most of the systems
this value is *1000*. Identifiers that are less than *1000* will mean that is system-user.

Next step is open the files for import and export, form our xml document, read system 
file line by line, work every line declaring a colon as delimiter. 

Analyze whether the identifier correspond to the system and form the fields for 
export accordingly. Open new elements with the help of <code>createElement</code> and 
fill in the content with the read fields from the text file.

After processing the text file we export data to xml file.

And that's it, close the opened files.

Run our script and open ***export.xml*** file to check the result.

<details> <summary>Here you can see solution</summary> 

```
from xml.dom.minidom import Document

min_uid = 1000
uname = 0
uid = 2
udescr = 4

import_file = open('/etc/passwd')
export_file = open('export.xml','w')

doc = Document()
data_node = doc.createElement('data')
doc.appendChild(data_node)

for line in import_file:
    user_data = line.rstrip().split(':')
    if int(user_data[uid])<min_uid:
        utype = 'system'
    else:
        utype = 'normal'
    
    users_node = doc.createElement('user')
    users_node.attributes['name'] = user_data[uname]
    data_node.appendChild(users_node)
    
    descr_node = doc.createElement('description')
    users_node.appendChild(descr_node)
    descr_node.appendChild(doc.createTextNode(user_data[udescr]))

    type_node = doc.createElement('type')
    users_node.appendChild(type_node)
    type_node.appendChild(doc.createTextNode(utype))


export_file.write(doc.toprettyxml(indent="    "))

import_file.close()
export_file.close()
```

</details>