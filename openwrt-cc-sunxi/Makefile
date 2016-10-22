help:
	@echo "Container usage"
	@echo
	@echo "Mount points:"
	@echo "	/opt/src	folder with OpenWRT packages"
	@echo "	/opt/sdk	folder to store SDK build cache"
	@echo "	/opt/image	folder to store ImageBuilder output images"
	@echo
	@echo "Common example:"
	@echo "make world cache image1 PROFILE1=xxx PACKAGES1=example output"
	@echo
	@echo "Targets:"
	@echo "	cache	save build cache - changed files after SDK build"
	@echo "	output	save resulting image files"
	@echo "## https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk"
	@echo "	world - compile everything in SDK"
	@echo "	package/example/download"
	@echo "	package/example/compile"
	@echo "	package/example/clean"
	@echo "	package/index"
	@echo "## https://wiki.openwrt.org/doc/howto/obtain.firmware.generate"
	@echo "	info - print available profiles information"
	@echo "	image PROFILE= PACKAGES= FILES= - pack an image"

start:
	@echo Checking build cache
	@[ -e sdk/sdk.tar ] && (echo Unpacking; tar xf sdk/sdk.tar) || echo None
	@[ -e SDK/timestamp ] || touch SDK/timestamp

cache:
	@echo Checking if saving cache is requested
	@(mount | grep opt/sdk) && (echo Packing; tar -cf sdk/sdk.tar -N ./SDK/timestamp SDK) || echo Skipping

output:
	@echo Checking if saving image is requested
	@(mount | grep opt/image) && (echo Copying; cp ImageBuilder/bin/platform/* /opt/image) || echo Skipping

# sdk
world: start
	@make V=$V -C SDK $@

package/%/download: start
	@make V=$V -C SDK $(@:package/%/compile=package/feeds/sdk/%/compile)

package/%/compile: start
	@make V=$V -C SDK $(@:package/%/compile=package/feeds/sdk/%/compile)

package/%/clean: start
	@make V=$V -C SDK $(@:package/%/compile=package/feeds/sdk/%/compile)

package/index: start
	@make V=$V -C SDK $(@:package/%/compile=package/feeds/sdk/%/compile)

# imagebuilder
info:
	@make -C ImageBuilder $@ V=$V

image: start
	@make -C ImageBuilder image PROFILE="$(PROFILE)" PACKAGES="$(PACKAGES)" FILES="$(FILES)"

image%: start
	@make -C ImageBuilder image PROFILE="$(PROFILE$(@:image%=%))" PACKAGES="$(PACKAGES$(@:image%=%))" FILES="$(FILES$(@:image%=%))"

sh:
	sh

.PHONY: help start cache output info image image% package% sh
