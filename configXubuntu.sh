clear
echo Upgrading system...
sudo apt-get update -qq && sudo apt-get upgrade -y -qq

echo Installing restricted extras and codecs...
sudo apt-get install -y -qq xubuntu-restricted-extras libavcodec-extra

echo Installing and starting powermanagement...
sudo apt-get install -y tlp tlp-rdw
sudo tlp start

echo Do you want extra Icons and Themes (Y/n)?
read icth
if [ icth <> "n" ]; then
  wget http://downloadcontent.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/all/arc-theme-solid_1465131682.3095952_all.deb
  sudo dpkg -i arc-theme-solid_1465131682.3095952_all.deb
  wget http://ppa.launchpad.net/tiheum/equinox/ubuntu/pool/main/f/faenza-icon-theme/faenza-icon-theme_1.3.1_all.deb
  sudo dpkg -i faenza-icon-theme_1.3.1_all.deb
  sudo add-apt-repository -y -u ppa:moka/daily
  sudo add-apt-repository -y -u ppa:numix/ppa
  sudo add-apt-repository -y -u ppa:alecive/antigone
  sudo apt-get install -y -qq moka-icon-theme numix-icon-theme numix-icon-theme-circle awoken-icon-theme
  wget https://raw.githubusercontent.com/klakar/geosupportsystem/master/Systems-Linux-icon.png
  sudo mv Systems-Linux-icon.png /usr/share/pixmaps/Linux.png
fi

echo Do you want DVD support (Y/n)?
read dvsu
if [ dvsu <> "n" ]; then
  sudo apt-get install -y -qq libdvd-pkg
  sudo dpkg-reconfigure libdvd-pkg
fi

echo Fix any broken packages
sudo apt-get dist-upgrade
sudo apt-get install -f

echo Adding extra repositorys
sudo add-apt-repository -y -u ppa:team-xbmc/ppa
sudo add-apt-repository -y -u ppa:hugin/hugin-builds
sudo add-apt-repository -y -u ppa:mixxx/mixxx
echo deb http://ppa.launchpad.net/kdenlive/kdenlive-stable/ubuntu xenial main | sudo tee /etc/apt/sources.list.d/kdenlive.list
sudo apt-get update

echo Installing videoplayers, audio software and editors...
sudo apt-get install -y -qq leafpad vlc browser-plugin-vlc kodi kdenlive audacity mixxx

echo Installing photo and graphics software...
sudo apt-get install -y -qq darktable  gimp inkscape blender hugin enblend panini handbrake synfigstudio

echo Do you want Games (Y/n)?
read game
if [ game <> "n" ]; then
  sudo apt-get install -y -qq steam wine playonlinux
fi

echo Installing Docky...
sudo apt-get install -y -qq docky
echo Installing Firewall...
sudo apt-get install -y -qq gufw python-gi

echo Do you want Science software (CAD/GIS/etc) (Y/n)?
read scis
if [ scis <> "n" ]; then
  sudo apt-get install -y meshlab freecad pgadmin3 gpsbabel gpsbabel-gui mtkbabel
  echo deb http://qgis.org/debian xenial main | sudo tee /etc/apt/sources.list.d/qgis.list
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
  sudo apt-get update -qq && sudo apt-get install -y -qq qgis python-qgis qgis-plugin-grass
fi

sudo apt-get install -y lauchy indicator-cpufreq
sudo apt-get update
sudo apt-get install -y virtualbox 

echo Do you want Skype (Y/n)?
read skyp
if [ skyp <> "n" ]; then
  wget https://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
  sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
fi

echo Do you want DropBox (Y/n)?
read drop
if [ drop <> "n" ]; then
  wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
  sudo dpkg -i dropbox_2015.10.28_amd64.deb
fi

echo Do you want Spotify (Y/n)?
read spot
if [ spot <> "n" ]; then
  keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get install -y -qq spotify-client
fi

echo Fixing broken packages...
sudo apt-get -y -qq install -f

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
