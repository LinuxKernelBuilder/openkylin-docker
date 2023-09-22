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
sudo docker exec openkylin bash -c "ls -al"
sudo docker cp openkylin:/yangtze-rootfs.tar.gz ./
sudo docker exec openkylin vim --version /bin/bash
sudo docker exec openkylin neofetch --version /bin/bash
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