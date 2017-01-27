# Encoding: utf-8
name             'embulk_test'
maintainer       'Matthieu Roisil'
maintainer_email 'contact@puckel.fr'
license          'Apache 2.0'
description      'A wrapper cookbook for use in testing that embulk cookbook works well with wrappers calling it'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
depends 'yum'
depends 'chef-sugar'
depends 'embulk'
