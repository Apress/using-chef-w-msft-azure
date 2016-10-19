require 'chef/provisioning/azurerm'
with_driver 'AzureRM:b6e7eee9-YOUR-GUID-HERE-03ab624df016'

azure_resource_group 'chefazure-ch05-ne' do
  location 'North Europe'
  tags CreatedFor: 'Using Chef with Microsoft Azure book'
end

azure_resource_template 'chefazure-ch05-datafactory-deployment' do
  resource_group 'chefazure-ch05-ne'
  template_source 'cookbooks/chefazure-ch05/files/data_factory/deploy.json'
  parameters name: 'chefazure-ch05-datafactory',
             location: 'North Europe'
end
