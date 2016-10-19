include_recipe 'jenkins::master'

package 'git' do
  action :install
end

jenkins_plugin 'github' do
  action :install
  notifies :restart, 'service[jenkins]', :delayed
end

jenkins_plugin 'build-pipeline-plugin' do
  action :install
  notifies :restart, 'service[jenkins]', :delayed
end

package 'build-essential' do
  action :install
end

gem_package 'chef-provisioning' do
  action :install
end

gem_package 'chef-provisioning-azurerm' do
  action :install
end

gem_package 'rspec' do
  action :install
end

gem_package 'rake' do
  action :install
end

gem_package 'rubocop' do
  action :install
end

file '/etc/chef/client.pem' do
  owner 'root'
  group 'jenkins'
  mode '0640'
end

file '/etc/chef/validation.pem' do
  owner 'root'
  group 'jenkins'
  mode '0640'
end

template '/etc/chef/client-provisioning.rb' do
  source 'client-provisioning.erb'
  owner 'root'
  group 'jenkins'
  mode '0640'
end
