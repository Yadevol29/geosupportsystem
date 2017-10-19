#!/bin/bash

#Baserat på Ubuntu Gnome

i () {
   clear
   sudo apt install -y -qq $1
}
u () {
   sudo apt -qq -y update && sudo apt -qq -y upgrade
}
clear

# Välj paket
dist=$(lsb_release -c | cut -d':' -f 2 | xargs echo -n)
if [ "$dist" = "artful" ]
then
echo "Vill du ha klassiska Gnome? J/n"
read classic
fi
echo "Ljud och video? J/n"
read ljudvideo
echo "Grafik och foto? J/n"
read grafikfoto
echo "GIS och sånt...? J/n"
read gisochsant
echo "Spel och Steam? J/n"
read spel
echo "Spotify? J/n"
read spotify
echo "Dropbox och kontor? J/n"
read dropboxkontor
echo "Play on Linux - SketchUp, AirPort Tool, etc J/n"
read playonlinux
echo "Laptop verktyg? j/N"
read laptop
echo "MATE Software Botique? j/N"
read mate
echo "Sublime Text? J/n"
read sublime



sudo add-apt-repository ppa:dawidd0811/neofetch -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo add-apt-repository ppa:team-xbmc/ppa -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo add-apt-repository ppa:hugin/hugin-builds -y
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo add-apt-repository ppa:libreoffice/ppa -y
sudo add-apt-repository ppa:thomas-schiex/blender -y

u

i sshfs
i neofetch
echo "neofetch" >> ~/.bashrc
i cryptsetup
i htop
i ubuntu-restricted-extras
i libavcodec-extra
i alacarte
i tracker-gui
i gparted
i papirus-icon-theme
# Fixa så att Qt applikationer följer GTK+ tema
echo "QT_STYLE_OVERRIDE=GTK+" | sudo tee -a /etc/environment
i cowsay

if [ "$classic" != "n" ]
then
i gnome-session
i vanilla-gnome-desktop
fi

if [ "$ljudvideo" != "n" ]
then
i breeze-icon-theme
i obs-studio
i kdenlive
i kazam
i vlc
i audacity
i kodi
i guvcview
i enblend
i handbrake
i pavucontrol
i libdvd-pkg
i libaacs0
i libbluray-bdj
i libbluray1
mkdir -p ~/.config/aacs/
cd ~/.config/aacs/ && wget http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
cd ~
sudo add-apt-repository ppa:heyarje/makemkv-beta
sudo apt-get purge -yyqq gstreamer1.0-fluendo-mp3
u
i makemkv-bin 
i makemkv-oss
fi

if [ "$grafikfoto" != "n" ]
then
i gimp
i darktable
i inkscape
i synfigstudio
i blender
i hugin
fi

if [ "$gisochsant" != "n" ]
then
dist=$(lsb_release -c | cut -d':' -f 2 | xargs echo -n)
if [ "$dist" = "xenial" ]
then
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 089EBE08314DF160
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 073D307A618E5811
echo deb http://qgis.org/ubuntugis xenial main | sudo tee /etc/apt/sources.list.d/qgis.list
echo deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main | sudo tee -a /etc/apt/sources.list.d/qgis.list
else
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 073D307A618E5811
echo deb http://qgis.org/debian $dist main | sudo tee /etc/apt/sources.list.d/qgis.list
fi
u
i qgis 
i python-qgis 
i qgis-plugin-grass
i gpsbabel 
i mtkbabel 
i gpsd 
i gpsd-clients 
i gpsbabel-gui 
i meshlab 
i freecad 
i pgadmin3
i saga 
i python-saga 
i libotb 
i otb-bin 
i python-otb 
i python-exif 
i python-scipy 
i libwxgtk3.0-dev 
i libgdal-dev
i pyqt4-dev-tools 
i python-sphinx 
i bluefish 
i git 
i python-pip
sudo pip install jupyter bokeh pandas
fi

if [ "$spel" != "n" ]
then
i steam
i oracle-java8-installer
mkdir minecraft
cd minecraft
wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
chmod +x Minecraft.jar
cd ..
fi

if [ "$spotify" != "n" ]
then
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
u
i spotify-client
fi

if [ "$playonlinux" != "n" ]
then
i playonlinux
fi

if [ "$dropboxkontor" != "n" ]
then
wget "https://github.com/Automattic/simplenote-electron/releases/download/v1.0.8/simplenote-1.0.8.deb"
sudo dpkg -i simplenote-1.0.8.deb
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
i thunderbird
i virtualbox
fi

if [ "$sublime" != "n" ]
then
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
u
i sublime-text
fi

if [ "$laptop" == "j" ]
then
i powertop
i laptop-mode-tools
sudo powertop --auto-tune --html
firefox powertop.html &
sudo update-rc.d laptop-mode defaults
fi

if [ "$mate" == "j" ]
then
i ubuntu-mate-welcome
fi

sudo apt -f install -y -qq && sudo apt dist-upgrade -y -qq
clear
echo "Installationen är klar!" > postinstall.txt
if [ "$classic" "= #n" ]
then
echo "Starta om för att byta till Klassisk Gnome vid inloggningen." >> postinstall.txt
echo "Detta krävs för att kunna göra en del förändringar i gränssnittet." >> postinstall.txt
else
echo "Ubuntu varianten av Gnome kan inte hantera alla justeringar nedan." >> postinstall.txt
fi
echo "Att göra:" >> postinstall.txt
echo "1. Lägg till Lightning kalendern i Thunderbird" >> postinstall.txt
echo "   Lägg till Provider for Google Calendar om du har Google konto" >> postinstall.txt
echo "2. Lägg till/Aktivera extensions till Gnome:" >> postinstall.txt
echo "   - Dash to Panel" >> postinstall.txt
echo "   - Applications Menu" >> postinstall.txt
echo "   - OpenWeather" >> postinstall.txt
echo "   - Dynamic Panel Transparency" >> postinstall.txt
echo "   - Coverflow Alt-Tab" >> postinstall.txt
echo "   - ShellTile" >> postinstall.txt
echo "3. Ljudet med pavucontol - vid behov" >> postinstall.txt
echo "4. Kontrollera Ytterligare drivrutiner" >> postinstall.txt
echo "5. Ställ in Dropbox - om installerat" >> postinstall.txt
echo "6. Om du installerat PlayOnLinux så starta den för att lägga till PC mjukvara" >> postinstall.txt
echo "7. Lägg till fler program via Software Botique - om installerat" >> postinstall.txt
echo "8. Skapa egna genvägar i menyn med alacarte" >> postinstall.txt
echo "9. Om \"tracker\" kräver mycket ram (kolla med htop), ändra hur systemet indexerar filer" >> postinstall.txt
echo "10.Om du installerat SublimeText kanske du vill ha med Emmet?" >> postinstall.txt
echo "    a. shift+ctrl+P sök efter Install Package Control" >> postinstall.txt
echo "    b. Package Control: Install Package..." >> postinstall.txt
echo "    c. Emmet" >> postinstall.txt
alacarte &
thunderbird &
software-properties-gtk --open-tab=4 &
firefox extensions.gnome.org &
gedit postinstall.txt &

if [ "$dropboxkontor" != "n" ]
then
~/.dropbox-dist/dropboxd &
fi

if [ "$playonlinux" != "n" ]
then
playonlinux &
fi

clear
cowsay -f tux "Nu kan du stänga detta fönster"
