# vagrant-dontstarve
## What it is ?
This is basic vagrant file with shell provisioning that allows everyone quickly spin up your own machine on Azure

###Available providers 
1. Azure - done

### Prerequisites
1. Azure [account](https://account.windowsazure.com)
2. Installed Vagrant - https://www.vagrantup.com/

### Getting started

1. Simply ```git clone git@github.com:pawelsawicz/vagrant-dontstarve.git```
2. Copy your server_token.txt file ```./configs``` in your vagrant-dontstarve folder http://dont-starve-game.wikia.com/wiki/Guides/Don%E2%80%99t_Starve_Together_Dedicated_Servers#Server_Tokens
3. Customize ```./configs/settings.ini``` (optional)
4. Open Vagrantfile and change fallowing paramaters. For certification see this section
5. ```vagrant up```

### Certification, how to generate ?
[Certification](https://github.com/MSOpenTech/vagrant-azure#certificate-generation) is copied from [vagrant-azure](https://github.com/MSOpenTech/vagrant-azure) repository.

We will use ```makecert.exe``` distributed as part of the in the Windows 7 SDK. The following commands will create the required certificates and insert them into the current user’s personal store.

*```makecert.exe -r -pe -a sha1 -n "CN=My Azure Management Certificate" -ss My -sr CurrentUser -len 2048 -sky exchange -sp "Microsoft Enhanced RSA and AES Cryptographic Provider" -sy 24```

*```makecert.exe -r -pe -a sha1 -n "CN=My Azure SSL Certificate" -ss My -sr CurrentUser -len 2048 -sky exchange -sp "Microsoft Enhanced RSA and AES Cryptographic Provider" -sy 24```

If you generated those two certificates, now you have to export them to your disk and import into Azure Portal.
