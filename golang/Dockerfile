# adds glide to golang
FROM golang:1.7-alpine
RUN \
	apk update && \
	apk add \
		ca-certificates \
		git \
		openssl \
		make \
		&& \
	mkdir -p /tmp/glide && cd /tmp/glide && \
	wget https://github.com/Masterminds/glide/releases/download/v0.12.3/glide-v0.12.3-linux-amd64.tar.gz && \
	tar xvf glide-v0.12.3-linux-amd64.tar.gz && \
	mv linux-amd64/glide /usr/bin/glide && \
	cd / && \
	rm -rf /tmp/glide && \
	rm -rf /var/cache/apk/* && \
	echo OK!
