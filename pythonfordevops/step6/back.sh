#!/bin/bash

docker run -d -u root --rm --name jenkins -p 8080:8080 -p 50000:50000 --entrypoint bash jenkins:2.46.2-alpine -c "tail -F /jenkins.log"

docker exec -d jenkins bash -c 'git clone https://github.com/ISierov/jenkins_empty && export JENKINS_HOME=$(pwd)/jenkins_empty && java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log &'
