#!/bin/bash
if [[ $GIT_BRANCH == "dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u jatuluva -p $DOCKER_PASSWORD
    docker tag test jatuluva/dev
    docker push jatuluva/dev

elif [[ $GIT_BRANCH == "main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u jatuluva -p $DOCKER_PASSWORD
    docker tag test jatuluva/prod 
    docker push jatuluva/prod
fi
