#!/bin/bash

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo truncate -s 0 /etc/apt/sources.list

sudo cat >> /etc/apt/sources.list << EOF
deb http://archive.build.openkylin.top/openkylin yangtze main
deb http://archive.build.openkylin.top/OTHER/Internal-mirror/repack5/baseok0.fix yangtze main 
deb http://archive.build.openkylin.top/OTHER/Internal-mirror/stage0 yangtze main
deb http://archive.build.openkylin.top/openkylin yangtze-security main
deb http://archive.build.openkylin.top/openkylin yangtze-updates main
deb http://archive.build.openkylin.top/openkylin yangtze-proposed main
EOF

sudo apt update && sudo apt upgrade
sudo apt install -y devscripts git-buildpackage pristine-tar