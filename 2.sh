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
# 仅用neofetch来查看之前的安装命令是否成功
sudo docker exec openkylin neofetch --version /bin/bash
docker commit openkylin openkylin:latest
docker save -o openkylin-test.tar openkylin:latest
docker tag openkylin:latest xxtxtop/openkylin:lates
mkdir "artifact"
ls -al
sudo chmod 777 openkylin-test.tar
sudo chmod 777 yangtze-rootfs.tar.gz
ls -al
#此处可以选择是否需要导出docker镜像openkylin-test.tar或者rootfs根文件系统yangtze-rootfs.tar.gz
mv ./*.tar artifact/
mv ./*.tar.gz artifact/