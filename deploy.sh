#!/usr/bin/env bash

TAG=${1}
export BUILD_NUMBER=${TAG}
for f in ./deploy/tmpl/*.yml
do
  envsubst < $f > "./deploy/.generated/$(basename $f)"
done

kubectl apply -f ./deploy/.generated/

