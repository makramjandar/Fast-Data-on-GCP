#!/bin/bash

# @uthor and collected with ❤️ by Makram Jandar
#             / \  / \  / \  / \  / \  / \  / \
#            ( G )( C )( S )( F )( U )( S )( E )
#             \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                             © Install GCSFuse

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
# https://github.com/GoogleCloudPlatform/gcsfuse

# One-line install
# wget -O - -q 'https://raw.githubusercontent.com/makramjandar/Fast-Data-on-GCP/master/utils/gcsfuse.sh' | bash
