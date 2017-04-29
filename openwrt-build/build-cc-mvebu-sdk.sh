#!/bin/sh

docker run --rm -it \
	-v $(pwd)/out-cc:/opt/openwrt \
	-v $(pwd)/patches:/opt/patches \
	-v $(pwd)/dl:/opt/openwrt-build/dl \
		vpanov/openwrt-build  sh -c "\
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
	git checkout c170d84 && \
	./scripts/feeds update && \
	./scripts/feeds install luaposix luasocket luci patch qrencode && \
	\
	tar c * .* | tar xv -C /opt/openwrt-build && \
	cd /opt/openwrt-build && \
	git config --global user.email dummy@dummy.org && \
	git config --global user.name dummy && \
	git cherry-pick ca77544 && \
	cat /opt/patches/* | patch -p1 && \
	\
	make defconfig && make V=$V && \
	\
	tar cvf /opt/openwrt/build-mvebu.tar /opt/openwrt-build/bin/mvebu && \
	echo OK!\
"
