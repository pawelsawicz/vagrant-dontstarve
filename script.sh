set -e
set -x

echo "Starting provisioning"
echo "Setting up i386 architecture"
sudo dpkg --add-architecture i386 -y
echo "i386 architecture installed"
echo "Installing required packages"
sudo apt-get update -y
if [ $(dpkg-query -W -f='${Status}' lib32gcc1 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install lib32gcc1 -y
fi
if [ $(dpkg-query -W -f='${Status}' lib32stdc++6 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install lib32stdc++6 -y 
fi
if [ $(dpkg-query -W -f='${Status}' libcurl4-gnutls-dev:i386 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install libcurl4-gnutls-dev:i386 -y
fi
echo "Packages have been installed"
echo "Configurating user"
#sudo useradd -m steam
#sudo chmod a+rw `tty`
sudo su - azureuser
sudo mkdir /home/azureuser/steamcmd
cd /home/azureuser/steamcmd
echo "Downloading steam"
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
echo "Extracting steam"
tar -xvzf steamcmd_linux.tar.gz
echo "Install & configure steam"
./steamcmd.sh steamcmd +login anonymous +force_install_dir /home/azureuser/steamapps/DST +app_update 343050 +validate +quit
echo "Quit from steam console"
echo "Check out folder to server"
cd /home/azureuser/steamapps/DST/bin/
echo "Runs DST Server"
su -c ./dontstarve_dedicated_server_nullrenderer -s /bin/sh azureuser