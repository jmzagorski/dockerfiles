FROM ghcr.io/puppeteer/puppeteer:latest

ARG VIM_DEPS

USER root
RUN apt-get update && apt-get install --no-install-recommends -y \
   git \
   gcc \
   ncurses-dev \
   xvfb xauth xdg-utils wget \
   make ${VIM_DEPS}
RUN git clone https://github.com/vim/vim.git \
    && cd vim \
    && make \
    && make install \
    && make clean \
    && cd ../ \
    && rm -rf vim
RUN apt remove -y ncurses-dev gcc make && apt autoremove -y

WORKDIR /home/node
USER node

EXPOSE 7000
