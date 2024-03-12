##############################################################
#
# Base file: AESD-ASSIGNMENTS.MK
# Modified for: LDD.MK
# Reference: https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules
# Updates Made: AESD_ASSIGNMENTS replaced with LDD
#             : Commit number of Assignment 7
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
LDD_VERSION = '51876b23773c0f3e65d11a4ff5b328c9fe43cfa5'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-SwathiVenkatachalam.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# Added for A7: build these subdirectories with the MODULE_SUBDIRS option
LDD_MODULE_SUBDIRS = scull/
LDD_MODULE_SUBDIRS += misc-modules/

# Added for A7: misc-modules and scull added to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
endef

# added for A7
$(eval $(kernel-module))
$(eval $(generic-package))
