#!/bin/bash
#从docker内生成根文件系统
set -e

apt update

export DEBIAN_FRONTEND=noninteractive

apt install multistrap -y

multistrap -f yangtze.multistrap