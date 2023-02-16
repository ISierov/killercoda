#!/bin/bash
cd /root
docker volume create jenkins_home
git clone https://github.com/ISierov/jenkins_empty.git
cd jenkins_empty
docker build -t myjenkins .
docker run -d -p 8080:8080 myjenkins
sleep 20
wget http://host1:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://host1:8080/ -webSocket build hello