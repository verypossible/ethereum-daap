FROM ubuntu:16.04

RUN apt-get update && \
    apt-get upgrade -y
RUN apt-get install -y \
        build-essential \
        cmake \
        curl \
        git \
        inotify-tools \
        software-properties-common

# Bootstrap node installation
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
# Bootstrap ethereum installation
RUN add-apt-repository -y ppa:ethereum/ethereum && \
		apt-get update
RUN apt-get install -y \
	    nodejs \
		ethereum

# # Install ethereum node packages
RUN npm install -g \
        ganache-cli \
        truffle

RUN echo "alias l='ls -lF --color=auto'" >> /root/.bashrc && \
    echo "alias la='ls -alF --color=auto'" >> /root/.bashrc && \
    echo "alias p='pwd'" >> /root/.bashrc && \
    echo "alias geth='geth --datadir=/code/chaindata'" >> /root/.bashrc

RUN mkdir /code
WORKDIR /code
