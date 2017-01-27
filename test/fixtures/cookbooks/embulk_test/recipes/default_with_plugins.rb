# Encoding: utf-8
#
# Cookbook Name:: embulk_test
# Recipe:: default_with_plugins
#
# This cookbook is designed to be just embulk::default plus installing
# some plugins. We want to test the default plugin resource without any
# interesting overrides, but don't want to ship that as a recipe in the main
# cookbook (unlike install, configure, and service, which we do ship in the
# default cookbook).

include_recipe 'chef-sugar'

include_recipe 'embulk::default'

# by default, no plugins, but we do the x-pack
embulk_plugin 'embulk-input-http' do
  user node['embulk']['user']
  action :install
end

# remove a non-existent plugin
embulk_plugin 'pleasedontexist' do
  user node['embulk']['user']
  action :uninstall
end
