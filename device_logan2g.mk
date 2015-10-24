# Get minimum languages available
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/logan2g/logan2g-vendor.mk)

# DEVICE_PACKAGE_OVERLAYS += device/samsung/logan2g/overlay

LOCAL_PATH := device/samsung/logan2g

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin ../../sbin/sh)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/recovery/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.sc6820i.rc:root/init.recovery.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm

ADDITIONAL_DEFUALT_PROPERTIES += \
	persist.sys.usb.config=mtp \
	ro.product.chipset=sc6820i \
	ro.opengles.version=131072 \
	ro.product.hardware=logan \
	ro.setupwizard.enterprise_mode=1 \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false \
	dalvik.gc.type=precise \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.heapgrowthlimit=96m \
	dalvik.vm.heapsize=128m \
	ro.zygote.disable_gl_preload=true \
	ro.crypto.state=unsupported \
	ro.com.google.gmsversion=4.1_r6 \
	boot.fps=7

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_logan2g
PRODUCT_DEVICE := logan2g
