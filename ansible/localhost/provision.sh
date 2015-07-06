#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Configuring the Server:"
    export DEBIAN_FRONTEND=noninteractive

    echo "  1/1. Upgrading all packages"
    apt-get -y dist-upgrade &> /dev/null || exit 1

fi

cd /vagrant/ansible
ansible-playbook localhost/vagrant.yml --inventory-file=inventory/vagrant.ini --connection=local
