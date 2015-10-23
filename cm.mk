## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := logan2g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/logan2g/device_logan2g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := logan2g
PRODUCT_NAME := cm_logan2g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := logan2g
PRODUCT_MANUFACTURER := samsung
