BOARD_KERNEL_DTBO_CFG := dtboimg.cfg
MKDTBOIMG := system/libufdt/utils/src/mkdtboimg.py
APPEND_CERTS := $(DEVICE_PATH)/dtbo/append_certs.py

# BUG: mkdtboimg.py doesn't support absolute paths yet. Fix this later.
define build-dtboimage-target-from-cfg
    $(call pretty,"Target dtbo image from cfg: $(BOARD_PREBUILT_DTBOIMAGE)")
    $(hide) $(MKDTBOIMG) cfg_create $@ $(KERNEL_OUT)/$(BOARD_KERNEL_DTBO_CFG) -d /
    $(hide) chmod a+r $@
endef

$(BOARD_PREBUILT_DTBOIMAGE): $(MKDTBOIMG) $(INSTALLED_KERNEL_TARGET)
	$(build-dtboimage-target-from-cfg)
