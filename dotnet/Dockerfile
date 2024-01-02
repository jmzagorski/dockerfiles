ARG DOTNET_SDK_VER
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VER}

EXPOSE 5000
EXPOSE 5001

ARG USERID
ARG USER_GROUPID

RUN groupadd --gid $USER_GROUPID dotnet \
    && useradd --uid $USERID --gid $USER_GROUPID --shell /bin/bash --create-home dotnet

ARG USER__CA_CERT

COPY ./${USER__CA_CERT} /usr/local/share/ca-certificates/
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    git \
    gcc \
    ripgrep \
    universal-ctags \
    yamllint \
    ncurses-dev \
    make
RUN update-ca-certificates
RUN git clone https://github.com/vim/vim.git \
    && cd vim \
    && make \
    && make install \
    && make clean \
    && cd ../ \
    && rm -rf vim
RUN apt remove -y ncurses-dev gcc make ca-certificates && apt autoremove -y

RUN mkdir -p home/dotnet/.cache/omnisharp-vim/omnisharp-roslyn \
    && wget -O- "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.11/omnisharp-linux-x64-net6.0.tar.gz" \
    | tar -zxv -C "home/dotnet/.cache/omnisharp-vim/omnisharp-roslyn"

RUN mkdir /tmp/NuGetScratch && chown dotnet:dotnet /tmp/NuGetScratch/
RUN chown dotnet:dotnet /home/dotnet

USER dotnet
WORKDIR /home/dotnet
RUN dotnet dev-certs https --clean \
    && dotnet dev-certs https \
    && dotnet dev-certs https --trust
ENV ASPNETCORE_ENVIRONMENT=Development
ENV LANG C.UTF-8
