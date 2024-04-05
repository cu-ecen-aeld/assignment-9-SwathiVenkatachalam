##############################################################
#
# Base file: AESDCHAR-DRIVER.MK
# Modified from: LDD.MK
# Reference: https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules
# Updates Made: LDD replaced with AESDCHAR-DRIVER for A8
#             : Commit number of Assignment 3
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_DRIVER_VERSION = '787a4996d3ead5f734447d975076cec8a6555940'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-SwathiVenkatachalam.git'
AESDCHAR_DRIVER_SITE_METHOD = git
AESDCHAR_DRIVER_GIT_SUBMODULES = YES

# Added for A8: build these subdirectories with the MODULE_SUBDIRS option
AESDCHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver

# Added for A8: aesdchar-driver added to the installation steps below
define AESDCHAR_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/bin
        $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchardriver-start-stop.sh $(TARGET_DIR)/etc/init.d/S97aesdchar
endef

# added for A7
$(eval $(kernel-module))
$(eval $(generic-package))
