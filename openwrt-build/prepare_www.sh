#!/bin/sh

copy_plat() {
	echo Preparing www release folder for $1
	mkdir -p www/openwrt/chaos_calmer/$1/packages/base
	cp -r out-cc/bin/$1/packages/base/*  www/openwrt/chaos_calmer/$1/packages/base/
	cp out-cc/bin/$1/OpenWrt-[IS][mD][aK]* www/openwrt/chaos_calmer/$1/
}

copy_plat mvebu
copy_plat sunxi
