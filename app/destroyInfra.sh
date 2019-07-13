#!/bin/sh

#   @uthor and collected with ❤️ by Makram Jandar  _
#    / \  / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( D )( E )( P )( L )( O )( Y )( M )( E )( N )( T )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/
#                             © Destroy Infrastructure

#    / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( T )( E )( R )( R )( A )( F )( O )( R )( M )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/

terraform destroy -var "gce_zone=${GCLOUD_ZONE}" -var "gce_project=${GCLOUD_PROJECT}" -var "gce_ssh_user=${USER}" -force terraform/

#    / \  / \  / \  / \  / \
#   ( F )( I )( L )( E )( S )
#    \_/  \_/  \_/  \_/  \_/

rm /root/app/terraform.tfstate*
rm /root/app/ansible/external.cfg
rm /root/app/ansible/internal.cfg
rm /root/app/ansible/vars.yml
rm -rf /root/app/ansible/sshkeys/
rm /root/profile
