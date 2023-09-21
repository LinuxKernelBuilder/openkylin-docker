#!/usr/bin/bash
((0)) && {
sudo apt-get upgrade -y
#wget https://github.com/LinuxKernelBuilder/openkylin-docker/releases/download/V0.1/yangtze-rootfs.tar.gz

sudo mkdir -p /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#Ubuntu可以直接获取docker镜像源进行安装
sudo apt update -y
sudo apt upgrade -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin neofetch
sudo docker --version
}
sudo neofetch
pwd
sudo service docker start #运行 Docker 服务
sudo systemctl enable docker #使 Docker 服务在每次重启时自动启动

docker pull xxtxtop/openkylin:lates
#sudo docker import yangtze-rootfs.tar.gz openkylin:latest
sudo docker images
sudo docker ps -a
sudo docker images "*/*openkylin*"
xxtx=`sudo docker images "*/*openkylin*" --format "{{.ID}}"`
sudo docker run -d  ${xxtx}  sleep infinity /bin/bash
# 使用单引号来包围*openkylin*
# xxtx=$(sudo docker images "*/*openkylin*" --format "{{.ID}}")
sudo docker images "*/*openkylin*" --format "{{.ID}}"
xxtx=`sudo docker images "*/*openkylin*" --format "{{.ID}}"`
echo "${xxtx}"
#xx=$(sudo docker ps -a --format "table {{.ID}}" | head -n 2 | tail -n 1)
xx=`sudo docker ps -a --format "table {{.ID}}" | head -n 2 | tail -n 1`
sudo docker ps -a --format "table {{.ID}}" | head -n 2 | tail -n 1
echo "${xx}"
# sudo docker run -d --name openkylin openkylin:latest /bin/bash

#可能有问题的
((0)) && {
sudo docker run -d --name openkylin xxtxtop/openkylin:lates  /bin/bash
sudo docker run -d openkylin /bin/bash
sudo docker run -d xxtxtop/openkylin:lates /bin/bash
sudo docker start openkylin
}
sudo docker exec ${xx} vim --version /bin/bash
sudo docker exec ${xx} bash -c "sudo apt update && sudo apt upgrade"
sudo docker exec ${xx} bash -c "sudo apt install -y vim neofetch"
sudo docker exec ${xx}  vim --version /bin/bash
sudo docker exec ${xx} neofetch --version /bin/bash
sudo docker images

sudo docker tag openkylin:latest ${xxtx}
#sudo docker push xxtxtop/openkylin:lates
#docker commit openkylin openkylin-test:latest
docker save -o openkylin-test.tar ${xx}
((0)) && {
mkdir "artifact"
ls -al
sudo chmod 777 openkylin-test.tar
ls -al
mv ./*.tar artifact/
}