FROM       phusion/baseimage:bionic-1.0.0

#======================================================================
# Install standard stuff.
#======================================================================
RUN rm -rf /etc/service/cron /etc/service/sshd/down
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN  apt-get update \
  && apt-get install -y \
    cmake \
    curl \
    less \
    g++ \
    git \
    libcurl4-openssl-dev \
    libstdc++-7-dev \
    libssl-dev \
    locales \
    make \
    sudo \
    vim \
    wget \
    zlib1g-dev

#======================================================================
# Create a user.
#======================================================================
RUN for uname in jpl; do \
  useradd --create-home --shell /bin/bash $uname \
  && adduser $uname sudo \
  && adduser $uname adm \
  && touch /home/$uname/.sudo_as_admin_successful \
  && chown -R $uname /home/$uname \
  ; done

RUN echo jpl:asdf | chpasswd

#======================================================================
# Check out the SDK. For the build to succeed, I've done this:
#  git checkout 1.8.145
#  cd aws-sdk-cpp
#  mkdir build
#  cd build
#  cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="ecr"
#  make
#  make install
#======================================================================
RUN cd /home/jpl \
  && git clone https://github.com/aws/aws-sdk-cpp.git \
  && chown -R jpl aws-sdk-cpp



CMD ["/sbin/my_init"]
