# Start from the correct and current LSIO KasmVNC image
FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

LABEL org.opencontainers.image.source=https://github.com/chrisae9/kasm-playwright-mcp

ENV NVM_DIR="/config/.nvm"
ENV NODE_VERSION=24.4.0
ENV NODE_PATH="$NVM_DIR/versions/node/v${NODE_VERSION}/bin"

USER root

COPY root/ /

# # Set the working directory to the project folder (which is now user-owned)
# WORKDIR /config/Desktop/project

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

RUN \. /config/.nvm/nvm.sh && nvm install ${NODE_VERSION}

RUN ${NODE_PATH}/npx playwright install chrome