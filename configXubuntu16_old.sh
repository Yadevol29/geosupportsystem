sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y xubuntu-restricted-extras libavcodec-extra
sudo apt-get install -y tlp tlp-rdw
sudo tlp start
wget http://downloadcontent.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/all/arc-theme-solid_1465131682.3095952_all.deb
sudo dpkg -i arc-theme-solid_1465131682.3095952_all.deb
wget http://ppa.launchpad.net/tiheum/equinox/ubuntu/pool/main/f/faenza-icon-theme/faenza-icon-theme_1.3.1_all.deb
sudo dpkg -i faenza-icon-theme_1.3.1_all.deb
sudo apt-get install -y libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
sudo apt-get dist-upgrade
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:team-xbmc/ppa
sudo add-apt-repository -y ppa:hugin/hugin-builds
sudo add-apt-repository -y ppa:mixxx/mixxx
sudo add-apt-repository -y ppa:moka/daily
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:alecive/antigone
echo deb http://ppa.launchpad.net/kdenlive/kdenlive-stable/ubuntu xenial main | sudo tee /etc/apt/sources.list.d/kdenlive.list
sudo apt-get update
sudo apt-get install -y leafpad vlc browser-plugin-vlc kodi kdenlive
sudo apt-get install -y darktable steam wine playonlinux gimp inkscape
sudo apt-get install -y docky gufw python-gi
sudo apt-get update
sudo apt-get install -y meshlab freecad pgadmin3 gpsbabel gpsbabel-gui mtkbabel
sudo apt-get install -y lauchy blender hugin enblend panini handbrake indicator-cpufreq
sudo apt-get update
sudo apt-get install -y moka-icon-theme numix-icon-theme numix-icon-theme-circle awoken-icon-theme
sudo apt-get install -y audacity synfigstudio virtualbox mixxx 
wget https://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
wget https://raw.githubusercontent.com/klakar/geosupportsystem/master/Systems-Linux-icon.png
sudo mv Systems-Linux-icon.png /usr/share/icons/default/Systems-Linux-icon.png
sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo apt-get -y install -f
wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox_2015.10.28_amd64.deb
keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
echo deb http://qgis.org/debian xenial main | sudo tee /etc/apt/sources.list.d/qgis.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
sudo apt-get update && sudo apt-get install -y qgis python-qgis qgis-plugin-grass spotify-client
clear
echo 1. Change the WHISKER MENU Properties
echo 2. Check for ADDITIONAL DRIVERS
echo 3. Activate the FIREWALL
echo 4. Add "super" KEYBOARD shortcut
echo 5. Change Theme in APPEARANCE
echo 6. Change Icons in APPEARANCE
echo 7. Change the DESKTOP wallpaper and icons
echo 8. WINDOW MANAGER style and TWEAKS compositor
echo 9. Start DOCKY and add launchers
echo 10. Tweak LIGHTDM greeter
echo 11. Add TLP and Launchy to AUTOSTART
echo
echo Reboot - Log In - Add more SOFTWARE
echo
echo VirtualBox under Windows 10 is... Problematic...
