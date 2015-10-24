LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),logan2g)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
