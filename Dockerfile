FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cpanminus \
    docbook-xml \
    docbook-xsl \
    libexpat1-dev \
    xsltproc

RUN cpanm -n XML::Parser YAML

COPY yaml-spec-builder /

ENTRYPOINT /yaml-spec-builder
