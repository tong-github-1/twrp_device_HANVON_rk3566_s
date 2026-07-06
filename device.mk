#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
LOCAL_PATH := device/YUNLIANSHE/rk3566_s/

# API
PRODUCT_SHIPPING_API_LEVEL := 32

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Cpoy prebuilt stuffs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb.img:$(TARGET_COPY_OUT_RECOVERY)/dtb.img \
	$(LOCAL_PATH)/prebuilt/dtbo.img:$(TARGET_COPY_OUT_RECOVERY)/dtbo.img \
	$(LOCAL_PATH)/prebuilt/kernel:$(TARGET_COPY_OUT_RECOVERY)/kernel

PRODUCT_POST_PROCESS += device/YUNLIANSHE/rk3566_s/hooks/post_dtb_copy.sh
# 生成 dtb.img 以满足 recovery 依赖（相对路径，避开空变量）
out/target/product/rk3566_s/dtb.img: $(LOCAL_PATH)/prebuilt/dtb.img
	$(copy-file-to-target)

# 强制 recovery 依赖此 dtb.img
INSTALLED_DTBIMAGE_TARGET := out/target/product/rk3566_s/dtb.img
