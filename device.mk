#
# Copyright (C) 2011 The Android Open-Source Project
# Copyright (C) 2011 The CyanogenMod Project
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

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/bn/ovation

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# copy all kernel modules under the "modules" directory to system/lib/modules
#PRODUCT_COPY_FILES += $(shell \
#    find $(DEVICE_FOLDER)/modules -name '*.ko' \
#    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
#    | tr '\n' ' ')

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	$(DEVICE_FOLDER)/root/init.ovation.rc:root/init.ovation.rc \
	$(DEVICE_FOLDER)/root/init.ovation.usb.rc:root/init.ovation.usb.rc \
	$(DEVICE_FOLDER)/root/ueventd.ovation.rc:root/ueventd.ovation.rc \

# Audio
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
	$(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml

# Graphics
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/sgx/gralloc.omap4470.so:/system/vendor/lib/hw/gralloc.omap4.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libEGL_POWERVR_SGX544_112.so:/system/vendor/lib/egl/libEGL_POWERVR_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libGLESv1_CM_POWERVR_SGX544_112.so:/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libGLESv2_POWERVR_SGX544_112.so:/system/vendor/lib/egl/libGLESv2_POWERVR_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libglslcompiler_SGX544_112.so:/system/vendor/lib/libglslcompiler_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libIMGegl_SGX544_112.so:/system/vendor/lib/libIMGegl_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libpvr2d_SGX544_112.so:/system/vendor/lib/libpvr2d_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libpvrANDROID_WSEGL_SGX544_112.so:/system/vendor/lib/libpvrANDROID_WSEGL_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libPVRScopeServices_SGX544_112.so:/system/vendor/lib/libPVRScopeServices_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libsrv_init_SGX544_112.so:/system/vendor/lib/libsrv_init_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libsrv_um_SGX544_112.so:/system/vendor/lib/libsrv_um_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libusc_SGX544_112.so:/system/vendor/lib/libusc_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/pvrsrvctl_SGX544_112:/system/vendor/bin/pvrsrvctl_SGX544_112 \
    $(DEVICE_FOLDER)/prebuilt/sgx/pvrsrvinit:/system/vendor/bin/pvrsrvinit \
    $(DEVICE_FOLDER)/prebuilt/sgx/powervr.ini:/system/etc/powervr.ini

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/strace

# Art
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/poetry/poem.txt:root/sbin/poem.txt

# gfx. This needs http://git.omapzoom.org/?p=device/ti/proprietary-open.git;a=commit;h=47a8187f2d8a08f7210b3c964b3b8e50f3b0da66
#PRODUCT_PACKAGES += \
#	ti_omap4_sgx_libs \
#	ti_omap4_ducati_libs

# ducati
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/firmware/ducati-m3.bin:/system/vendor/firmware/ducati-m3.bin

# hdcp keys
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/firmware/hdcp.keys:/system/vendor/firmware/hdcp.keys

# Input
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/usr/idc/ft5x06-i2c.idc:system/usr/idc/ft5x06-i2c.idc \
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# fwram
#PRODUCT_COPY_FILES += \
#	$(DEVICE_FOLDER)/prebuilt/fwram.ko:/system/lib/modules/fwram.ko

# Vold
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/vold.ovation.fstab:system/etc/vold.fstab

# Media Profile
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Clears the boot counter
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/clear_bootcnt.sh:/system/bin/clear_bootcnt.sh

# update the battery log info
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/bin/log_battery_data.sh:/system/bin/log_battery_data.sh \
	$(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh

PRODUCT_PACKAGES += \
	hwprops \
	CMStats \
	uim-sysfs \
	sdcard \
	lights.ovation

# Place permission files
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Device specific packages
PRODUCT_PACKAGES += \
	liblights.ovation \
	power.ovation \
	sensors.ovation \
	fw-symlink

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# postrecoveryboot for recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Wifi
PRODUCT_PACKAGES += \
	ti_wfd_libs \
	lib_driver_cmd_wl12xx \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

#$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
# dont use omap4.mk. We have to drop camera.omap4 for now.
# Just include rest directly here.
PRODUCT_VENDOR_KERNEL_HEADERS := hardware/ti/omap4xxx/kernel-headers
PRODUCT_PACKAGES += \
	libdomx \
	libOMX_Core \
	libOMX.TI.DUCATI1.VIDEO.H264E \
	libOMX.TI.DUCATI1.VIDEO.MPEG4E \
	libOMX.TI.DUCATI1.VIDEO.DECODER \
	libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
	libOMX.TI.DUCATI1.VIDEO.CAMERA \
	libOMX.TI.DUCATI1.MISC.SAMPLE \
	libdrmdecrypt \
	libstagefrighthw \
        libI420colorconvert \
	libtiutils \
	libcamera \
	libion \
	libomxcameraadapter \
	smc_pa_ctrl \
	tf_daemon \
	libtf_crypto_sst \
	hwcomposer.omap4 \

PRODUCT_PACKAGES += \
	libjni_pinyinime \
	iontest \
	libedid \
	hwcomposer.default \
	smc_pa_ctrl \
	tf_daemon\
	libaudioutils \
	Music \
	tinyplay \
	tinymix \
	tinycap \
	sh \
	libwvm \
	audio.primary.ovation \
	audio.a2dp.default \
	audio_policy.default 

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=240 \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=45 \
	com.ti.omap_enhancement=true \
	omap.enhancement=true \
	ro.crypto.state=unencrypted \
	persist.sys.root_access=3

# TI-Connectivity
PRODUCT_COPY_FILES += \
        $(DEVICE_FOLDER)/firmware/TIInit_7.6.15.bts:system/etc/firmware/TIInit_7.6.15.bts \
	$(DEVICE_FOLDER)/firmware/wl1271-fw-multirole-plt.bin:system/etc/firmware/ti-connectivity/wl1271-fw-multirole-plt.bin \
	$(DEVICE_FOLDER)/firmware/wl1271-fw-multirole-roc.bin:system/etc/firmware/ti-connectivity/wl1271-fw-multirole-roc.bin \
	$(DEVICE_FOLDER)/firmware/wl127x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin \
	$(DEVICE_FOLDER)/firmware/wl127x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin \
	$(DEVICE_FOLDER)/firmware/wl127x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin \
	$(DEVICE_FOLDER)/firmware/wl127x-fw-mr.bin.r4:system/etc/firmware/ti-connectivity/wl127x-fw-mr.bin.r4 \
	$(DEVICE_FOLDER)/firmware/wl127x-fw-mr.bin.r5:system/etc/firmware/ti-connectivity/wl127x-fw-mr.bin.r5 \
	$(DEVICE_FOLDER)/firmware/wl127x-fw-mr_plt.bin.r4:system/etc/firmware/ti-connectivity/wl127x-fw-mr_plt.bin.r4 \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl128x-fw-4-mr.bin \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl128x-fw-4-plt.bin \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl128x-fw-4-sr.bin \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-mr.bin.r4:system/etc/firmware/ti-connectivity/wl128x-fw-mr.bin.r4 \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-mr.bin.r5:system/etc/firmware/ti-connectivity/wl128x-fw-mr.bin.r5 \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-mr_plt.bin.r4:system/etc/firmware/ti-connectivity/wl128x-fw-mr_plt.bin.r4 \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-mr_plt.bin.r5:system/etc/firmware/ti-connectivity/wl128x-fw-mr_plt.bin.r5 \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-multirole-plt.bin:system/etc/firmware/ti-connectivity/wl128x-fw-multirole-plt.bin \
	$(DEVICE_FOLDER)/firmware/wl128x-fw-multirole-roc.bin:system/etc/firmware/ti-connectivity/wl128x-fw-multirole-roc.bin \
        $(DEVICE_FOLDER)/firmware/ini_files/RFMD_D_E5.ini:system/etc/firmware/ti-connectivity/ini_files/RFMD_D_E5.ini \
        $(DEVICE_FOLDER)/firmware/ini_files/RFMD_S_3.5.ini:system/etc/firmware/ti-connectivity/ini_files/RFMD_S_3.5.ini \
        $(DEVICE_FOLDER)/firmware/ini_files/TQS_D_1.0.ini:system/etc/firmware/ti-connectivity/ini_files/TQS_D_1.0.ini \
        $(DEVICE_FOLDER)/firmware/ini_files/TQS_D_1.7.ini:system/etc/firmware/ti-connectivity/ini_files/TQS_D_1.7.ini \
        $(DEVICE_FOLDER)/firmware/ini_files/TQS_S_2.5.ini:system/etc/firmware/ti-connectivity/ini_files/TQS_S_2.5.ini \
        $(DEVICE_FOLDER)/firmware/ini_files/TQS_S_2.6.ini:system/etc/firmware/ti-connectivity/ini_files/TQS_S_2.6.ini \

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/bn/ovation/device-vendor.mk)
$(call inherit-product-if-exists, vendor/bn/ovation/device-vendor-blobs.mk)

#$(call inherit-product, $(DEVICE_FOLDER)/wl12xx/ti-wl12xx-vendor.mk)
#$(call inherit-product, $(DEVICE_FOLDER)/wl12xx/ti-wpan-products.mk)
