#!/bin/bash

docker pull isierov/jenkins:v2
docker run --name jenkins -p 8080:8080 -d isierov/jenkins:v2