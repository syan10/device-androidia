# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/project-celadon/mixins/groups/device-specific/cel_kbl_acrn/product.mk
##############################################################
TARGET_BOARD_PLATFORM := broxton

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.$(TARGET_DEVICE).rc \
    $(LOCAL_PATH)/init.recovery.rc:root/init.recovery.$(TARGET_DEVICE).rc \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.$(TARGET_DEVICE).rc \


# Camera: Device-specific configuration files.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:vendor/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:vendor/etc/permissions/android.hardware.camera.front.xml \


PRODUCT_PACKAGES += android.hardware.keymaster@3.0-impl \
                    android.hardware.keymaster@3.0-service \
                    android.hardware.wifi@1.0-service \
                    android.hardware.bluetooth@1.0-service.vbt \
                    android.hardware.usb@1.0-impl \
                    android.hardware.usb@1.0-service \
                    android.hardware.dumpstate@1.0-impl \
                    android.hardware.dumpstate@1.0-service \
                    camera.device@1.0-impl \
                    android.hardware.camera.provider@2.4-impl \
                    android.hardware.camera.provider@2.4-service \
                    android.hardware.graphics.mapper@2.0-impl \
                    android.hardware.graphics.allocator@2.0-impl \
                    android.hardware.graphics.allocator@2.0-service \
                    android.hardware.renderscript@1.0-impl \
                    android.hardware.graphics.composer@2.1-impl \
                    android.hardware.graphics.composer@2.1-service \
                    libbt-vendor \

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/device-specific/manifest.xml:vendor/manifest.xml

PRODUCT_PACKAGES += \
                   android.hardware.audio@2.0-impl \
                   android.hardware.audio@2.0-service \
                   android.hardware.audio.effect@2.0-impl \
                   android.hardware.soundtrigger@2.0-impl \
                   android.hardware.broadcastradio@1.0-impl
##############################################################
# Source: device/intel/project-celadon/mixins/groups/slot-ab/true/product.mk
##############################################################
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_verifier \
    libavb \
    bootctrl.avb \
    bootctrl.intel \
    bootctrl.intel.static \
    update_engine_sideload \
    avbctl \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.bootctrl=intel
##############################################################
# Source: device/intel/project-celadon/mixins/groups/boot-arch/vsbl/product.mk
##############################################################
IFWI_VARIANT := release

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab:root/fstab.$(TARGET_DEVICE) \
	frameworks/native/data/etc/android.software.verified_boot.xml:vendor/etc/permissions/android.software.verified_boot.xml
TARGET_NO_DEVICE_UNLOCK := false
TARGET_BOOT_SIGNER := ias
TARGET_IAFW_ARCH := i386

# Libpayload configuration for ABL
LIBPAYLOAD_BASE_ADDRESS := 0x12800000
LIBPAYLOAD_HEAP_SIZE := 125829120
LIBPAYLOAD_STACK_SIZE := 1048576

LIBEFIWRAPPER_DRIVERS := s8250mem32 lprtc lpmemmap virtual_media dw3 cf9 abl

CAPSULE_SOURCE := sbl

# Disable Kernelflinger UI support
KERNELFLINGER_USE_UI := false
# Support boot from osloader
KERNELFLINGER_SUPPORT_NON_EFI_BOOT := true
KERNELFLINGER_SECURITY_PLATFORM := vsbl
# Disable kernelflinger debug print to save boot time
KERNELFLINGER_DISABLE_DEBUG_PRINT := true
KERNELFLINGER_DISABLE_EFI_MEMMAP := true

ABL_OS_KERNEL_KEY := $(INTEL_PATH_BUILD)/testkeys/slimboot
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/persistent

# Kernelflinger will set IOC_USE_SLCAN variable
# Distinguish between MRB IOC and NON_MRB_IOC
IOC_USE_SLCAN := false
# Use SHA256 implemented with Intel SHA extension instructions
KERNELFLINGER_USE_IPP_SHA256 := False


