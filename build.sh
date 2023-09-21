#!/bin/bash

set -e

apt update

export DEBIAN_FRONTEND=noninteractive

apt install multistrap -y

multistrap -f yangtze.multistrap