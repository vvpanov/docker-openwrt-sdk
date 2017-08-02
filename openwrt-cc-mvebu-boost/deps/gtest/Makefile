include $(TOPDIR)/rules.mk

PKG_NAME:=gtest
PKG_VERSION:=1.8.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/google/googletest.git
PKG_SOURCE_VERSION:=e5b88b227e6adfa7196575b1264384e718d16cab
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/gtest-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/gtest
	SECTION:=base
	CATEGORY:=Network
	TITLE:=Google test framwork
	URL:=https://github.com/google/googletest
endef

define Package/gtest/description
 Google test framework, build only static lib
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include/gmock

	$(INSTALL_DIR) \
		$(1)/usr/include/gtest

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/gmock/* \
		$(1)/usr/include/gmock/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/gtest/* \
		$(1)/usr/include/gtest/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) -v $(PKG_INSTALL_DIR)/usr/lib/*.a $(1)/usr/lib/ # copies all compiled archive files
endef

$(eval $(call BuildPackage,gtest))
