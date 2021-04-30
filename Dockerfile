# 基础镜像构建
# 1. 更新基础镜像
# 2. yum 安装系统级别依赖
# 3. pyenv 安装指定 python 版本
# 4. pip 安装 python 基础依赖包

FROM centos:8

LABEL maintainer="peizhenfei"

ENV PIP_NO_CACHE_DIR=off \
    HOME=/opt/app-root/src

# 兼容 s2i
WORKDIR /opt/app-root/src/

COPY ./src/ .

RUN bash pre_hooks.sh && rm -rf pre_hooks.sh && \
	yum update -y && yum install -y $(cat yum.txt | tr '\n' ' ') && rm -rf yum.txt && \
	bash vendors/installer.sh && rm -rf verdors && \
	bash post_hooks.sh && rm -rf post_hooks.sh && \
    yum -y clean all --enablerepo='*'

# 执行默认命令
CMD runtime/run