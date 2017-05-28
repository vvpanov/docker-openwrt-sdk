FROM debian
RUN \
	apt-get -y update && \
	apt-get -y install \
		bsdmainutils build-essential \
		ccache \
		gawk gettext git \
		libgnutls28-dev libncurses5-dev libssl-dev \
		mercurial \
		pkg-config \
		subversion \
		unzip \
		wget \
		xsltproc \
		zlib1g-dev \
		zip \
		&& \
	rm -rf /var/lib/apt/lists/* && \
	\
	echo OK!
