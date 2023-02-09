#!/bin/bash

#docker run -d -u root --rm --name jenkins -p 8080:8080 -p 50000:50000 --entrypoint bash jenkins:2.46.2-alpine -c "tail -F /jenkins.log"

#docker exec -d jenkins bash -c 'git clone https://github.com/ISierov/jenkins_home_alpine && export JENKINS_HOME=$(pwd)/jenkins_home_alpine && java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log &'


docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home -e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" --name jenkins jenkins/jenkins:lts

crumb=$(curl -s -u admin:admin "https://{{TRAFFIC_HOST1_8080}}/crumbIssuer/api/xml" | grep '<crumb>' | sed 's/<crumb>//g' | sed 's/<\/crumb>//g')

curl -u admin:admin -H "Jenkins-Crumb: $crumb" -X POST "https://{{TRAFFIC_HOST1_8080}}/job/hello/build"
