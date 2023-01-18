For now let's talk about json format.

This is json file: ***users.json***. There are data of the same structure as in the 
previous one, but in json format.

Here is nothing complicated:
- Export module;
- Open the file;
- Read with the help of <code>json_load</code>;
- Handling data as dictionary, we extract the appropriate fields;
- Form command to create user.

Everything is the same as in the previous tasks.

<details> <summary>Here you can see solution</summary>

```
import os, json

import_file = open('users.json')
users_data = json.load(import_file)
import_file.close()

for user in users_data['users']:
	if user['type']=='system':
		user['type'] = '--system'
	else:
		user['type'] = ''
	os.system('useradd ' + user['name'] + ' ' + user['type'] + ' ' + '--comment "' + user['description'] +'"') 
```

</details>