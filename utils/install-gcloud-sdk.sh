#!/bin/bash

# @uthor and collected with ❤️ by Makram Jandar    _
#    / \  / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( G )( C )( L )( O )( U )( D )( - )( S )( D )( K )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                                 © Install GCloud SDK

sudo apt-get install curl && \
sudo apt-get update && \
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
sudo apt-get update && sudo apt-get install google-cloud-sdk && \
gcloud init --console-only && \
gcloud config list

# References
# https://cloud.google.com/sdk/docs/downloads-apt-get

# One-line install
# wget -O - -q 'https://raw.githubusercontent.com/makramjandar/Fast-Data-on-GCP/master/utils/install-gcloud-sdk.sh' | bash
