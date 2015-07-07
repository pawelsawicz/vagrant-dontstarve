
echo "Starting provisioning..."
echo "Setting up user, and its rights"
sudo adduser --quiet --disabled-password -shell /bin/bash --home /home/steam --gecos "User" steam
#sudo su - azureuser
#sudo mkdir -p /home/azureuser/.klei/
sudo mkdir -p /home/steam/.klei/DoNotStarveTogether/
#cd /home/azureuser/
sudo chmod 777 -R /home/steam/
#sudo chmod a+rw `tty`
echo "End setting up user"