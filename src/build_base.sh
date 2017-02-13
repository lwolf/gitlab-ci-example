#!/usr/bin/env bash
username=${1}
password=${2}
registry=${3}

requirements_hash="$(md5sum requirements.txt | cut -d' ' -f1)"
curl -u ${username}:${password} https://${registry}/v2/${CI_PROJECT_NAME}/tags/list | grep ${requirements_hash}
if [ $? -ne 0 ]; then
    tag=${registry}/${CI_PROJECT_NAME}:${CI_BUILD_REF_NAME}-base-${requirements_hash}
    echo "going to build new base image ${tag}"
    tag_latest=${registry}/${CI_PROJECT_NAME}:${CI_BUILD_REF_NAME}-base-latest
    docker build -t ${tag} -f Dockerfile-base .
    docker tag ${tag} ${tag_latest}
    docker push ${tag}
    docker push ${tag_latest}
fi
