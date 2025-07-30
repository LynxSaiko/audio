#!/bin/bash
wget https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.7.2.tar.bz2
tar -xf alsa-lib-1.2.7.2.tar.bz2
cd alsa-lib-1.2.7.2
./configure &&
make -j$(nproc)
make install