EFIWRAPPER_USE_EC_UART := true

TARGET_UEFI_ARCH := x86_64
KERNELFLINGER_TRUSTY_PLATFORM := vsbl
##############################################################
# Source: device/intel/project-celadon/mixins/groups/wlan/mwifiex/product.mk
##############################################################
PRODUCT_PACKAGES += \
    pcie8897_wlan.bin \
    pcieuart8897_combo.bin \
    cal_data.conf

PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_cli \
    iw

PRODUCT_COPY_FILES += \
    $(INTEL_PATH_COMMON)/wlan/wpa_supplicant-common.conf:vendor/etc/wifi/wpa_supplicant.conf \
    $(INTEL_PATH_COMMON)/wlan/mwifiex/wpa_supplicant_overlay.conf:vendor/etc/wifi/wpa_supplicant_overlay.conf \
    $(INTEL_PATH_COMMON)/wlan/mwifiex/p2p_supplicant_overlay.conf:vendor/etc/wifi/p2p_supplicant_overlay.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:vendor/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:vendor/etc/permissions/android.hardware.wifi.direct.xml
##############################################################
# Source: device/intel/project-celadon/mixins/groups/kernel/gmin64/product.mk.1
##############################################################
TARGET_KERNEL_ARCH := x86_64

##############################################################
# Source: device/intel/project-celadon/mixins/groups/kernel/gmin64/product.mk
##############################################################
# FIXME: Modules are copied twice in the system
# - as a flat directory where all modules are. This is the method that android's insmod is expecting modules to be
# - as a tree of modules as output by the kernel build system. This is the way hald's libkmod is expecting modules to be
# on binary kernel directories/artifactory tarballs, flat directory is stored in $(ARCH)/modules, while tree directory is stored in $(ARCH)/lib/modules
# both directories contain same data



KERNEL_MODULES_ROOT_PATH ?= vendor/lib/modules
KERNEL_MODULES_ROOT ?= $(KERNEL_MODULES_ROOT_PATH)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.boot.moduleslocation=/$(KERNEL_MODULES_ROOT_PATH)

##############################################################
# Source: device/intel/project-celadon/mixins/groups/sepolicy/permissive/product.mk
##############################################################
PRODUCT_PACKAGES += sepolicy-areq-checker
##############################################################
# Source: device/intel/project-celadon/mixins/groups/vendor-partition/true/product.mk
##############################################################

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/sh_recovery:recovery/root/vendor/bin/sh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/mkshrc_recovery:recovery/root/vendor/etc/mkshrc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/toolbox_recovery:recovery/root/vendor/bin/toolbox_static
PRODUCT_PACKAGES += \
     toybox_static \
     toybox_vendor \
##############################################################
# Source: device/intel/project-celadon/mixins/groups/display-density/medium/product.mk
##############################################################
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160
##############################################################
# Source: device/intel/project-celadon/mixins/groups/dalvik-heap/tablet-7in-400dpi-4096/product.mk
##############################################################
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=288m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

#We want to use default GC as GENCOPYING,with bpssize=128m for large heaps
ART_DEFAULT_GC_TYPE?=CC
ifeq ($(ART_DEFAULT_GC_TYPE),GENCOPYING)
    PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heap.bpssize=128m
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/pstore/ram_dummy/product.mk
##############################################################
PRODUCT_PACKAGES += \
    pstore-clean
##############################################################
# Source: device/intel/project-celadon/mixins/groups/media/mesa/product.mk
##############################################################
# libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxhw32 \
    libmfx_omx_core \
    libmfx_omx_components_hw

# Open source media_driver
PRODUCT_PACKAGES += i965_drv_video
PRODUCT_PACKAGES += libigfxcmrt

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfxhw64
endif

PRODUCT_PACKAGES += \
    libmfxsw32 \
    libmfx_omx_components_sw

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfxsw64
endif


PRODUCT_PACKAGES += \
    libpciaccess
