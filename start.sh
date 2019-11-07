#!/usr/bin/env bash

NAME=ros-dev

# Check if container exists already
if [ "$(docker ps -a | grep $NAME )" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$NAME )" ]; then
        # cleanup if it exited
        docker container rm $NAME
    else
        # currently running
        printf "Instance currently running, please run: \n  docker stop $NAME \nprior to starting a new instance"
        exit 1
    fi
fi

# Spin up the container
docker run \
    -it \
    -v $PWD:/root/catkin_ws \
    -e CATKIN_WS='/root/catkin_ws' \
    -w "/root/catkin_ws" \
    -v ~/.ssh:/root/.ssh \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name $NAME \
    ur:dev-space

