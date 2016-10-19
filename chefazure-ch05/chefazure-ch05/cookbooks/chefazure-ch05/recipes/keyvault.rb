require 'chef/provisioning/azurerm'
with_driver 'AzureRM:b6e7eee9-YOUR-GUID-HERE-03ab624df016'

azure_resource_group 'chefazure-shared' do
  location 'West Europe'
  tags CreatedFor: 'Using Chef with Microsoft Azure book'
end

azure_resource_template 'keyvault-deployment' do
  resource_group 'chefazure-shared'
  template_source 'cookbooks/chefazure-ch05/files/keyvault/deploy.json'
  parameters keyVaultName: 'chefazure',
             location: 'West Europe',
             tenantId: '9c117323-YOUR-GUID-HERE-9ee430723ba3',
             objectId: '38e8a50f-YOUR-GUID-HERE-a605e06e9695',
             keysPermissions: ['all'],
             secretsPermissions: ['all'],
             skuName: 'Standard',
             enableVaultForDeployment: true,
             enableVaultForDiskEncryption: false
end
