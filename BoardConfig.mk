#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/motorola/ghost/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/ghost

BOARD_VENDOR := motorola-qcom

# Assert
TARGET_OTA_ASSERT_DEVICE := xt1052,ghost,xt1053,ghost_retail,xt1055,ghost_usc,xt1056,ghost_sprint,xt1058,ghost_att,ghost_rcica,xt1060,ghost_verizon

# AIDs and CAPS
TARGET_FS_CONFIG_GEN := \
    $(LOCAL_PATH)/fs_config/mot_aids.txt \
    $(LOCAL_PATH)/fs_config/file_caps.txt

# Filesystem
TARGET_FS_CONFIG_GEN := $(LOCAL_PATH)/config.fs

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno320
BOARD_USES_QCOM_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 androidboot.write_protect=0
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_LZ4C_DT := true
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02200000 --dt $(LOCAL_PATH)/dt.img
LZMA_RAMDISK_TARGETS := boot,recovery
TARGET_KERNEL_SOURCE := kernel/motorola/ghost
TARGET_KERNEL_CONFIG := lineageos_ghost_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_SELINUX_CONFIG := msm8960_mmi_selinux_defconfig

# Audio
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_EXTERNAL_SPEAKER := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_USBAUDIO := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_GENERIC_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true

# Bionic
TARGET_LD_SHIM_LIBS := \
    /system/vendor/bin/mpdecision|libshims_atomic.so \
    /system/vendor/bin/thermal-engine|libshims_thermal.so \
    /system/lib/libjustshoot.so|libshim_camera.so \
    /system/lib/libjscore.so|libshim_camera.so \
    /system/lib/libmot_sensorlistener.so|libshims_sensorlistener.so \
    /system/vendor/lib/libmdmcutback.so|libqsap_shim.so

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# Camera
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true

# Display
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true

# Hardware
BOARD_HARDWARE_CLASS := device/motorola/ghost/lineagehw

# HIDL
DEVICE_MANIFEST_FILE := device/motorola/ghost/configs/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_ghost
TARGET_NR_SVC_SUPP_GIDS := 28

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1560281088
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12884901888
TARGET_USES_MKE2FS := true

# Power
TARGET_HAS_NO_POWER_STATS := true
TARGET_HAS_NO_WIFI_STATS := true
TARGET_USES_INTERACTION_BOOST := true

# Qualcomm support

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Ril
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_11
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_11
TARGET_RIL_VARIANT := caf

# SDClang
TARGET_USE_SDCLANG := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
include device/qcom/sepolicy/legacy-sepolicy.mk

BOARD_SEPOLICY_DIRS += device/motorola/ghost/sepolicy

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_ghost
TARGET_RECOVERY_DEVICE_MODULES := libinit_ghost

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA   := "sta"
WIFI_DRIVER_FW_PATH_AP    := "ap"
