# Explanation 
This is a repo to illustrate my problems with the combination of packer puphpet and puppet. https://github.com/chef/bento is the basis I try to build upon.

I am using their basebox **ubuntu-14.04-amd64.json**

### Bento

Bento is a project that encapsulates [Packer](http://packer.io) templates for building
[Vagrant](http://vagrantup.com) baseboxes. We use these boxes internally at Chef Software, Inc. for
testing Hosted Chef, Chef Server and our open source [cookbooks](https://supermarket.chef.io/users/chef)
via [test-kitchen](http://kitchen.ci/).

# Follow along to replicate my problem:

First, install [Packer](http://packer.io) and then clone this project.

Inside the directory, a JSON file describes each box that can be built. I use **ubuntu-14.04-amd64.json**. As I use paralells the following command will only build a parallels box: 

`packer build -only=parallels-iso ubuntu-14.04-amd64.json`

# Description of the problemm

The problem appears when puppet is launched via packer. There are issues with puppets modules and thus `packer-build` fails. However the same puppet files do work with vagrant.

The installation works fine. Parallels tools are installed as supposed. However there are problems with *puppet* reading the modules created by *puphpet*

## Example of the error code

so the commad is actually executed as follows
```
==> parallels-iso: Provisioning with Puppet...
    parallels-iso: Creating Puppet staging directory...
    parallels-iso: Uploading hiera configuration...
    parallels-iso: Uploading manifest directory from: puphpet/puppet
    parallels-iso: Uploading local modules from: puphpet/puppet/modules
    parallels-iso:
    parallels-iso:
    parallels-iso: Uploading manifests...
    parallels-iso:
    parallels-iso: Running Puppet:   sudo -E puppet apply --verbose --modulepath='/tmp/packer-puppet-masterless/module-0' --hiera_config='/tmp/packer-puppet-masterless/hiera.yaml' --manifestdir='/tmp/packer-puppet-masterless/manifests' --detailed-exitcodes /tmp/packer-puppet-masterless/manifests/site.pp
```
and results in the following error after a couple of packages have been parsed by puppet:
```
parallels-iso: Info: Loading facts in /tmp/packer-puppet-masterless/module-0/php/lib/facter/php_fact_extension_dir.rb
    parallels-iso: Error: Could not parse for environment production: Syntax error at '{'; expected '}' at /tmp/packer-puppet-masterless/manifests/nodes/Postgresql.pp:57 on node vagrant.vm
    parallels-iso: Error: Could not parse for environment production: Syntax error at '{'; expected '}' at /tmp/packer-puppet-masterless/manifests/nodes/Postgresql.pp:57 on node vagrant.vm
==> parallels-iso: Unregistering virtual machine...
==> parallels-iso: Deleting output directory...
Build 'parallels-iso' errored: Puppet exited with a non-zero exit status: 1

==> Some builds didn't complete successfully and had errors:
--> parallels-iso: Puppet exited with a non-zero exit status: 1
```