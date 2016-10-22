#!/bin/sh

docker run --rm -it -v $(pwd)/out-cc:/opt/openwrt vpanov/openwrt-build  sh -c "\
	wget http://launchpadlibrarian.net/274677369/b43-fwcutter_019-3_amd64.deb && \
	dpkg -i b43*deb && \
	export PATH=\$PATH:/opt/openwrt/tools/b43-tools/files && \
	\
	cd /opt && (test -d openwrt/.git ||  git clone -b chaos_calmer git://github.com/openwrt/openwrt.git) && \
	\
	echo 'CONFIG_TARGET_sunxi=y'                >  /opt/openwrt/.config && \
	echo 'CONFIG_TARGET_sunxi_Default=y'        >> /opt/openwrt/.config && \
	echo 'CONFIG_TARGET_BOARD=\"sunxi\"'        >> /opt/openwrt/.config && \
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
