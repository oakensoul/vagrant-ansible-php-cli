[![Build Status](https://travis-ci.org/web-masons/vagrant-ansible-php-cli.svg)](https://travis-ci.org/web-masons/vagrant-ansible-php-cli)
# Vagrant Ansible PHP CLI

Are you looking to work on a PHP CLI project, but don't want to handle all of
the various steps required to get it set up on your machine? Virtual Machines
are the answer, and this project creates a VM for you using either Ubuntu 14.04
or Ubuntu 12.04. These machines can also be used as the starting point for
creating your production server. These boxes are created from a base box
of [Ansible Citadel](https://github.com/web-masons/vagrant-ansible-citadel) with
additional Ansible Playbooks adding PHP 5.6.

There is no webserver installed however, though i'll likely create another
project that creates the start of a production web server for PHP 5.6.

In theory, you could also use PHP's built in "web-server" to test modules you
are developing as well without the effort of setting up Apache or nginx.

## Usage
The output of this project is a collection of Vagrant Boxes. To use one of the
Boxes for one of your projects, simply add the following to your Vagrantfile.

```bash
  # Use Ansible Citadel based on ubuntu/trusty64
  config.vm.box = "oakensoul/ansible-php-cli-trusty64"

  # Use Ansible Citadel based on hashicorp/precise64
  config.vm.box = "oakensoul/ansible-php-cli-precise64"
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
