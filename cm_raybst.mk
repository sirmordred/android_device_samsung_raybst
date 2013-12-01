$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/raybst/raybst-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/raybst/overlay

LOCAL_PATH := device/samsung/raybst

PRODUCT_COPY_FILES += \
	device/samsung/raybst/ramdisk/fstab.qcom:root/fstab.qcom \
	device/samsung/raybst/ramdisk/init.goldfish.rc:root/init.goldfish.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_raybst
PRODUCT_DEVICE := raybst