##############################################################
# Source: device/intel/project-celadon/mixins/groups/graphics/mesa/product.mk
##############################################################
# Mesa
PRODUCT_PACKAGES += \
    libGLES_mesa \
    libGLES_android

PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    libsync \
    libmd

PRODUCT_PACKAGES += ufo_prebuilts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/graphics/drirc:system/etc/drirc


# HWComposer IA
PRODUCT_PACKAGES += \
    hwcomposer.$(TARGET_BOARD_PLATFORM)

PRODUCT_PROPERTY_OVERRIDES += \
   hwc.drm.use_overlay_planes=1 \
   ro.hardware.hwcomposer=$(TARGET_BOARD_PLATFORM)

INTEL_HWC_CONFIG := $(INTEL_PATH_VENDOR)/external/hwcomposer-intel

ifeq ($(findstring _acrn,$(TARGET_PRODUCT)),_acrn)
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display_virt.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.ini
else
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.ini
endif


# Mini gbm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=$(TARGET_BOARD_PLATFORM)

PRODUCT_PACKAGES += \
    gralloc.$(TARGET_BOARD_PLATFORM)



# Mesa
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:vendor/etc/permissions/android.hardware.opengles.aep.xml

# GLES version
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196610



##############################################################
# Source: device/intel/project-celadon/mixins/groups/storage/sdcard-mmc0-usb-sd/product.mk
##############################################################

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += support.sdcardfs.mode=y
##############################################################
# Source: device/intel/project-celadon/mixins/groups/ethernet/dhcp/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.ethernet.xml:vendor/etc/permissions/android.hardware.ethernet.xml
##############################################################
# Source: device/intel/project-celadon/mixins/groups/rfkill/true/product.mk
##############################################################
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/rfkill/rfkill-init.sh:vendor/bin/rfkill-init.sh
##############################################################
# Source: device/intel/project-celadon/mixins/groups/codecs/configurable/product.mk
##############################################################
# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:vendor/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_profiles.xml:vendor/etc/media_profiles.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs.xml:vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/extra_files/codecs/mfx_omxil_core.conf:vendor/etc/mfx_omxil_core.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance_bxt.xml:vendor/etc/media_codecs_performance.xml

PRODUCT_PACKAGES += \
    libasfextractor
##############################################################
# Source: device/intel/project-celadon/mixins/groups/usb/host/product.mk
##############################################################
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:vendor/etc/permissions/android.hardware.usb.host.xml

##############################################################
# Source: device/intel/project-celadon/mixins/groups/usb-gadget/configfs/product.mk
##############################################################
# Set default USB interface
USB_CONFIG := mtp

ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable Secure Debugging
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1

ifeq ($(USB_CONFIG), adb)
USB_CONFIG := mtp
endif

ifeq ($(BUILD_FOR_CTS_AUTOMATION),true)
# Build for automated CTS
ifneq ($(USB_CONFIG), adb)
USB_CONFIG := $(USB_CONFIG),adb
endif
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/usb-gadget/adb_keys:root/adb_keys
endif #BUILD_FOR_CTS_AUTOMATION == true
endif #TARGET_BUILD_VARIANT == user
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=$(USB_CONFIG)

# Add Intel adb keys for userdebug/eng builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/usb-gadget/adb_keys:root/adb_keys
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/usb-otg-switch/true/product.mk
##############################################################

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/usb-otg-switch/usb_otg_switch.sh:vendor/bin/usb_otg_switch.sh
##############################################################
# Source: device/intel/project-celadon/mixins/groups/midi/true/product.mk
##############################################################
# MIDI support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:vendor/etc/permissions/android.software.midi.xml
##############################################################
# Source: device/intel/project-celadon/mixins/groups/touch/galax7200/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:vendor/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml\
        $(INTEL_PATH_COMMON)/touch/Vendor_0eef_Product_7200.idc:system/usr/idc/Vendor_0eef_Product_7200.idc
