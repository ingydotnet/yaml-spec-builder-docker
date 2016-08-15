FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cpanminus \
    docbook-xml \
    docbook-xsl \
    libexpat1-dev \
    xsltproc \
    \
    git gist vim

RUN cpanm -n XML::Parser YAML

WORKDIR /yaml-spec

ENTRYPOINT ["make", "spec"]
