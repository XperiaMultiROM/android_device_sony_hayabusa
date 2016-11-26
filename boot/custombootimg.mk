LOCAL_PATH := $(call my-dir)

DEVICE_BOOTDIR := device/sony/hayabusa/boot
DEVICE_CMDLINE := $(DEVICE_BOOTDIR)/cmdline.txt
DEVICE_LOGORLE := $(DEVICE_BOOTDIR)/logo.rle
DEVICE_RPMBIN := device/sony/hayabusa/prebuilts/RPM.bin
MKELF := $(DEVICE_BOOTDIR)/mkelf.py

MKELF_ARGS :=
BOARD_KERNEL_NAME := $(strip $(BOARD_KERNEL_NAME))
ifdef BOARD_KERNEL_NAME
  MKELF_ARGS += -n $(BOARD_KERNEL_NAME)
endif

recovery_uncompressed_twrp_ramdisk := $(PRODUCT_OUT)/ramdisk-twrp.cpio
$(recovery_uncompressed_twrp_ramdisk): $(MKBOOTFS) \
		$(INTERNAL_RECOVERYIMAGE_FILES) \
		$(recovery_initrc) $(recovery_sepolicy) $(recovery_kernel) \
		$(INSTALLED_2NDBOOTLOADER_TARGET) \
		$(recovery_build_prop) $(recovery_resource_deps) $(recovery_root_deps) \
		$(recovery_fstab) \
		$(RECOVERY_INSTALL_OTA_KEYS) \
		$(INTERNAL_BOOTIMAGE_FILES)
	$(call build-recoveryramdisk)
	@echo -e ${CL_CYN}"----- Making uncompressed recovery ramdisk ------"${CL_RST}
	$(hide) cp $(DEVICE_LOGORLE) $(TARGET_RECOVERY_ROOT_OUT)/
	$(hide) $(MKBOOTFS) $(TARGET_RECOVERY_ROOT_OUT) > $@

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MINIGZIP) \
		$(recovery_uncompressed_twrp_ramdisk) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) rm -f $(PRODUCT_OUT)/ramdisk-recovery.cpio
	$(hide) mv $(recovery_uncompressed_twrp_ramdisk) $(PRODUCT_OUT)/ramdisk-recovery.cpio
	$(hide) $(MINIGZIP) < $(PRODUCT_OUT)/ramdisk-recovery.cpio > $(PRODUCT_OUT)/ramdisk-recovery.img
	$(hide) python $(MKELF) $(MKELF_ARGS) -o $@ $(PRODUCT_OUT)/kernel@0x80208000 $(PRODUCT_OUT)/ramdisk-recovery.img@0x81900000,ramdisk $(DEVICE_RPMBIN)@0x00020000,rpm $(DEVICE_CMDLINE)@cmdline
	$(call pretty,"Made recovery image: $@")
