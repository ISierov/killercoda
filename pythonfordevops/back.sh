#!/bin/bash

#docker run -d -u root --rm --name jenkins -p 8080:8080 -p 50000:50000 --entrypoint bash jenkins:2.46.2-alpine -c "tail -F /jenkins.log"

#docker exec -d jenkins bash -c 'git clone https://github.com/ISierov/jenkins_home_alpine && export JENKINS_HOME=$(pwd)/jenkins_home_alpine && java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log &'


#docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home -e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" --name jenkins jenkins/jenkins:lts

#java -jar jenkins-cli.jar -s https://b8bd8c51-0fc7-4190-8770-6a37eb817013-10-244-29-162-8080.spch.r.killercoda.com/

#docker run --rm -it openjdk:11 java -jar jenkins-cli.jar -s https://b8bd8c51-0fc7-4190-8770-6a37eb817013-10-244-29-162-8080.spch.r.killercoda.com/
#curl -o jenkins-cli.jar https://b8bd8c51-0fc7-4190-8770-6a37eb817013-10-244-29-162-8080.spch.r.killercoda.co/jnlpJars/jenkins-cli.jar

echo {{TRAFFIC_HOST1_8080}} >> link.txt