##############################################################
# Source: device/intel/project-celadon/mixins/groups/device-type/car/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/car_core_hardware.xml:vendor/etc/permissions/car_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:vendor/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:vendor/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:vendor/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.broadcastradio.xml:vendor/etc/permissions/android.hardware.broadcastradio.xml \
    frameworks/native/data/etc/android.software.activities_on_secondary_displays.xml:vendor/etc/permissions/android.software.activities_on_secondary_displays.xml

# Make sure vendor car product overlays take precedence than google definition
# under packages/services/Car/car_product/overlay/
PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/device-type/overlay-car
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

PRODUCT_PACKAGES += \
    radio.fm.default \
    CarSettings \
    VmsPublisherClientSample \
    VmsSubscriberClientSample \

PRODUCT_PACKAGES += android.hardware.automotive.vehicle.intel@2.0-service \
    android.hardware.automotive.audiocontrol@1.0-service.intel

VEHICLE_HAL_PROTO_TYPE := google-emulator
##############################################################
# Source: device/intel/project-celadon/mixins/groups/gms/true/product.mk
##############################################################
FLAG_GMS_AVAILABLE ?= true
ifeq ($(FLAG_GMS_AVAILABLE),true)
$(call inherit-product-if-exists, vendor/google/gas/products/gas.mk)
FLAG_GAS_AVAILABLE := true
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-tools/true/product.mk
##############################################################
PRODUCT_PACKAGES_DEBUG += \
    AndroidTerm \
    libjackpal-androidterm4 \
    peeknpoke \
    pytimechart-record \
    lspci \
    llvm-symbolizer
##############################################################
# Source: device/intel/project-celadon/mixins/groups/fota/true/product.mk
##############################################################
# Enable FOTA for non user builds
PRODUCT_PACKAGES_DEBUG += AFotaApp

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.fota.ota_stream=disabled

AFOTAAPP_EULA_PATH := 
AFOTAAPP_LOG_LEVEL := DEBUG
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/fota
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-logs/true/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
MIXIN_DEBUG_LOGS := true
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/debug-logs/init.logs.rc:root/init.logs.rc
PRODUCT_PACKAGES += \
    elogs.sh \
    start_log_srv.sh \
    logcat_ep.sh
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.service.default_logfs=apklogfs
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.intel.logger=/system/bin/logcat
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += logd.kernel.raw_message=False
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.intel.logger.rot_cnt=20
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.intel.logger.rot_size=5000
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/debug-logs
BOARD_SEPOLICY_M4DEFS += module_debug_logs=true
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-npk/true/product.mk
##############################################################
# There is a strong dependency on debug-logs; disable debug-npk if not set
ifeq ($(MIXIN_DEBUG_LOGS),true)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/debug-npk/init.npk.rc:root/init.npk.rc \
    $(LOCAL_PATH)/extra_files/debug-npk/npk_bxt.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/npk.cfg
PRODUCT_PACKAGES += \
    npk_init \
    logd2sven

endif #MIXIN_DEBUG_LOGS

# There is a strong dependency on debug-logs; disable debug-npk if not set
ifeq ($(MIXIN_DEBUG_LOGS),true)

# Enable redirection of android logs to SVENTX
LOGCATEXT_USES_SVENTX := true
BOARD_SEPOLICY_DIRS += \
    $(INTEL_PATH_SEPOLICY)/debug-npk

ifeq ($(PSTORE_CONFIG),PRAM)

# Default configuration for dumps to pstore
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.npk.cfg=none

# Increase pstore dump size to fit MSC buffers
BOARD_KERNEL_CMDLINE += \
    intel_pstore_pram.record_size=524288 \
    pstore.extra_size=524288

endif # PSTORE_CONFIG == PRAM

endif #MIXIN_DEBUG_LOGS
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-crashlogd/true/product.mk
##############################################################
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/extra_files/debug-crashlogd/init.crashlogd.rc:root/init.crashlogd.rc \
	$(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/extra_files/debug-crashlogd/ingredients.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ingredients.conf) \
	$(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/extra_files/debug-crashlogd/crashlog.conf:$(TARGET_COPY_OUT_VENDOR)/etc/crashlog.conf)
