#!/bin/bash

set -e

rm -rf tmp
mkdir -p tmp
pushd tmp
  wget https://repo.steampowered.com/steamrt-images-scout/snapshots/latest-steam-client-general-availability/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.Dockerfile
  wget https://repo.steampowered.com/steamrt-images-scout/snapshots/latest-steam-client-general-availability/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.tar.gz
  wget https://release.froggi.es/scout-0.20200214.0-gcc-9.2-binaries.tar.xz

  docker build \
    -f com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.Dockerfile \
    -t dxvk-steamrt-base:latest \
    .

  tar -xJf scout-0.20200214.0-gcc-9.2-binaries.tar.xz

  docker build \
    -f ../dxvk-native-steamrt.Dockerfile \
    -t dxvk-steamrt:latest \
    .
popd
rm -rf tmp
