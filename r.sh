#!/usr/bin/bash
sudo docker stop $(docker ps -aq)
sudo docker rm $(docker ps -aq)
sudo docker rmi $(docker images -q)
sudo docker images
sudo docker  ps -a

#测试的时候专用，删除所有的docker容器和镜像，运行的时候要慎重