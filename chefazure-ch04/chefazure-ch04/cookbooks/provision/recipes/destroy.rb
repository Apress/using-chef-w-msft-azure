#
# Cookbook Name:: provision
# Recipe:: destroy
#
# Copyright (c) 2015 Stuart Preston, All Rights Reserved.

require 'chef/provisioning/azurerm'
with_driver 'AzureRM:b6e7eee9-YOUR-GUID-HERE-03ab624df016'

azure_resource_group 'chef-azure-book' do
  action :destroy
end
