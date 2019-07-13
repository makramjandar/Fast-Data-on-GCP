#!/bin/sh

#  @uthor and collected with ❤️ by Makram Jandar    _
#    / \  / \  / \   / \  / \  / \  / \  / \  / \  / \
#   ( S )( E )( T ) ( P )( R )( O )( F )( I )( L )( E )
#    \_/  \_/  \_/   \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                                        © Set Profile

read -p "Enter Your User name: " USERNAME
read -p "Enter Your Project Id: " PROJECTID

cat >profile <<EOF
#!/bin/bash

#  @uthor and collected with ❤️ by Makram Jandar
#   / \  / \  / \  / \  / \  / \  / \\
#  ( P )( R )( O )( F )( I )( L )( E )
#   \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                        © Set Profile

source /root/google-cloud-sdk/completion.bash.inc
source /root/google-cloud-sdk/path.bash.inc

#    / \  / \  / \  / \\
#   ( U )( S )( E )( R )
#    \_/  \_/  \_/  \_/

export USER=$USERNAME

#    / \  / \  / \  / \  / \  / \  / \  / \  / \\
#   ( T )( E )( R )( R )( A )( F )( O )( R )( M )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/

export GCLOUD_PROJECT=$PROJECTID
export GCLOUD_REGION=us-central1
export GCLOUD_ZONE=us-central1-a

#    / \  / \  / \  / \  / \  / \  / \\
#   ( A )( N )( S )( I )( B )( L )( E )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/

export GCE_PROJECT=\$GCLOUD_PROJECT
export GCE_PEM_FILE_PATH=~/app/credential.json
export GCE_EMAIL=\$(grep client_email \$GCE_PEM_FILE_PATH | sed -e 's/  "client_email": "//g' -e 's/",//g')

#    / \  / \  / \  / \  / \  / \\
#   ( G )( C )( L )( O )( U )( D )
#    \_/  \_/  \_/  \_/  \_/  \_/

gcloud auth activate-service-account --key-file \$GCE_PEM_FILE_PATH
gcloud config set project \$GCLOUD_PROJECT
gcloud config set compute/region \$GCLOUD_REGION
gcloud config set compute/zone \$GCLOUD_ZONE
EOF

echo "Welcome $USERNAME!"
