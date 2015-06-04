FROM ubuntu:latest
MAINTAINER Viz <viz@linux.com>

# switch to aliyun's mirror for speed up
RUN /bin/sed -i 's/archive\.ubuntu/mirrors.aliyun/' /etc/apt/sources.list

# install essentials
RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl procps \
	&& rm -rf /var/lib/apt/lists/*

# install latest rvm
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
	&& curl -sSL https://get.rvm.io | bash -s stable

# install ruby and bundler
RUN source /etc/profile.d/rvm.sh \
	&& rvm install ruby 2.2.0 \
	&& gem install bundler --no-ri --no-rdoc
