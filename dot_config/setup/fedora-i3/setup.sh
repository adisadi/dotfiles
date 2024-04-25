
sudo dnf -q -y  remove Thunar cldr-emoji* google-noto-serif* anaconda* azote dunst mousepad desktop-backgrounds-compat f40-background-base
sudo dnf -q -y install kitty picom ranger fontawesome4-fonts

#login background
sudo cp ~/.config/wallpapers/default.jpg /usr/share/backgrounds
sudo sed -i 's|background=/usr/share/backgrounds/default.png|background=/usr/share/backgrounds/default.jpg|g' /etc/lightdm/lightdm-gtk-greeter.conf

#vs code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf -q check-update
sudo dnf -q -y install code

sudo dnf -y -q autoremove
sudo dnf -y -q clean all

