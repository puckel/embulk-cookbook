# Encoding: utf-8
name             'embulk'
maintainer       'Matthieu Roisil'
maintainer_email 'contact@puckel.fr'
license          'Apache 2.0'
description      'Installs and configures Embulk'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

depends 'apt'
depends 'yum'
depends 'chef-sugar'
depends 'ark'

issues_url       'https://github.com/puckel/embulk/issues'
source_url       'https://github.com/puckel/embulk'

chef_version '>= 12.4' if respond_to?(:chef_version)
