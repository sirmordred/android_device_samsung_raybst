$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/raybst/raybst-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/raybst/overlay

LOCAL_PATH := device/samsung/raybst
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	device/samsung/raybst/ramdisk/init:root/init \
	device/samsung/raybst/ramdisk/fstab.qcom:root/fstab.qcom \
	device/samsung/raybst/ramdisk/init.target.rc:root/init.target.rc \
	device/samsung/raybst/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/samsung/raybst/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_raybst
PRODUCT_DEVICE := raybst
