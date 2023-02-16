#!/bin/bash



# Build the Jenkins Docker image
docker build -t jenkins .

# Create the jenkins_data directory if it doesn't exist
if [ ! -d "$HOME/jenkins_data" ]; then
  mkdir "$HOME/jenkins_data"
fi

cd $HOME/jenkins_data
git clone https://github.com/ISierov/jenkins_empty.git

# Start a Docker container from the my-jenkins image
docker run -d -p 8080:8080 -v "$HOME/jenkins_data/jenkins_empty:/var/jenkins_home" jenkins