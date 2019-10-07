FROM nginx:stable-alpine
MAINTAINER Jacques Moati <jacques@moati.net>


RUN cd /tmp && \
    wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    apk --update add xz && \
    tar -xJf ffmpeg-release-amd64-static.tar.xz && \
    apk del --purge xz && \
    rm -rf ffmpeg-release-amd64-static.tar.xz && \
    cd ffmpeg-* && \
    mv ffmpeg ffprobe qt-faststart /usr/bin/ && \
    rm -rf /tmp/ffmpeg-*
