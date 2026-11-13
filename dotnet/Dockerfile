ARG DOTNET_SDK_VER
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VER}

USER root

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        ca-certificates \
        curl \
        git \
        nodejs \
        npm \
        universal-ctags \
        ripgrep \
        yamllint \
    && rm -rf /var/lib/apt/lists/*

RUN --mount=type=secret,id=custom_ca_cert,required=false \
    if [ -f /run/secrets/custom_ca_cert ]; then \
        mkdir -p /usr/local/share/ca-certificates/extra \
        && cp /run/secrets/custom_ca_cert /usr/local/share/ca-certificates/extra/custom_ca_cert.crt \
        && chmod a+r /usr/local/share/ca-certificates/extra/custom_ca_cert.crt \
        && update-ca-certificates; \
    fi

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        gcc \
        make \
        libncurses-dev \
        libncursesw6 \
        libtinfo6 \
    && git clone --depth=1 https://github.com/vim/vim.git /tmp/vim \
    && cd /tmp/vim/src \
    && ./configure --with-features=huge --enable-multibyte \
    && make \
    && make install \
    && rm -rf /tmp/vim \
    && apt-get purge -y --auto-remove gcc make libncurses-dev \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --global backlog.md

RUN mkdir -p /home/ubuntu /tmp/NuGetScratch \
    && chown ubuntu:ubuntu /home/ubuntu /tmp/NuGetScratch

ENV HOME=/home/ubuntu \
    DOTNET_CLI_HOME=/home/ubuntu \
    PATH=/home/ubuntu/.dotnet/tools:${PATH} \
    ASPNETCORE_ENVIRONMENT=Development \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

EXPOSE 5000 5001

WORKDIR /home/ubuntu
USER ubuntu

RUN curl -fsSL https://gh.io/copilot-install | bash
RUN dotnet tool install -g roslyn-language-server --prerelease

CMD ["bash"]
