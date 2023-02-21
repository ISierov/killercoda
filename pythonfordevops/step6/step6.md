And finally, the last example that we are going to consider.

We have some Continuous Integration server - **Jenkins**.

The task: find out the status of the last project build - it is successful or not.

Your Jenkins url:

[Jenkins url]({{TRAFFIC_HOST1_8080}}) 
(if does not work, try again in a few minutes)

To accomplish this task, we should 
import <code>json, requests</code> modules.

Also, we should know how Jenkins API work. In our case,
directory to get last build status API of 'hello' project:
<code>/job/hello/lastBuild/api/json</code>
You can write number of needed build instead 'lastBuild'.

Access to response should be from existing user. 
We have one with the following credentials:
- login: <code>admin</code> 
- password: <code>1234</code>

Using <code>requests.get(url, auth=(username, password))</code>
method we can collect all necessary information.

> Recommend use <code>try .. catch</code> or <code>if .. else</code> block to
> check if the response status is **OK**

The response of json format we pass to json parser and print result status.

<details> <summary>Here you can see solution</summary>

```
import requests
import json

jenkins_url = '{{TRAFFIC_HOST1_8080}}'
job_name = 'hello'

username = 'admin'
password = '1234'

api_url = f'{jenkins_url}/job/{job_name}/lastBuild/api/json'
response = requests.get(api_url, auth=(username, password))

if response.status_code == 200:
    # Check if the response body is not empty
    if response.text:
        data = json.loads(response.text)
        # Extract the build status from the JSON data
        status = data['result']
        # Print the build status
        print(f'The last build status for job {job_name} is {status}')
    else:
        print(f'Response body is empty')
else:
    print(f'Response returned status code {response.status_code}')
```
</details>