PRODUCT_PACKAGES += crashlogd \
	dumpstate_dropbox.sh
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.crashlogd.data_quota=50

CRASHLOGD_LOGS_PATH := "/data/logs"
CRASHLOGD_APLOG := true
CRASHLOGD_FULL_REPORT := true
CRASHLOGD_MODULE_MODEM ?= true
CRASHLOGD_MODULE_BINDER := true
CRASHLOGD_USE_SD := false
CRASHLOGD_SSRAM_CRASHLOG := broxton
CRASHLOGD_RAMDUMP := broxton
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-coredump/true/product.mk
##############################################################
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/debug-coredump/init.coredump.rc:root/init.coredump.rc
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/coredump
# Enable core dump for eng builds
ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.core.enabled=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.core.enabled=0
endif
CRASHLOGD_COREDUMP := true
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-phonedoctor/true/product.mk
##############################################################
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_PACKAGES += crash_package
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/lights/true/product.mk
##############################################################
# Lights HAL
BOARD_SEPOLICY_DIRS += \
    $(INTEL_PATH_SEPOLICY)/light

PRODUCT_PACKAGES += lights.$(TARGET_BOARD_PLATFORM) \
    android.hardware.light@2.0-service \
    android.hardware.light@2.0-impl

##############################################################
# Source: device/intel/project-celadon/mixins/groups/power/true/product.mk
##############################################################
# Power HAL
PRODUCT_PACKAGES += power.$(TARGET_BOARD_PLATFORM) \
                    android.hardware.power@1.2-service \
                    android.hardware.power@1.2-impl \
                    power_hal_helper

##############################################################
# Source: device/intel/project-celadon/mixins/groups/mediaserver-radio/true/product.mk
##############################################################
PRODUCT_PACKAGES += mediaserver-radio
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-usb-config/true/product.mk
##############################################################
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.debug.dvc.protocol=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.debug.dvc.source_dev=dvcith-0-msc0
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-dvc_desc/npk/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += dvc_desc
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/extra_files/debug-dvc_desc/init.dvc_desc.rc:root/init.dvc_desc.rc \
        $(LOCAL_PATH)/extra_files/debug-dvc_desc/dvc_descriptors.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/dvc_descriptors.cfg
endif

##############################################################
# Source: device/intel/project-celadon/mixins/groups/intel_prop/true/product.mk
##############################################################
PRODUCT_PACKAGES += intel_prop

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/intel_prop/intel_prop.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/intel_prop.cfg
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-lct/true/product.mk
##############################################################
PRODUCT_PACKAGES += lctclient
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-log-watch/true/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(MIXIN_DEBUG_LOGS),true)
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/extra_files/debug-log-watch/log-watch-kmsg.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/log-watch-kmsg.cfg \
        $(LOCAL_PATH)/extra_files/debug-log-watch/init.log-watch.rc:root/init.log-watch.rc

    PRODUCT_PACKAGES += log-watch
endif
endif

##############################################################
# Source: device/intel/project-celadon/mixins/groups/eavb/true/product.mk
##############################################################
PRODUCT_PACKAGES_DEBUG += \
    audio_system_setparameters \
    open_avb_shm_test \
    avb_alsa_test \
    avb_common_test \
    avb_configuration_test \
    avb_control_test \
    avb_control_test_static \
    avb_stream_handler_test \
    audio_IasAudioStream_test \
    audio_alsahandler_unit_test \
    audio_buffertask_test \
    audio_filter_test \
    audio_filterx_test \
    audio_model_test \
    audio_pipeline_test \
    audio_plugin_use_cases_test \
    audio_plugins_unit_test \
    audio_ramp_test \
    audio_routingzone_test \
    audio_rtprocessingfwIntegration_test \
    audio_smartx_dummyConnections_test \
    audio_smartxapi_test \
    audio_switchmatrix_test \
    audio_switchmatrixjob_test \
    audio_testVolumeLoudnessCore_test \
    audio_testVolumeLoudnessSDV_test \
    audio_volumeTest_test \
    audio_year_2038_test

