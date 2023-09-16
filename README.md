#### 安装 https 请求库
```
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
#### 添加Docker的官方GPG密钥
```
sudo mkdir -p /etc/apt/keyrings
```
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

- 使用 echo 命令和重定向符号 > 来将内容写入文件。例如，你可以执行以下命令：
```
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
这样就会将
```
 deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu bionic stable 这一行写入 /etc/apt/sources.list.d/docker.list 文件中。
 ```
 注意，你需要使用 sudo 权限来执行这个命令，因为 /etc/apt 目录是受保护的。

这个地方直接用的Ubuntu bionic 的源、因为openkylin还没有docker的apt源

#### 使用 vim 编辑器或其他文本编辑器来编辑文件。例如，你可以执行以下命令：
```
sudo vim /etc/apt/sources.list.d/docker.list
```
这样就会用 vim 编辑器打开 /etc/apt/sources.list.d/docker.list 文件。然后你可以按 i 键进入插入模式，输入 deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu bionic stable 这一行，按 Esc 键退出插入模式，输入 :wq 保存并退出文件。


#### 安装 docker
```
sudo apt-get update
```
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
```
sudo docker import yangtze-rootfs.tar.gz openkylin:latest
```
```
sudo docker run -it --name openkylin openkylin
```
```
sudo docker start ae5ade162273
```
```
sudo docker attach ae5ade162273
```

ae5ade162273 是我 docker ps -a 后查看的 CONTAINER ID 结果 具体根据自己的



#### 将Windows代理提供给wsl环境
```
export ALL_PROXY="http://172.19.240.1:10809"
```

#### 解决wsl安装软件遇到的问题
```
sudo mkdir /usr/lib/wsl/lib2
sudo cp -r /usr/lib/wsl/lib/* /usr/lib/wsl/lib2
sudo ln -sf /usr/lib/wsl/lib2/libnvoptix.so.1.0.0 /usr/lib/wsl/lib2/libnvoptix_loader.so.1
sudo sed -i 's|/usr/lib/wsl/lib|/usr/lib/wsl/lib2|g' /etc/ld.so.conf.d/ld.wsl.conf
sudo ln -sf /usr/lib/wsl/lib2/libcuda.so.1.1 /usr/lib/wsl/lib2/libcuda.so.1
sudo sed -i 's|/usr/lib/wsl/lib|/usr/lib/wsl/lib2|g' /etc/ld.so.conf.d/ld.wsl.conf
```
#### 运行docker服务
```
sudo service docker start
```

#### 查看当前环境
```
systemd-detect-virt -c
```