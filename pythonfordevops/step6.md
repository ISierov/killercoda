And finally, the last example that we are going to consider.

We have some Continuous Integration server - **Jenkins**.

The task: find out the status of the last project build - it is successful or not.

Your Jenkins url:
[ACCESS JENKINS]({{TRAFFIC_HOST1_8080}})

Let create our build by Jenkins:
![Picture 1](/pythonfordevops/assets/step1.png)

Enter name ("hello" for example):
![Picture 2](/pythonfordevops/assets/step2.png)

Just scroll down and press "Save":
![Picture 3](/pythonfordevops/assets/step3.png)

And start build now:
![Picture 4](/pythonfordevops/assets/step4.png)

Directory to get last build status API of 'hello' project:
<code>/job/hello/lastBuild/api/json</code>
You can write number of needed build instead 'lastBuild'.

The function <code>urlopen</code> from loaded <code>urllib.request</code> library can help us.

> In some sources you may see the <code>urllib2</code> library, but the 
> module was split into several modules in Python 3 called 
> <code>urllib.request</code> and <code>urllib.error</code>.

The response of json format we pass to json parser and print result status.

<details> <summary>Here you can see solution</summary>

```
import json, urllib.request

jenkins_url = ('{{TRAFFIC_HOST1_8080}}')
jenkins_job = ('/job/hello/lastBuild/api/json')

data = json.load(urllib.request.urlopen(jenkins_url + jenkins_job))
print(data['result'])
```
</details>

In this task we also could use appropriate libraries.