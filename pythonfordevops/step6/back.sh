#!/bin/bash

docker pull isierov/jenkins_builds:latest
docker run --name jenkins -p 8080:8080 -d isierov/jenkins_builds:latest