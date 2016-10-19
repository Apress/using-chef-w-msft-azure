#
# Cookbook Name:: provision
# Recipe:: default
#
# Copyright (c) 2015 Stuart Preston, All Rights Reserved.

require 'chef/provisioning/azurerm'
with_driver 'AzureRM:b6e7eee9-YOUR-GUID-HERE-03ab624df016'

azure_resource_group 'chef-azure-book' do
  location 'West Europe'
  tags CreatedFor: 'Using Chef with Microsoft Azure book'
end

azure_resource_template "chef-azure-deployment" do
  resource_group "chef-azure-book"
  template_source "cookbooks/provision/files/default/azuredeploy.json"
  parameters  dnsLabelPrefix: 'chef-azure-book',
              vmName: 'chefazurevm',
              adminUsername: 'azure',
              adminPassword: 'P2ssw0rd',
              rdpPort: 3389
end
