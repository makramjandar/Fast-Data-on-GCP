#!/bin/sh

# @uthor and collected by Makram Jandar    _    _    _
#    / \  / \  / \   / \  / \  / \   / \  / \  / \  / \
#   ( A )( D )( D ) ( S )( S )( H ) ( K )( E )( Y )( S )
#    \_/  \_/  \_/   \_/  \_/  \_/   \_/  \_/  \_/  \_/
#                           © Copy SSHkeys >> $HOME/.ssh
sudo mkdir -p "$HOME"/.ssh && \
sudo chmod -R 755 "$PWD"/app/ansible/sshkeys/ && \
sudo chmod -R 755 "$HOME"/.ssh/ && \
sudo cp -r -a "$PWD"/app/ansible/sshkeys/google_compute_engine* "$HOME"/.ssh/ && \
sudo chmod -R 400 "$HOME"/.ssh/ && \
sudo rm -rf "$PWD"/app/ansible/sshkeys/ && \
eval "$(ssh-agent)" && \

#    / \  / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( C )( O )( N )( F )( I )( G )( * )( G )( I )( T )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                        © Add SSHkey > GitHub account
echo "Copy/Paste output into https://github.com/settings/ssh/new" && \
sudo cat "$HOME"/.ssh/google_compute_engine.pub && \
sleep 30 && \

#    / \  / \  / \   / \  / \  / \  / \  / \  / \  / \
#   ( G )( C )( P ) ( B )( U )( C )( K )( E )( T )( S )
#    \_/  \_/  \_/   \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                                   © Mount GCP Buckets
mv "$PWD"/app/delivery/bash_mount_gcp_buckets "$HOME"/.bash_mount_gcp_buckets && \
. "$HOME"/.bash_mount_gcp_buckets && \
#. "$HOME"/.bashrc && \

#    / \  / \   / \
#   ( O )( K ) ( 👌 )
#    \_/  \_/   \_/
wget -O - -q 'https://gist.githubusercontent.com/makramjandar/05d08d290adf4970e39e93d30bf670a3/raw/6f427b8db9619e1a552880de393220548b508015/shell-matrix.sh' | bash && \
sleep 20 && \
echo "👌"
