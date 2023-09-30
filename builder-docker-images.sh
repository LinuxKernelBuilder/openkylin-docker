#!/usr/bin/bash
pwd
#下载较新的根文件系统
wget https://github.com/LinuxKernelBuilder/openkylin-docker/releases/download/V0.2/yangtze-rootfs.tar.gz
ls -al
#把根文件导入到docker
sudo docker import yangtze-rootfs.tar.gz openkylin:latest
#以下是把这个镜像跑起来
sudo docker run -dit --name openkylin openkylin:latest  /bin/bash
sudo docker run -dit openkylin:latest  /bin/bash
sudo docker start openkylin
#对镜像进行一个定制
sudo docker cp change_source.sh openkylin:/root
sudo docker cp build.sh openkylin:/root
sudo docker cp yangtze.multistrap openkylin:/root
sudo docker exec  openkylin /bin/bash /root/change_source.sh
sudo docker exec  openkylin /bin/bash /root/build.sh
#将根文件系统生成
sudo docker exec openkylin bash -c "sudo tar -cf yangtze-rootfs.tar.gz -C /yangtze-rootfs ."
sudo docker exec openkylin bash -c "ls -al"
#把根文件系统打包出来到主机（giithub actions的主机）
sudo docker cp openkylin:/yangtze-rootfs.tar.gz ./
# 仅用neofetch来查看之前的安装命令是否成功
sudo docker exec openkylin neofetch --version /bin/bash
docker commit openkylin openkylin:latest
#把docker镜像进行导出
docker save -o openkylin-test.tar openkylin:latest
docker tag openkylin:latest xxtxtop/openkylin:lates
mkdir "artifact"
ls -al
sudo chmod 777 openkylin-test.tar
sudo chmod 777 yangtze-rootfs.tar.gz
ls -al
#此处可以选择是否需要导出docker镜像openkylin-test.tar或者rootfs根文件系统yangtze-rootfs.tar.gz
# mv ./*.tar artifact/   个人平时使用不到处docker镜像、docker镜像直接pull
mv ./*.tar.gz artifact/