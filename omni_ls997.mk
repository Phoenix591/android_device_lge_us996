# Release name
PRODUCT_RELEASE_NAME := ls997

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PACKAGES += \
	charger_res_images \
	charger

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ls997
PRODUCT_MODEL := LG-LS997
PRODUCT_NAME := omni_ls997
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE
PRODUCT_COPY_FILES += device/lge/$(PRODUCT_DEVICE)/recovery.fstab:recovery/root/etc/twrp.flags
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -lt 26; echo $$?),0) #if oreo or above
PRODUCT_COPY_FILES += system/timezone/output_data/iana/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
else
PRODUCT_COPY_FILES += bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
endif
