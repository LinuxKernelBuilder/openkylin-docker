#!/usr/bin/bash
pwd
wget https://github.com/LinuxKernelBuilder/openkylin-docker/releases/download/V0.1/yangtze-rootfs.tar.gz
ls -al
sudo docker import yangtze-rootfs.tar.gz openkylin:latest
