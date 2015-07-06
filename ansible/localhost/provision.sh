#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing Ansible:"
    export DEBIAN_FRONTEND=noninteractive

    echo "  1/5. Update apt"
    apt-get update -qq

    echo "  2/5. Install python-software-properties python-apt python-pycurl"
    apt-get install -qq python-software-properties python-apt python-pycurl &> /dev/null || exit 1

    echo "  3/5. Add Ansible PPA"
    apt-add-repository ppa:ansible/ansible &> /dev/null || exit 1

    echo "  4/5. Update apt to grab new PPA info for Ansible"
    apt-get update -qq

    echo "  5/5. Install Ansible"
    apt-get install -qq ansible &> /dev/null || exit 1

    echo "Ansible installed"

    echo "Upgrading all packages"
    apt-get dist-upgrade
fi

cd /vagrant/ansible
ansible-playbook localhost/vagrant.yml --inventory-file=inventory/vagrant.ini --connection=local
