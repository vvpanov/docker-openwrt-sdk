FROM debian
RUN apt-get update && apt-get -y install autoconf ccache cmake g++ gcc git libssl-dev \
	make net-tools patch perl-modules xz-utils wget zip zlib1g-dev && \
	mkdir -p /opt && cd /opt && \
	wget http://mywifi.at/toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi.tar.xz && \
	tar xf toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi.tar.xz && \
	rm toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi.tar.xz && \
	ln -s /opt/toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi /opt/toolchain && \
	echo OK!
