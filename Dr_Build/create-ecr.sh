#!/bin/bash

source Dr_Build/input.txt

output=$(aws ecr describe-repositories --repository-names $REPOSITORY_NAME 2>&1)

if [ $? -ne 0 ]; then
  if echo ${output} | grep -q RepositoryNotFoundException; then
    aws ecr create-repository --repository-name $REPOSITORY_NAME
  else
    echo "ECR Repository exists"
  fi
fi
