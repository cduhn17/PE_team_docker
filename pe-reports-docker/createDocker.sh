#!/bin/bash

dockername='DevEnv'

if [ "$(docker ps -aq -f status=exited -f name=$dockername)" ]; then

  echo "The docker is exited and is now started"
  "$(docker start $dockername)"
elif [ ! "$(docker ps -q -f name=$dockername)" ]; then
  echo "The docker doesn not exist."
  echo "The docker $dockername is now being created..."

  docker build --no-cache -t pe-dev-environment . && docker run -t -i -h pe-reports-docker --name DevEnv --mount type=bind,src=/Users/duhnc/Desktop/allInfo/pe-reports-docker/env,dst=/run/env pe-dev-environment bash \
    && echo "A new docker: $dockername has been created and is running."

else
  echo "The container $dockername is running"

fi
