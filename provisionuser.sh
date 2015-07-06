
echo "Starting provisioning..."
echo "Setting up user, and its rights"
sudo adduser --quiet --disabled-password -shell /bin/bash --home /home/azureuser --gecos "User" azureuser
#sudo su - azureuser
#sudo mkdir -p /home/azureuser/.klei/
sudo mkdir -p /home/azureuser/.klei/DoNotStarveTogether/
#cd /home/azureuser/
sudo chmod 777 -R /home/azureuser/
#sudo chmod a+rw `tty`
echo "End setting up user"