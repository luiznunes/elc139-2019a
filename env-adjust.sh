#!/bin/sh

echo "alias ssh-cluster='ssh ltheodorico581rs@cluster-paralela'" >> ~/.bashrc
sudo su root -c "echo \"echo \"131.96.171.112 cluster-paralela\" >> /etc/hosts\" | sudo bash"
cp id_rsa ~/.ssh/id_rsa_cluster
echo "***** Verify SSH key name *****"