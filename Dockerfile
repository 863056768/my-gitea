FROM docker.gitea.com/gitea:1.25.3

ENV PIPX_HOME="/usr/local/pipx"
ENV PIPX_BIN_DIR="/usr/local/pipx/bin"
ENV PATH="$PATH:/usr/local/pipx/bin"

COPY render-asciidoc /usr/local/bin/render-asciidoc
COPY render-ipynb /usr/local/bin/render-ipynb

RUN <<EOT
    apk --no-cache add asciidoctor freetype freetype-dev gcc g++ libpng libffi-dev pandoc python3-dev py3-pyzmq pipx
    chmod +x /usr/local/bin/render-asciidoc /usr/local/bin/render-ipynb
    pipx install nbconvert docutils --include-deps
    rm -rf /root/.cache /var/cache/apk/* /tmp/*
EOT