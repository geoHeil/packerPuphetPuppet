# Explanation 
This is a repo to illustrate my problems with the combination of packer puphpet and puppet. https://github.com/chef/bento is the basis I try to build upon.

I am using their basebox **ubuntu-14.04-amd64.json**
# Bento

Bento is a project that encapsulates [Packer](http://packer.io) templates for building
[Vagrant](http://vagrantup.com) baseboxes. We use these boxes internally at Chef Software, Inc. for
testing Hosted Chef, Chef Server and our open source [cookbooks](https://supermarket.chef.io/users/chef)
via [test-kitchen](http://kitchen.ci/).

# follow alog to replicate my problem:

First, install [Packer](http://packer.io) and then clone this project.

Inside the directory, a JSON file describes each box that can be built. I use **ubuntu-14.04-amd64.json**. As I use paralells the following command will only build a parallels box: `packer build -only=parallels-iso ubuntu-14.04-amd64.json `

# Description of the problemm
The installation works fine. Parallels tools are installed as supposed. However there are problems with *puppet* reading the modules created by *puphpet*

## Example of the error code
```
==> parallels-iso: Provisioning with Puppet...
    parallels-iso: Creating Puppet staging directory...
    parallels-iso: Uploading hiera configuration...
    parallels-iso: Uploading manifest directory from: puphpet/puppet
    parallels-iso:
    parallels-iso:
    parallels-iso:
    parallels-iso: Uploading local modules from: puphpet/puppet/modules
    parallels-iso: Uploading manifests...
    parallels-iso: Running Puppet:   sudo -E puppet apply --verbose --modulepath='/tmp/packer-puppet-masterless/module-0' --hiera_config='/tmp/packer-puppet-masterless/hiera.yaml' --manifestdir='/tmp/packer-puppet-masterless/manifests' --detailed-exitcodes /tmp/packer-puppet-masterless/manifests/site.pp
    parallels-iso: sudo: puppet: command not found
==> parallels-iso: Unregistering virtual machine...
==> parallels-iso: Deleting output directory...
Build 'parallels-iso' errored: Puppet exited with a non-zero exit status: 1
```