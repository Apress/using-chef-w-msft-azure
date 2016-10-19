require 'chef/provisioning/azurerm'
with_driver 'AzureRM:b6e7eee9-YOUR-GUID-HERE-03ab624df016'

azure_resource_group 'chefazure-ch05' do
  location 'West Europe'
  tags CreatedFor: 'Using Chef with Microsoft Azure book'
end

azure_resource_template 'chefazure-ch05-vm-deployment' do
  resource_group 'chefazure-ch05'
  template_source 'cookbooks/chefazure-ch05/files/winrm_winserver/deploy.json'
  parameters newStorageAccountName: 'chefazurech05',
             dnsNameForPublicIP: 'chefazure-ch05-vm',
             adminUsername: 'azure',
             adminPassword: 'P2ssw0rd',
             imagePublisher: 'MicrosoftWindowsServer',
             imageOffer: 'WindowsServer',
             imageSKU: '2012-R2-Datacenter',
             location: 'West Europe',
             vmName: 'ch05vm',
             vmSize: 'Standard_D2',
             vaultName: 'chefazure',
             vaultResourceGroup: 'chefazure-shared',
             certificateUrl: 'https://chefazure.vault.azure.net:443/secrets/vmselfcert/02a48bca5dbf42228a170c6ebab476af'
end
