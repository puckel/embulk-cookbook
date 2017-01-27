# Encoding: utf-8

require_relative 'spec_helper'

describe 'embulk::default' do
  # before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version) do |node, server|
            node_resources(node) # data for this node
            stub_chef_zero(platform, version, server) # stub other nodes in chef-zero
            node.automatic['embulk']['user'] = 'rspec'
            node.automatic['embulk']['group'] = 'rspec'
            node.automatic['embulk']['home'] = '/home/rspec'
          end.converge(described_recipe)
        end
        %w(
          /home/rspec/.embulk/
          /home/rspec/.embulk/bin
        ).each do |dir|
          it 'should delete the directory: ' + dir do
            expect(chef_run).to create_directory(dir)
          end
        end
        it 'creates /etc/profile.d/embulk.sh' do
          expect(chef_run).to create_cookbook_file('/etc/profile.d/embulk.sh')
        end

        it 'Get Embulk client from remote' do
          expect(chef_run).to create_remote_file('embulk-latest')
        end
        # any platform specific data you want available to your test can be loaded here
        _property = load_platform_properties(platform: platform, platform_version: version)
      end
    end
  end
end
