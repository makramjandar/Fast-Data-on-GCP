#!/bin/bash

#  @uthor and collected by Makram Jandar
#  |    \|  |  |    |   \ |    |/    |     |   \  /   \   /  |  |/ ] /  _|    \
#  |  _  |  |  ||  ||    \ |  ||  o  |_____|    \|     | /  /|  ' / /  [_|  D  )
#  |  |  |  |  ||  ||  D  ||  ||     |     |  D  |  O  |/  / |    \|    _|    /
#  |  |  |  :  ||  ||     ||  ||  _  |_____|     |     /   \_|     |   [_|    \
#  |  |  |\   / |  ||     ||  ||  |  |     |     |     \     |  .  |     |  .  \
#  |__|__| \_/ |____|_____|____|__|__|     |_____|\___/ \____|__|\_|_____|__|\_|
#                                                    © Install nvidia-docker 2.0

# Set the repo and update using Ubuntu 18.04, so I follow the Debian settings:
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
sudo apt-key add -
dist=$(
  . /etc/os-release
  echo "$ID""$VERSION_ID"
)
curl -s -L https://nvidia.github.io/nvidia-docker/"$dist"/nvidia-docker.list | \
sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker 2.0 according to the guideline.
sudo apt-get install nvidia-docker2 && \
sudo pkill -SIGHUP dockerd

# Refs:
# https://nvidia.github.io/nvidia-docker/
# https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0)
# https://medium.com/@sh.tsang/docker-tutorial-5-nvidia-docker-2-0-installation-in-ubuntu-18-04-cb80f17cac65

# One-line install:
# wget -O - -q 'https://raw.githubusercontent.com/makramjandar/Fast-Data-on-GCP/master/utils/install-nvidia-docker2.sh' | bash
