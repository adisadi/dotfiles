# enable community repo --> https://wiki.alpinelinux.org/w/index.php?title=Enable_Community_Repository&redirect=no
cat > /etc/apk/repositories << EOF; $(echo)

https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/main/
https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/
https://dl-cdn.alpinelinux.org/alpine/edge/testing/

EOF

# update & upgrade alpine
apk update
apk upgrade

# install virtualbox-guest-additions --> https://wiki.alpinelinux.org/wiki/VirtualBox_guest_additions
apk add virtualbox-guest-additions  virtualbox-guest-additions-x11

rc-service virtualbox-guest-additions start
rc-update add virtualbox-guest-additions boot

rc-service virtualbox-drm-client start
rc-update add virtualbox-drm-client default

# install xorg & i3wm --> https://wiki.alpinelinux.org/wiki/I3wm
apk add xf86-video-vboxvideo xf86-video-fbdev xf86-video-vesa

apk add dbus
dbus-uuidgen > /var/lib/dbus/machine-id
rc-update add dbus

setup-xorg-base

apk add i3wm i3status kitty dmenu feh picom dmenu ranger ttf-font-awesome font-dejavu curl nano 

#setup x11 keyboard
apk add setxkbmap

#setup chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply adisadi




