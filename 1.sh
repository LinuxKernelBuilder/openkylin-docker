#!/usr/bin/bash
pwd
wget https://github.com/LinuxKernelBuilder/openkylin-docker/releases/download/V0.2/yangtze-rootfs.tar.gz
ls -al
#把根文件导入到docker
sudo docker import yangtze-rootfs.tar.gz openkylin:latest
