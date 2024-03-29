# Grab ROS melodic
FROM ros:melodic

# Update and clean
RUN apt-get update && apt-get install -y \
    build-essential \
    ros-melodic-desktop-full \
    screen \
    iputils-ping

# Add any required ROS packages here -------------------
RUN apt-get install -y \
    ros-melodic-video-stream-opencv

# -----------------------------------------------------

# Change to bash
SHELL ["/bin/bash", "-c"]

# Setup X forwarding for graphics
# Replace 1000 with your user / group id  -- id -u <user> && id -g <user>
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer

# Source ROS setup
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc

# Setup screen
RUN echo "defshell -bash" >> ~/.screenrc






