# Dockerizing Catmandu

FROM debian:jessie
MAINTAINER Vitali Peil

RUN apt-get update && apt-get install -y \
  sudo \
  cpanminus \
  build-essential \
  libexpat1-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  libgdbm-dev \
  libcapture-tiny-perl\
  curl \
  wget \
  nano \
  vim \
  bsdmainutils \
  tree \
  man-db \
  perl-doc

RUN adduser --disabled-password --gecos "" catmandu

COPY . /home/catmandu

WORKDIR /home/catmandu

RUN cpanm -n -q --installdeps . && \
  rm -rf /var/lib/apt/lists/*

RUN chown catmandu:catmandu *

USER catmandu

CMD ["/bin/bash"]
