FROM vpanov/openwrt-build

# using sed to replace cp -fpR to cp -fR to let it work on osx with its weird docker virtual fs

RUN \
	wget http://mywifi.at/openwrt/chaos_calmer/mvebu/OpenWrt-ImageBuilder-mvebu.Linux-x86_64.tar.bz2 \
		-O /tmp/imagebuilder.tar.bz2 && \
	tar -xf /tmp/imagebuilder.tar.bz2 -C /opt && \
	rm /tmp/imagebuilder.tar.bz2 && \
	\
	wget http://mywifi.at/openwrt/chaos_calmer/mvebu/OpenWrt-SDK-mvebu_gcc-4.8-linaro_uClibc-0.9.33.2_eabi.Linux-x86_64.tar.bz2 \
		-O /tmp/sdk.tar.bz2 && \
	tar -xf /tmp/sdk.tar.bz2 -C /opt && \
	rm /tmp/sdk.tar.bz2 && \
	\
	mv /opt/OpenWrt-SDK* /opt/SDK && \
	mv /opt/OpenWrt-ImageBuilder* /opt/ImageBuilder && \
	\
	rm -rf /opt/ImageBuilder/staging_dir/host/bin && \
	ln -s /opt/SDK/staging_dir/host/bin /opt/ImageBuilder/staging_dir/host/bin && \
	\
	mkdir -p /opt/src /opt/SDK/package/feeds && \
	ln -s /opt/src /opt/SDK/package/feeds/sdk && \
	ln -s /opt/SDK/bin/mvebu/packages/sdk /opt/ImageBuilder/packages/ && \
	echo "src-link sdk /opt/src" >> /opt/SDK/feeds.conf.default && \
	echo "src sdk file:packages/sdk" >> /opt/ImageBuilder/repositories.conf && \
	\
	\
	mkdir -p /opt/ImageBuilder/bin/mvebu && \
	ln -s /opt/ImageBuilder/bin/mvebu /opt/ImageBuilder/bin/platform && \
	\
	echo '/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4AhiAwJdADQZSdvdrYxwLCqFjE4ev5x0AeRnRhG55ujG\
pSwDewAEv6OZHIYmkHHyS+OcSIueJvjGNjnh0miBcNX3YHy0k9RCYWZJq7aVxI7EB+WHBdc5TPJ3\
dUqJyBnOZ5HW6wxm7BDFiE5rXWdW9hDks3LSSir3s0/VdlxqBhu7zWJKySKiKYktDDkt5zPeKjNt\
TyKnJ3ZRUFjMeoFXC7vut8j8ayfjiJ3VWzgHYVFmJrvAzCefBhj3otn2dP7Z7XgrFiwjcsvWS7Ds\
ZU8TMT2IwxcESAchIWRaY+MhPQFsmb9X6oU2YRyM1ZlqvDtPgS2or8KNq+3PCz4ZWAZP3zMRHmsZ\
0U/2YZelTm3x2c76y86YgKYRUEvf/mnOaGl+X1ChjaqBXQpBnZM8A37CTWqEHOGj28tkXvdc5YsW\
SGGL0BLkTGBisc8j8CpzSK+wYY0x32yOqNPAyizwpkPobB70xjqjQljFttWFsf/ReHR7oSW2NRPZ\
fSJFBA8J9PbBB1KQn6ZvBoCGO5GriAdfLS0vDQpfOXmYCKUaWNEDbA7kfnBJs7ByfMcRYIi6WydE\
JQ8GCpgf8Ys20MeSk64ZcbuvzLJ96LOM6lYpoUb/AXuGz0OSo4vLlPlxrZueAln8NxMlaBFQV32k\
BXX/OwC49s4jVUeHfZR26F4r+5XVN3P07M2DzUKCyFspW/hqsGmdDiIUZjrRAHsari+Sah85FrQk\
7EUI3SmmdnXIYsyXfBK1V8ig/z2ZwTO4/9liJqW7HKPzV7v8+WAu42TxpdaQe2ApMbCg1/UDu5J2\
PpyaDGqte1dJFmghb4yp5BDLr5+0a7e4jcCUtYSQQBARBCHZjyxWBG01ePiFkxbFbrAn+Vwx8PwQ\
CgyxFBlO3J65jTciPqc5nqe9htdYqOdRT8astoDnpRYF8UMzKeEHp+NeNBz1JXywURdz16PY0ROm\
pGqW/mOTAQrgfrZ1+e2R2G/0L5o7WWkNNgjuHMUderGdql7HZKFGZvEa9onm0yJJcWKmScQ2gzTO\
nx0kAAAAUqxyXBE4mCgAAZ4G4xAAAOgblbOxxGf7AgAAAAAEWVo=' \
		| base64 -d | xz -d > /opt/Makefile && \
	sed -i -e 's/cp -fpR/cp -fR/' /opt/*/rules.mk && \
	echo OK!

WORKDIR /opt
CMD make help
