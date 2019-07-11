#!/bin/bash

#  @uthor and collected by Makram Jandar _     _    _    _    _    _
#    / \  / \  / \  / \  / \  / \  / \  / \   / \  / \  / \  / \  / \
#   ( F )( A )( S )( T )( D )( A )( T )( A ) ( T )( O )( O )( L )( S )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/   \_/  \_/  \_/  \_/  \_/
#                                               © Build FastData Tools

#set -o errexit
#set -o pipefail
#set -o nounset
#set -o xtrace

NAME=${PWD##*/}
docker build . -t "${NAME}"/tools
if [ $? -eq 0 ]; then
  docker rm -f "${NAME}"
  docker run -it -v "$PWD"/app:/root/app -p 8001:8001 --name "${NAME}" "${NAME}"/tools
fi
