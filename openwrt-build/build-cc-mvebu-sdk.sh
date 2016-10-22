#!/bin/sh

docker run --rm -it -v $(pwd)/out-cc:/opt/openwrt vpanov/openwrt-build  sh -c "\
	cd /opt && (test -d openwrt/.git ||  git clone -b chaos_calmer git://github.com/openwrt/openwrt.git) && \
	\
	echo 'CONFIG_TARGET_mvebu=y'                >  /opt/openwrt/.config && \
	echo 'CONFIG_TARGET_mvebu_Default=y'        >> /opt/openwrt/.config && \
	echo 'CONFIG_TARGET_BOARD=\"mvebu\"'        >> /opt/openwrt/.config && \
	echo 'CONFIG_ALL=y'                         >> /opt/openwrt/.config && \
	echo 'CONFIG_ALL_KMODS=y'                   >> /opt/openwrt/.config && \
	echo 'CONFIG_IB=y'                          >> /opt/openwrt/.config && \
	echo 'CONFIG_IB_STANDALONE=y'               >> /opt/openwrt/.config && \
	echo 'CONFIG_SDK=y'                         >> /opt/openwrt/.config && \
	echo 'CONFIG_PER_FEED_REPO_ADD_DISABLED=y'  >> /opt/openwrt/.config && \
	echo 'CONFIG_PER_FEED_REPO_ADD_COMMENTED=n' >> /opt/openwrt/.config && \
	\
	cd /opt/openwrt && \
	./scripts/feeds update && \
	./scripts/feeds install luaposix luasocket luci patch qrencode && \
	make defconfig && make V=$V && \
	\
	echo OK!\
"