PRODUCT_PACKAGES += \
    daemon_cl \
    avb_streamhandler_app \
    avb_streamhandler_client_app \
    pluginias-media_transport-avb_configuration_gp_mrb \
    libias-audio-smartx \
    libias-audio-modules \
    libsmartx-subsystem \
    libavbcontrol-subsystem \
    alsa_aplay \
    alsa_arecord \
    alsa_ctl \
    alsa_amixer \
    alsa_loop \
    asound.conf \

AUDIOSERVER_MULTILIB := 64

# for AVB and GPTP services
PRODUCT_PROPERTY_OVERRIDES += persist.eavb.mode=m

# for gPTP service in automotive profile or not
PRODUCT_PROPERTY_OVERRIDES += persist.gptp.automotive_profile=y

# for AVB service in D6 mode or not
PRODUCT_PROPERTY_OVERRIDES += persist.d6.mode=n

# SmartX module Properties
smxelements := CFG SMX EVT RZN AHD MDL SXC SHM SMW RB DP DBG TST SMJ

PRODUCT_PROPERTY_OVERRIDES += \
    $(foreach item, $(smxelements), persist.media.smartx.$(item)log=3)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.audioConf=AudioParameterFramework-tdf8532-eavb-master.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.avb.target.name=GrMrb \
    persist.avb.profile.name=MRB_Master_Audio \
    persist.avb.audio.rx.srclass=low \
    persist.avb.video.rx.srclass=low \
    persist.avb.ifname=eth0 \
    persist.avb.pcibus=2 \
    persist.avb.ptp.pdelaycount=0 \
    persist.avb.ptp.synccount=0 \
    persist.avb.ptp.loopcount=0 \
    persist.avb.tx.window.width=6000000 \
    persist.avb.tx.window.pitch=4000000 \
    persist.avb.lalsa.baseperiod=384 \
    persist.avb.lalsa.ringbuffer=12288 \
    persist.avb.ptime.offset.low=2100000 \
    persist.avb.ptime.offset.high=2100000 \
    persist.avb.audio.tstamp.buffer=1 \
    persist.avb.compatibility.audio="" \
    persist.avb.alsa.groupname=audio \
    persist.avb.alsa.smartx.switch=0 \
    persist.avb.igb.to.cnt=5 \
    persist.avb.android.boottime=0 \
    persist.avb.clock.raw=n

# AVB Properties
avbelements := _AMN _ASH _ENV _DMY _RXE _TXE _TX1 _TX2 _AAS _ACS _AVS _LAB _LVB _AJI _AEN _PTP _SCD _HCD _RCD _PCD _MCD _ACC _COC _AUI _SHM

PRODUCT_PROPERTY_OVERRIDES += \
    $(foreach item,$(avbelements),persist.avb.debug.loglevel.$(item)=4)

PRODUCT_PROPERTY_OVERRIDES += \
    init.svc.earlyavbaudio=uninitialized
##############################################################
# Source: device/intel/project-celadon/mixins/groups/memtrack/true/product.mk
##############################################################
# memtrack HAL
PRODUCT_PACKAGES += \
        memtrack.$(TARGET_BOARD_PLATFORM) \
	android.hardware.memtrack@1.0-service \
	android.hardware.memtrack@1.0-impl
##############################################################
# Source: device/intel/project-celadon/mixins/groups/platformxml/true/product.mk
##############################################################
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/platformxml/platform.xml:vendor/etc/permissions/platform.xml
##############################################################
# Source: device/intel/project-celadon/mixins/groups/dbga/true/product.mk
##############################################################
PRODUCT_PACKAGES_DEBUG += \
    DBGA_Main \
    fdk-modules-structure

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES_DEBUG += \
    DBGA_cAVSUnitTest
