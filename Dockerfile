FROM docker.gitea.com/gitea:1.24.5

RUN apk --no-cache add asciidoctor freetype freetype-dev gcc g++ libpng libffi-dev pandoc python3-dev py3-pyzmq pipx

# 安装 Python 软件包
RUN pipx install jupyter docutils --include-deps

# 清理构建缓存，减小镜像大小
RUN rm -rf /var/cache/apk/*