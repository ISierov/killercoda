And finally, the last example that we are going to consider.

We have some Continuous Integration server - **Jenkins**.

The task: find out the status of the last project build - it is successful or not.

Your Jenkins url:
[ACCESS JENKINS]({{TRAFFIC_HOST1_8080}})

Directory to get last build status API of 'hello' project:
<code>/job/hello/lastBuild/api/json</code>

The function <code>urlopen</code> from loaded <code>urllib.request</code> library can help us.

> In some sources you may see the <code>urllib2</code> library, but the 
> module was split into several modules in Python 3 called 
> <code>urllib.request</code> and <code>urllib.error</code>.

The response of json format we pass to json parser and print result status.

<details> <summary>Here you can see solution</summary>

```
import json, urllib.request

jenkins_url = ('{{TRAFFIC_HOST1_80}}')
jenkins_job = '/job/hello/lastBuild/api/json'

data = json.load(urllib.request.urlopen(jenkins_url + jenkins_job))
print(data['result'])
```
</details>

In this task we also could use appropriate libraries.