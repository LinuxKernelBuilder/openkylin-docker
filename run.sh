sudo apt-get upgrade -y
wget https://github.com/LinuxKernelBuilder/openkylin-docker/releases/download/V0.1/yangtze-rootfs.tar.gz

sudo mkdir -p /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#Ubuntu可以直接获取docker镜像源进行安装
sudo apt update -y
sudo apt upgrade -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin neofetch
sudo docker --version

sudo neofetch
pwd
sudo service docker start #运行 Docker 服务
sudo systemctl enable docker #使 Docker 服务在每次重启时自动启动

sudo docker import yangtze-rootfs.tar.gz openkylin:latest
sudo docker images
sudo docker ps -a
sudo docker run -it -d openkylin /bin/bash
sudo docker ps -a
#以下应该是要在docker环境中进行操作的项目

sudo apt install neofetch

sudo neofetch


pwd
sudo docker ps -a