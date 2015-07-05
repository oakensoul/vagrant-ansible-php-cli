# Vagrant Ansible PHP CLI

A Vagrant environment for creating a Box for running command line PHP scripts using the shell provisioner to run
Ansible. This box is not intended as a web server and doesn't have Apache/nginx installed.

## Usage
As mentioned, the output of this project is a Vagrant Box. To use the Box for one of your projects, simply
add the following to your Vagrantfile.

```bash
# Use Ansible PHP CLI box
  config.vm.box = "oakensoul/ansible-php-cli"
```

## Contributing
### Contributing Guidelines
If you would like to contribute to this project, please read the [Contributing Guidelines](CONTRIBUTING.md)
documentation.

### Dependencies

To use this development environment, you must have Vagrant and VirtualBox installed.

We also recommend using the vagrant plugin "vagrant-vbguest" to prevent the VirtualBox guest additions from getting
out of sync.

```bash
$ vagrant plugin install vagrant-vbguest
```

### Setup

To begin using the environment, you will need to clone it from GitHub.

```bash
$ git clone git@github.com:oakensoul/vagrant-ansible-php-cli.git
```

### Ansible Galaxy

This project uses Ansible Galaxy, if you wish to commit back an update that uses a new role, place them in the
`ansible/localhost/galaxy-requirements.yml` file. For example, if you wished to install GeerlingGuy's Firewall role,
place a section like the following into the yml file.

```bash
# Install GeerlingGuy's Firewall Role
#   https://galaxy.ansible.com/list#/roles/451
#   https://github.com/geerlingguy/ansible-role-firewall
- src: geerlingguy.firewall
```

Once you have updated the `galaxy-requirements.yml` file, you will need to uncomment the line in the
`ansible/localhost/provision.sh` file that runs ansible galaxy.

### Vagrant

Once you have the repository cloned, you need only spin up your Vagrant environment. If you need information about
how to use Vagrant, please see the http://vagrantup.com website. For this documentation, we'll assume you have at
least entry level Vagrant knowledge. If you don't, feel free to use the Issues section of the repository to ask questions.

In order to get Ansible installed inside the Guest VM, you will notice inside the Vagrantfile a section using the
shell provisioner. In case you're curious, we've used this approach to install Ansible as provided by
[Rob Allen](https://github.com/akrabat) in his
[blog post](http://akrabat.com/computing/provisioning-with-ansible-within-the-vagrant-guest/) about such things.

As he mentions, the reason for this is that we don't want to rely on the Host machine to have Ansible installed, that
dirties up your machine with even more stuff to maintain... and it doesn't follow the Infrastructure as Code requirement
of our team!

One thing to note, your project directory is mapped inside the Guest VM in the folder `/vagrant`.

### Automation and Development

Now that you've got your development environment, simply ssh into the Guest VM and off you go. To customize your
dev environment use the included Ansible playbooks, or add new sub modules under the ansible/playbooks folder. If
you've never used Ansible, we would recommend you pause and run through some internet learning on Ansible.

* http://www.ansible.com/get-started
* http://www.ansible.com/resources
* http://docs.ansible.com/intro_getting_started.html
