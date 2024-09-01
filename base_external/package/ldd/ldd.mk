LDD_VERSION = '70ce65fde92f861710c8a78ebd1cbd7c7210c058'
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-raffy909.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
#endef

# https://buildroot.org/downloads/manual/adding-packages-kernel-module.txt
LDD_MODULE_SUBDIRS = scull misc-modules

# Copy drivers stuff to buildroot rootfs
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
