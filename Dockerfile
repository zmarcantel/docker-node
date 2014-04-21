##
##  Node from lateset github release
##

FROM ubuntu
MAINTAINER Zachary Marcantel, zach@zed.io, zmarcantel@utexas.edu

# Install requisite packages
RUN apt-get update
RUN apt-get install -y curl git make gcc g++

# Checkout the latest version of node
RUN git clone https://github.com/joyent/node && cd node && git checkout `curl --silent https://api.github.com/repos/joyent/node/tags | \
  grep "name" | \
  grep "v0." | \
  head -n 1 | \
  sed 's/\s\+"name": "//g' | \
  sed 's/",//g'`

# Build node
RUN cd node && ./configure && make && sudo make install

# Make a node user and group
RUN useradd -mU --shell=/bin/false node

USER root
