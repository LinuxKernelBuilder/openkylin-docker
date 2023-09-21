#!/usr/bin/bash

sudo docker run -dit --name openkylin openkylin:latest  /bin/bash
sudo docker run -dit openkylin:latest  /bin/bash
sudo docker start openkylin

sudo docker exec openkylin vim --version /bin/bash
sudo docker exec openkylin bash -c "sudo apt update && sudo apt upgrade"
sudo docker exec openkylin bash -c "sudo apt install -y vim neofetch"
sudo docker exec openkylin vim --version /bin/bash
sudo docker exec openkylin neofetch --version /bin/bash


docker commit openkylin openkylin:latest
docker save -o openkylin-test.tar openkylin:latest
mkdir "artifact"
ls -al
sudo chmod 777 openkylin-test.tar
ls -al
mv ./*.tar artifact/