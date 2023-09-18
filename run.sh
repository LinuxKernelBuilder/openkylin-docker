sudo apt-get install ca-certificates  curl  gnupg  lsb-release wget
wget https://github.com/LinuxKernelBuilder/openkylin-docker/releases/download/V0.1/yangtze-rootfs.tar.gz

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo service docker start

sudo docker import yangtze-rootfs.tar.gz openkylin:latest

sudo docker run -it --name openkylin openkylin

#以下应该是要在docker环境中进行操作的项目

apt install neofetch

neofetch

systemd-detect-virt -c
