#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u jatuluva8888 -p $DOCKER_PASSWORD
    docker tag test jatuluva8888/dev
    docker push jatuluva8888/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u jatuluva8888 -p $DOCKER_PASSWORD
    docker tag test jatuluva8888/prod 
    docker push jatuluva8888/prod
fi
