#install a more recent ruby & install puppet

gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source /usr/local/rvm/scripts/rvm

if [[ -f '/root/.bashrc' ]] && ! grep -q 'source /usr/local/rvm/scripts/rvm' /root/.bashrc; then
    echo 'source /usr/local/rvm/scripts/rvm' >> /root/.bashrc
fi

if [[ -f '/etc/profile' ]] && ! grep -q 'source /usr/local/rvm/scripts/rvm' /etc/profile; then
    echo 'source /usr/local/rvm/scripts/rvm' >> /etc/profile
fi


/usr/local/rvm/bin/rvm cleanup all
gem update --system >/dev/null
echo 'y' | rvm rvmrc warning ignore all.rvmrcs

echo 'Finished installing RVM and Ruby 1.9.3'
echo 'Starting installing puppet'
#NOT needed as this part would install a puppet too new for puphpet
#wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb -P /tmp
#dpkg -i /tmp/puppetlabs-release-trusty.deb
#apt-get update 

apt-get install -y puppet=3.4.3-1ubuntu1.1
echo 'Finished installing Puppet 3.4.3'
