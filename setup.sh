#!/bin/bash
rm -rf /etc/puppetlabs/puppet/manifests
rm -rf /etc/puppetlabs/puppet/puppet.conf
ln -s /vagrant/puppet /etc/puppetlabs/puppet/manifests
ln -s /vagrant/puppet/puppet.conf /etc/puppetlabs/puppet/puppet.conf
/etc/init.d/pe-puppet restart && /etc/init.d/pe-httpd restart
