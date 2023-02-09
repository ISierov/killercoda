#!/bin/bash

docker run -d -u root --rm --name jenkins -p 8080:8080 -p 50000:50000 --entrypoint bash jenkins:2.46.2-alpine -c "tail -F /jenkins.log"

docker exec -d jenkins bash -c 'git clone https://github.com/ISierov/jenkins_home_alpine && export JENKINS_HOME=$(pwd)/jenkins_home_alpine && java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log &'

#wget http://host01:8080/job/hello/build
#curl -X POST http://host01:8080/jenkins/createItem?name=<item_name> --user admin
#curl -X POST https://3d766451-45c4-40ea-9e47-b58a0f46cdf7-10-244-30-155-8080.spch.r.killercoda.com/job/hello1/configSubmit
#curl -X POST https://3d766451-45c4-40ea-9e47-b58a0f46cdf7-10-244-30-155-8080.spch.r.killercoda.com/job/hello1/build?delay=0sec