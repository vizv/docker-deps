#!/bin/bash
set -e
source /etc/profile.d/rvm.sh
rvm install ruby 2.2.0 \
gem install bundler --no-ri --no-rdoc
