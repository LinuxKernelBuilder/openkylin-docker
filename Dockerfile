# 基于空镜像scratch
FROM scratch
LABEL maintainer="XXTXTOP <xxtxtop@gmail.com>"
LABEL version="1.0"
LABEL description="This is a custom image based on scratch"
# 添加rootfs文件到镜像中
ADD yangtze-rootfs.tar.gz /
# 安装curl和vim
RUN apt-get update && apt-get install -y curl vim git neofetch 
# 创建一个用户
RUN adduser xxx
# 用户加入到sudo
RUN adduser xxx sudo
# 切换到用户目录
WORKDIR /home/xxx
# 设置容器启动时的默认命令，并切换到xxx
USER xxx
CMD ["/bin/bash"]

