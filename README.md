# vagrant-dontstarve

## What it is ?
This is basic vagrant file with shell provisioning that allows everyone quickly spin up your own machine on Azure with [Don't Starve Together](http://www.dontstarvegame.com/) Server.

###Available providers 
1. Azure - done
2. Virtualbox - done 

# Basics 

## Virtualbox (localy) 

### Prerequisites
1. Installed [VirtualBox](https://www.virtualbox.org/)
2. Installed [Vagrant](https://www.vagrantup.com)

### Getting started
1. Simply ```git clone git@github.com:pawelsawicz/vagrant-dontstarve.git``` or [download a zip](https://github.com/pawelsawicz/vagrant-dontstarve/archive/master.zip)
2. Copy your [server_token.txt](http://dont-starve-game.wikia.com/wiki/Guides/Don%E2%80%99t_Starve_Together_Dedicated_Servers#Server_Tokens) file into ```./configs```  in your vagrant-dontstarve folder 
4. Customize ```./configs/settings.ini``` file (optional)
5. cmd to location of vagrantfile and ```vagrant up --provider=virtualbox```
6. DONE happy playing

## Microsoft Azure (cloud provider)

### Prerequisites
1. Azure [account](https://account.windowsazure.com)
2. Installed [Vagrant](https://www.vagrantup.com)

### Getting started

1. Simply ```git clone git@github.com:pawelsawicz/vagrant-dontstarve.git``` or [download a zip](https://github.com/pawelsawicz/vagrant-dontstarve/archive/master.zip)
2. Copy your [server_token.txt](http://dont-starve-game.wikia.com/wiki/Guides/Don%E2%80%99t_Starve_Together_Dedicated_Servers#Server_Tokens) file into ```./configs```  in your vagrant-dontstarve folder
3. Customize ```./configs/settings.ini``` file (optional)
4. Open Vagrantfile and change fallowing paramaters. For certification see this section
5. Once you provide all required filed simply ```vagrant up```
6. Enjoy!

### Certification, how to generate ?
[Certification](https://github.com/MSOpenTech/vagrant-azure#certificate-generation) is copied from [vagrant-azure](https://github.com/MSOpenTech/vagrant-azure) repository.

We will use ```makecert.exe``` distributed as part of the in the Windows 7 SDK. The following commands will create the required certificates and insert them into the current user’s personal store.

* ```makecert.exe -r -pe -a sha1 -n "CN=My Azure Management Certificate" -ss My -sr CurrentUser -len 2048 -sky exchange -sp "Microsoft Enhanced RSA and AES Cryptographic Provider" -sy 24```

* ```makecert.exe -r -pe -a sha1 -n "CN=My Azure SSL Certificate" -ss My -sr CurrentUser -len 2048 -sky exchange -sp "Microsoft Enhanced RSA and AES Cryptographic Provider" -sy 24```

If you generated those two certificates, now you have to export them to your disk and import into Azure Portal.

1. Open ```certmgr.msc``` from command line or Windows + F and search for ```certmgr.msc```

2. If you have certmgr opened, navigate into Personal->Certificates->My Azure Management Certificate and right click All Task->Export

  1. Then Select "Yes, export the private key" -> Select Personal Information Exchange (.PFX), Uncheck "Include all certification path if possible" -> Select Password, and type password -> Type file name and select location of your certificate

  2. Open command line navigate to the folder where you saved your .pfx file and run following command ```openssl pkcs12 -in vagrant.pfx -out c.pem -nodes``` [source](https://github.com/MSOpenTech/vagrant-azure/issues/25#issue-38745468) you can change name vagrant.pfx into something that fits you.

  3. Go back to Personal Certificates->Select My Azure Management Certificate->Export-> Then Select "No, do not export the private key" -> Select DER encoded binary X.509 (.CER) -> Type file name and select location of your certificate

3. Go to azure developer portal and select -> Settings-> Managment Certifcate -> Upload certificate -> select file from point 2.3 

##Other Info
###Routmap

1. Add VirtualBox provider
2. Add AWS provider
3. Add UDP ports for Azure