endif

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES_DEBUG += \
    DBGA_FunctionalTests \
    functionalTestsDatafiles
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/audio/gordon_peak_acrn/product.mk
##############################################################
# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
    tinymix \
    tinyplay \
    tinycap \
    tinypcminfo \
    tinyprobe

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/libfwdt/reef-apl.ri:vendor/firmware/intel/reef-apl.ri \
    $(LOCAL_PATH)/audio/libfwdt/reef-apl.tplg:vendor/firmware/intel/reef-apl.tplg
##############################################################
# Source: device/intel/project-celadon/mixins/groups/hdcpd/true/product.mk
##############################################################
# Enable media content protection services

# HDCP Daemon
PRODUCT_PACKAGES += hdcpd
##############################################################
# Source: device/intel/project-celadon/mixins/groups/bluetooth/default/product.mk
##############################################################
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_bluetooth=true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/thermal/default/product.mk
##############################################################
# Default
# Thermal Hal
PRODUCT_PACKAGES += thermal.default \
                    android.hardware.thermal@1.0-service \
                    android.hardware.thermal@1.0-impl
##############################################################
# Source: device/intel/project-celadon/mixins/groups/trusty/true/product.mk
##############################################################
##############################################################
# Source: device/intel/project-celadon/mixins/groups/art-config/default/product.mk
##############################################################
# This is needed to enable silver art optimizer.
VENDOR_ART_PATH ?= $(INTEL_PATH_VENDOR)/art-extension

PRODUCT_PACKAGES_TESTS += \
    art-run-tests \
    libarttest \
    libnativebridgetest \
    libart-gtest
##############################################################
# Source: device/intel/project-celadon/mixins/groups/aosp_carrier-config/default/product.mk
##############################################################
EXT_IMS_PACKAGES_SRC_FILES_PATH ?= $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/carrier/imsstub/packages/apps/Settings/src
INTEL_FEATURE_TELEPHONYPROVIDER ?= $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/carrier/custom_TelephonyProvider/packages/providers/TelephonyProvider
INTEL_FEATURE_CONTACTS ?= $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/carrier/EnhancedContacts/src
INTEL_FEATURE_CONTACTSCOMMON ?= $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/carrier/EnhancedContactsCommon/src
INTEL_FEATURE_CONTACTSPROVIDER ?= $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/carrier/EnhancedContactsProvider/src
INTEL_FEATURE_ENHANCEDDIALER ?= $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/carrier/EnhancedDialer/src
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-kernel/default/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/debug-kernel/init.kernel.rc:root/init.kernel.rc
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-unresponsive/default/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += sys.dropbox.max_size_kb=4096

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += sys.dump.binder_stats.uiwdt=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += sys.dump.binder_stats.anr=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += sys.dump.peer_depth=3

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += sys.dump.stacks_timeout=1500

endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/telephony/default/product.mk
##############################################################
# product.mk common to Telephony disabled platforms
PRODUCT_COPY_FILES += \
    $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/all/apns-conf.xml:system/etc/old-apns-conf.xml

# Inherit from common Open Source Telephony product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_VENDOR)/featsetclass_tel/telephony/overlay_none
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/filesystem_config/default/product.mk
##############################################################
PRODUCT_PACKAGES += \
	fs_config_files \
	fs_config_dirs

##############################################################
# Source: device/intel/project-celadon/mixins/groups/jack/default/product.mk
##############################################################
ANDROID_COMPILE_WITH_JACK := false
##############################################################
# Source: device/intel/project-celadon/mixins/groups/load_modules/default/product.mk
##############################################################
PRODUCT_PACKAGES += load_modules.sh
##############################################################
# Source: device/intel/project-celadon/mixins/groups/widevine/default/product.mk
##############################################################
#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

#only enable default drm service
PRODUCT_PACKAGES += android.hardware.drm@1.0-service \
                    android.hardware.drm@1.0-impl \
                    android.hardware.drm@1.1-service.clearkey

# ------------------ END MIX-IN DEFINITIONS ------------------
