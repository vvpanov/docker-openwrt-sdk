FROM debian
RUN \
	dpkg  --add-architecture i386 && \
	apt-get update && \
	apt-get -y install autoconf ccache cmake g++ gcc \
		git gnupg libc6:i386 libssl-dev make \
		net-tools openssl p7zip patch perl-modules \
		xz-utils wget zip zlib1g-dev && \
	\
	mkdir -p /opt && cd /opt && \
	wget http://mywifi.at/toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi.tar.xz && \
	tar xf toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi.tar.xz && \
	rm toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi.tar.xz && \
	ln -s /opt/toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi /opt/toolchain && \
	ln -s /opt/toolchain-arm_cortex-a9_gcc-6.1.0_musl-1.1.15_eabi /opt/toolchain-arm && \
	echo OK!
