#!/bin/bash

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo truncate -s 0 /etc/apt/sources.list

sudo cat >> /etc/apt/sources.list << EOF
deb http://archive.build.openkylin.top/openkylin nile main cross pty
deb http://archive.build.openkylin.top/openkylin nile-security main cross pty
deb http://archive.build.openkylin.top/openkylin nile-updates main cross pty
deb http://archive.build.openkylin.top/openkylin nile-proposed main cross pty
deb http://ppa.build.openkylin.top/kylinsoft/anything/openkylin nile main
deb http://ppa.build.openkylin.top/kylinsoft/wayland-next/openkylin yangtze main
EOF

sudo apt update && sudo apt upgrade
sudo apt install -y devscripts git-buildpackage pristine-tar vim neofetch git fakeroot build-essential libncurses-dev xz-utils libssl-dev bc flex libelf-dev bison gpg python3-pyquery wget make gcc dpkg-dev python3-pip python3-tk autoconf automake  gdb gdb-doc cgdb dh-make lintian pbuilder cowdancer debian-policy developers-reference systemd nodejs npm
sudo npm install -g n
sudo n stable
hash -r
