# ROS - Docker
Just a repo for playing around with a ROS + Docker development flow

Currently the flow is:
1. docker build -t ur:dev-space
1. ./start.sh
1. Test out and build in the container
1. Continue editing code outside the container as the volume is shared

This mounts the repo directory into the docker container. Additionally, it forwards X so that GUI applications still work.


