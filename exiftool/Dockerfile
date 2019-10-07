FROM nginx:stable-alpine
MAINTAINER Jacques Moati <jacques@moati.net>


RUN cd /tmp && \
    apk --update add perl && \
    wget https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-11.69.tar.gz && \
    tar -xzvf Image-ExifTool-*.tar.gz && \
    rm -rf Image-ExifTool-*.tar.gz && \
    cd Image-ExifTool-* && \
    rm -rf html t Change Makefile.PL MANIFEST META.json META.yml perl-Image-ExifTool.spec README && \
    mv * /usr/local/bin/ && \
    rm -rf /tmp/Image-ExifTool-*
