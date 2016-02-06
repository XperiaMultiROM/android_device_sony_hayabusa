#
# Copyright (C) 2013-2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Board device path
DEVICE_PATH := device/sony/hayabusa

# Board Vendor
BOARD_VENDOR := sony

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8960
BOARD_VENDOR_PLATFORM := blue
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/msm8x60
TARGET_KERNEL_CONFIG := cm_blue_hayabusa_defconfig
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel

# Kernel configurations
BOARD_KERNEL_BASE  := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := # Ignored
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01700000

# Vold
BOARD_VOLD_MAX_PARTITIONS := 18
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Custom boot
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/boot/custombootimg.mk
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_NO_SEPARATE_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP configurations
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TW_BRIGHTNESS_PATH := /sys/devices/i2c-10/10-0040/leds/lcd-backlight_1/brightness
TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/i2c-10/10-0040/leds/lcd-backlight_2/brightness
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_KEY_LOC := "footer"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/Userdata"
TW_DEFAULT_BRIGHTNESS := 51
TW_EXCLUDE_SUPERSU := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_FLASH_FROM_STORAGE := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_JB_CRYPTO := false
TW_INCLUDE_L_CRYPTO := true
TW_INCLUDE_CRYPTO := true
TW_INPUT_BLACKLIST := "apds9702\nbma250\ncompass"
TW_HAS_NO_RECOVERY_PARTITION := true
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true
TW_THEME := portrait_hdpi

# MultiROM configuration
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(DEVICE_PATH)/multirom/mr_init_devices.c
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_DPI := hdpi
MR_DPI_FONT := 216
MR_FSTAB := $(DEVICE_PATH)/recovery.fstab
MR_USE_MROM_FSTAB := true
MR_KEXEC_MEM_MIN := 0x85000000
MR_DEVICE_VARIANTS := C5302 C5303 C5306
MR_UNIFIED_TABS := true

# MultiROM build
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_IS_MULTIROM := true
