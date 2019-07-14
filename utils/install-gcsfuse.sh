#!/bin/bash

# @uthor and collected with ❤️ by Makram Jandar
#             / \  / \  / \  / \  / \  / \  / \
#            ( G )( C )( S )( F )( U )( S )( E )
#             \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                             © Install GCSFuse

# Add the gcsfuse distribution URL as a package source and import its public key:
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && \
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list && \
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
# Update the list of packages available and install gcsfuse.
sudo apt-get update -y && \
sudo apt-get install gcsfuse -y 

# References
# https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/installing.md

# One-line install
# wget -O - -q 'https://raw.githubusercontent.com/makramjandar/Fast-Data-on-GCP/master/utils/gcsfuse.sh' | bash
