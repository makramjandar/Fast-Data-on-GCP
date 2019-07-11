#!/bin/sh

#   @uthor and collected by Makram Jandar     _    _
#    / \  / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( D )( E )( P )( L )( O )( Y )( M )( E )( N )( T )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                              © Deploy Infrastructure

export ETCD_VERSION=v3.3.5
export CNI_VERSION=0.3.1
export CNI_PLUGINS_VERSION=v0.6.0
export CONTAINERD_VERSION=1.2.0-rc.0
#export PROJECT= gcloud config list --format 'value(core.project)' 2>/dev/null
#`date +%Y-%m-%d`

#    / \  / \  / \
#   ( S )( S )( H )
#    \_/  \_/  \_/

rm -f /root/.ssh/google_compute_engine*
ssh-keygen -q -P "" -f /root/.ssh/google_compute_engine
mkdir /root/app/ansible/sshkeys/
cp -r -a /root/.ssh/google_compute_engine* /root/app/ansible/sshkeys/

#    / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( T )( E )( R )( R )( A )( F )( O )( R )( M )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/

terraform init terraform
terraform apply -auto-approve -var "gce_zone=${GCLOUD_ZONE}" -var "gce_ssh_user=${USER}" -var "gce_project=${GCLOUD_PROJECT}" terraform

#    / \  / \  / \   / \  / \  / \  / \  / \  / \  / \
#   ( G )( C )( P ) ( B )( U )( C )( K )( E )( T )( S )
#    \_/  \_/  \_/   \_/  \_/  \_/  \_/  \_/  \_/  \_/

cd /root/app/delivery
cat >bash_mount_gcp_buckets <<EOF
[ -d ~/buckets ] || mkdir -p ~/buckets
[ -d ~/buckets/${GCLOUD_PROJECT} ] || mkdir -p ~/buckets/${GCLOUD_PROJECT}
[ -d ~/buckets/${GCLOUD_PROJECT}/bckp ] || mkdir -p ~/buckets/${GCLOUD_PROJECT}/bckp
[ -d ~/buckets/${GCLOUD_PROJECT}/code ] || mkdir -p ~/buckets/${GCLOUD_PROJECT}/code
[ -d ~/buckets/${GCLOUD_PROJECT}/data ] || mkdir -p ~/buckets/${GCLOUD_PROJECT}/data
sudo umount ~/buckets/${GCLOUD_PROJECT}/bckp
sudo umount ~/buckets/${GCLOUD_PROJECT}/code
sudo umount ~/buckets/${GCLOUD_PROJECT}/data
gcsfuse --implicit-dirs --dir-mode "777" -o nonempty ${GCLOUD_PROJECT}-bckp ~/buckets/${GCLOUD_PROJECT}/bckp
gcsfuse --implicit-dirs --dir-mode "777" -o nonempty ${GCLOUD_PROJECT}-code ~/buckets/${GCLOUD_PROJECT}/code
gcsfuse --implicit-dirs --dir-mode "777" -o nonempty ${GCLOUD_PROJECT}-data ~/buckets/${GCLOUD_PROJECT}/data                                                              
EOF

#    / \  / \  / \  / \  / \  / \  / \\
#   ( A )( N )( S )( I )( B )( L )( E )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/
cd /root/app/ansible

cat >vars.yml <<EOF
user: "${USER}"
home: "/home/{{ user }}"
EOF

cat >internal.cfg <<EOF
[all]
$(gcloud compute instances list --format="table(NAME,INTERNAL_IP)" | grep -v NAME | awk '{ print $2 }')
[microvm-f-vms]
$(gcloud compute instances list --format="table(NAME,INTERNAL_IP)" --filter="(tags.items:microvm-f-vm)" | grep -v NAME | awk '{ print $2 }')
[gpuv100-p-vms]
$(gcloud compute instances list --format="table(NAME,INTERNAL_IP)" --filter="(tags.items:gpuv100-p-vm)" | grep -v NAME | awk '{ print $2 }')
EOF

cat >external.cfg <<EOF
[all]
$(gcloud compute instances list --format="table(NAME,EXTERNAL_IP)" | grep -v NAME | awk '{ print $2 }')
[microvm-f-vms]
$(gcloud compute instances list --format="table(NAME,EXTERNAL_IP)" --filter="(tags.items:microvm-f-vm)" | grep -v NAME | awk '{ print $2 }')
[gpuv100-p-vms]
$(gcloud compute instances list --format="table(NAME,EXTERNAL_IP)" --filter="(tags.items:gpuv100-p-vm)" | grep -v NAME | awk '{ print $2 }')
EOF

ansible-playbook -i /root/app/ansible/external.cfg /root/app/ansible/deploy.yml
