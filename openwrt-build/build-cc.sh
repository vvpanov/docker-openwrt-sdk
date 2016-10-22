#!/bin/sh

docker run --rm -it -v $(pwd)/out-cc:/opt/openwrt vpanov/openwrt-build bash
