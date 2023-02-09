And finally, the last example that we are going to consider.

We have some Continuous Integration server - **Jenkins**.

The task: find out the status of the last project build - it is successful or not.

***
docker run -d -u root --rm --name jenkins -p 8080:8080 
-p 50000:50000 --entrypoint bash jenkins:2.46.2-alpine -c "tail -F /jenkins.log" 

docker exec -d jenkins bash -c 'git clone https://github.com/oveits/jenkins_home_alpine 
&& export JENKINS_HOME=$(pwd)/jenkins_home_alpine && java -jar /usr/share/jenkins/jenkins.war 2>&1 
1>/jenkins.log &'

docker exec -it jenkins bash -c "echo 'Build succeeded' && exit 0"

curl -X POST http://0.0.0.0:8080/job/job_name/build 
***

The function <code>urlopen</code> from loaded <code>urllib.request</code> library can help us.

> In some sources you may see the <code>urllib2</code> library, but the 
> module was split into several modules in Python 3 called 
> <code>urllib.request</code> and <code>urllib.error</code>.

The response of json format we pass to json parser and print result status.

<details> <summary>Here you can see solution</summary>

```
import json, urllib.request

jenkins_url = ({{TRAFFIC_HOST1_80}})
jenkins_job = '/lastBuild/api/json'

data = json.load(urllib.request.urlopen(jenkins_url + jenkins_job))
print(data['result'])
```
</details>

In this task we also could use appropriate libraries.