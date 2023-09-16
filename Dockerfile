# 基于空镜像scratch
FROM scratch
# 添加rootfs文件到镜像中
ADD yangtze-rootfs.tar.gz /
# 设置容器启动时的默认命令
CMD ["/bin/bash"]

