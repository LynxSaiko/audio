#!/bin/bash
echo "[*] Build Libogg"
wget https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.xz
tar -xf libogg-1.3.5.tar.xz
cd libogg-1.3.5
./configure --prefix=/usr    \
            --disable-static
make -j$(nproc)
make install
echo "[*] Selesai"

echo "[*] Build Flac"
wget https://downloads.xiph.org/releases/flac/flac-1.3.4.tar.xz
tar -xf flac-1.3.4.tar.xz
cd flac-1.3.4
./configure --prefix=/usr                                \
            --disable-thorough-tests                     
make -j$(nproc)
make install
echo "Selesai"

echo "[*] Build Opus"
wget https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
tar -xf opus-1.3.1.tar.gz
cd opus-1.3.1
./configure --prefix=/usr    \
            --disable-static
make -j$(nproc)
make install
echo "SELESAI"

echo "Build Libvorbis"
wget https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz
tar -xf libvorbis-1.3.7.tar.xz
cd libvorbis-1.3.7
/configure --prefix=/usr --disable-static &&
make -j$(nproc)
make install
echo "Selesai"

echo "Build Libsndfile"
wget https://github.com/libsndfile/libsndfile/releases/download/1.1.0/libsndfile-1.1.0.tar.xz
tar -xf libsndfile-1.1.0.tar.xz
cd libsndfile-1.1.0
./configure --prefix=/usr
make -j$(nproc)
make install
echo "Selesai"

echo "Build Pulseaudio"
wget https://www.freedesktop.org/software/pulseaudio/releases/pulseaudio-16.1.tar.xz
tar -xf pulseaudio-16.1.tar.xz
cd pulseaudio-16.1
mkdir build &&
cd    build &&

meson --prefix=/usr       \
      --buildtype=release \
      -Ddatabase=gdbm     \
      -Ddoxygen=false     \
      -Dbluez5=disabled   &&
ninja -j$(nproc)
ninja install
rm -fv /etc/dbus-1/system.d/pulseaudio-system.conf


