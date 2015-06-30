Vagrant.configure('2') do |config|
    config.vm.box = 'azure'
    config.vm.provider :azure do |azure, override|
        override.vm.synced_folder ".", "/vagrant", disabled: true
        azure.mgmt_certificate = 'PEM Certificate'
        azure.mgmt_endpoint = 'https://management.core.windows.net'
        azure.subscription_id = 'Azure Subscription Id'
        
        azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140416.1-en-us-30GB'
        azure.vm_user = 'VM User' # defaults to 'vagrant' if not provided
        azure.vm_password = 'VM User Password' # min 8 characters. should contain a lower case letter, an uppercase letter, a number and a special character

        azure.vm_name = 'VM Name' # max 15 characters. contains letters, number and hyphens. can start with letters and can end with letters and numbers
        azure.cloud_service_name = '' # same as vm_name. leave blank to auto-generate
        #azure.deployment_name = '' # defaults to cloud_service_name
        azure.vm_location = 'West Europe' # e.g., West US
      #azure.private_key_file = 'C:\Users\PSawicz\myPrivateKey'
      azure.certificate_file = 'SSL PFX Certificate'

      # Provide the following values if creating a *Nix VM
      azure.ssh_port = '22'
      azure.tcp_endpoints = '3389:53389' # opens the Remote Desktop internal port that listens on public port 53389. Without this, you cannot RDP to a Windows VM.
    end

    config.ssh.username = 'VM User' # the one used to create the VM
    config.ssh.password = 'VM User Password' # the one used to create the VM
    config.vm.provision "file", source: "./configs/server_token.txt", destination: "/home/azureuser/.klei/DoNotStarveTogether/server_token.txt"
    config.vm.provision "file", source: "./configs/settings.ini", destination: "/home/azureuser/.klei/DoNotStarveTogether/settings.ini"
    config.vm.provision "shell", path: "script.sh"
end
