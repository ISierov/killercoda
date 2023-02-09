#!/bin/bash

# Start the Jenkins Docker container
docker run --name jenkins-instance -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts &

# Wait for Jenkins to start
sleep 20

# Create the "HelloWorldJob" job
curl -X POST http://admin:admin@localhost:8080/createItem?name=HelloWorldJob -H "Content-Type:application/xml" --data-binary @config.xml

# Output the URL to access Jenkins in a web browser
echo "Jenkins is now running at your localhost"
