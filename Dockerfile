# 使用官方 Gitea 镜像作为基础
FROM docker.gitea.com/gitea:latest

RUN apk --no-cache add asciidoctor freetype freetype-dev gcc g++ libpng libffi-dev pandoc python3-dev py3-pyzmq pipx

# 安装 Python 软件包
RUN pipx install jupyter docutils --include-deps

# 清理构建缓存，减小镜像大小
RUN rm -rf /var/cache/apk/*