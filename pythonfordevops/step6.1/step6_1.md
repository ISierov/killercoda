Another way to get this info - use special modules. 

One of this: python-jenkin. To install module write
<code>pip install python-jenkins</code> in terminal.

And for import write <code>import jenkins</code>

Credentials, job name and url are same:
- login: <code>admin</code> 
- password: <code>1234</code>
- name: *hello*
- [Jenkins url]({{TRAFFIC_HOST1_8080}})

To connect to server we use 'Jenkins' object, with following constructor:
<code>jenkins.Jenkins(jenkins_url, username=username, password=password)</code>

Here, we get build info by number. To get number of the last build:
<code>server.get_job_info(job_name)['lastBuild']['number']</code>

Now, we can get build information and *result* of build point at status:
<code>server.get_build_info(job_name, last_build_number)</code>

<details> <summary>Here you can see solution</summary>

```
import jenkins

jenkins_url = '{{TRAFFIC_HOST1_8080}}'
job_name = 'hello'

username = 'admin'
password = '1234'
server = jenkins.Jenkins(jenkins_url, username=username, password=password)

last_build_number = server.get_job_info(job_name)['lastBuild']['number']
build_info = server.get_build_info(job_name, last_build_number)

status = build_info['result']

print(f'The last build status for job {job_name} is {status}')
```
</details>