#!/usr/bin/bash

sudo docker run -dit --name openkylin openkylin:latest  /bin/bash
sudo docker run -dit openkylin:latest  /bin/bash
sudo docker start openkylin
sudo docker cp change_source.sh openkylin:/root
sudo docker cp build.sh openkylin:/root
sudo docker cp yangtze.multistrap openkylin:/root
sudo docker exec  openkylin /bin/bash /root/change_source.sh
sudo docker exec  openkylin /bin/bash /root/build.sh
sudo docker exec openkylin bash -c "sudo tar -cf yangtze-rootfs.tar.gz -C /yangtze-rootfs ."
sudo docker cp openkylin:/root/*.tar.gz ./
#sudo docker exec openkylin vim --version /bin/bash
#sudo docker exec openkylin bash -c "sudo apt update && sudo apt upgrade"
#sudo docker exec openkylin bash -c "sudo apt install -y vim neofetch"
sudo docker exec openkylin vim --version /bin/bash
sudo docker exec openkylin neofetch --version /bin/bash
#sudo docker exec openkylin bash -c "sudo apt-get install  -y  git fakeroot build-essential libncurses-dev xz-utils libssl-dev bc flex libelf-dev bison"
#sudo docker exec openkylin bash -c "sudo apt install -y gpg python3-pyquery wget make gcc dpkg-dev python3-pip python3-tk "


docker commit openkylin openkylin:latest
docker save -o openkylin-test.tar openkylin:latest
docker tag openkylin:latest xxtxtop/openkylin:lates
mkdir "artifact"
ls -al
sudo chmod 777 openkylin-test.tar
sudo chmod 777 yangtze-rootfs.tar.gz
ls -al
mv ./*.tar artifact/
mv ./*.tar.gz artifact/