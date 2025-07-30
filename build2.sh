#!/bin/bash
wget https://anduin.linuxfromscratch.org/BLFS/x264/x264-20220819.tar.xz
tar -xf x264-20220819.tar.xz
cd x264-20220819
./configure --prefix=/usr \
            --enable-shared
make -j$(nproc)
make install

wget https://anduin.linuxfromscratch.org/BLFS/x265/x265-20220819.tar.xz
tar -xf x265-20220819.tar.xz
cd x265-20220819
mkdir bld &&
cd    bld &&
cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DGIT_ARCHETYPE=1 ../source &&
make -j$(nproc)
make install
rm -vf /usr/lib/libx265.a 

echo "Selesai"


wget https://github.com/libass/libass/releases/download/0.16.0/libass-0.16.0.tar.xz
tar -xf libass-0.16.0.tar.xz
cd libass-0.16.0
./configure --prefix=/usr --disable-static &&
make -j$(nproc)
make install


wget https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.xz
tar -xf libtheora-1.1.1.tar.xz
cd libtheora-1.1.1
sed -i 's/png_\(sizeof\)/\1/g' examples/png2theora.c &&
./configure --prefix=/usr --disable-static &&
make -j$(nproc)
make install
cd examples/.libs &&
for E in *; do
  install -v -m755 $E /usr/bin/theora_${E}
done
