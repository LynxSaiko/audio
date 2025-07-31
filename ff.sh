#!/bin/bash
wget https://ffmpeg.org/releases/ffmpeg-5.1.tar.xz
wget https://www.linuxfromscratch.org/patches/blfs/11.2/ffmpeg-5.1-chromium_method-1.patch
tar -xf ffmpeg-5.1.tar.xz
cd ffmpeg-5.1
patch -Np1 -i ../ffmpeg-5.1-chromium_method-1.patch
sed -i 's/-lflite"/-lflite -lasound"/' configure &&

./configure --prefix=/usr        \
            --enable-gpl         \
            --enable-version3    \
            --enable-nonfree     \
            --disable-static     \
            --enable-shared      \
            --disable-debug      \
            --enable-libass      \
            --enable-libfdk-aac  \
            --enable-libfreetype \
            --enable-libmp3lame  \
            --enable-libopus     \
            --enable-libtheora   \
            --enable-libvorbis   \
            --enable-libvpx      \
            --enable-libx264     \
            --enable-libx265     \
            --enable-openssl
make -j$(nproc) &&

gcc tools/qt-faststart.c -o tools/qt-faststart
make install &&

install -v -m755    tools/qt-faststart /usr/bin &&
