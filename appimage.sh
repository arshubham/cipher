#!/bin/bash
# A script to install appimage 
git clone https://github.com/arshubham/cipher
cd cipher
meson build --prefix=/AppDir/usr
cd build
ninja
sudo ninja install
cd ..
cd ..
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage
sudo cp /AppDir/usr/share/applications/* /Appdir/
unset QTDIR; unset QT_PLUGIN_PATH ; unset LD_LIBRARY_PATH
./linuxdeployqt-continuous-x86_64.AppImage /AppDir/usr/share/applications/com.github.arshubham.cipher.desktop -appimage -unsupported-allow-new-glibc -unsupported-bundle-everything
cd cipher
cd build 
sudo ninja uninstall
cd ..
cd ..
sudo rm -r cipher
