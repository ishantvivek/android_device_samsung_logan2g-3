#
# Copyright (C) 2013 The CyanogenMod Project
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

# Get minimum languages available
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/logan2g/logan2g-vendor.mk)

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Overlay
# DEVICE_PACKAGE_OVERLAYS += device/samsung/logan2g/overlay

# Use high-density artwork where available; GT-S7262 supports hdpi (high) ~240dpi.
# However the platform doesn't currently contain all of the bitmaps at hdpi density.
# So we do this little trick to fall back to the mdpi version if the hdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal ldpi mdpi hdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Set local path
LOCAL_PATH := device/samsung/logan2g

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin ../../sbin/sh)

# Files to be copied
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/rootdir/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.usb.rc:root/init.sc6820i.usb.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc6820i.rc:root/ueventd.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm \
    $(LOCAL_PATH)/rootdir/bin/rawdatad:root/bin/rawdatad

# Recovery
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/rootdir/init.recovery.sc6820i.rc:root/init.recovery.sc6820i.rc

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# Packages
# Filesystem
PRODUCT_PACKAGES += \
    setup_fs

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Properties
# Default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Graphic properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.product.hardware=logan

# SPRD-SCI default build.prop properties overrides
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.product.chipset=sc6820i \
    ro.com.android.dataroaming=false \
    persist.msms.phone_count=2 \
    persist.sys.sprd.modemreset=1

# Google-specific location properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs before they have a chance to cause problems.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enterprise_mode=1 \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false \
    dalvik.gc.type=precise \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=128m \
    ro.telephony.ril_class=SamsungSPRDRIL \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=150 \
    mobiledata.interfaces=rmnet0 \
    ro.zygote.disable_gl_preload=true \
    persist.radio.multisim.config=none \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.call_ring=0 \
    ro.crypto.state=unsupported \
    ro.com.google.gmsversion=4.1_r6 \
    boot.fps=7

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
