# Copyright (C) 2022 Teracube-Inc
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable debug options for emerald product.
ifeq (eng,$(TARGET_BUILD_VARIANT))
  EMERALD_DEBUG := true
endif

# Inherit from emerald device
$(call inherit-product, $(LOCAL_PATH)/emerald.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BRAND := teracube
PRODUCT_DEVICE := emerald
PRODUCT_MANUFACTURER := teracube
PRODUCT_NAME := lineage_emerald
PRODUCT_MODEL := Teracube 2e

PRODUCT_GMS_CLIENTID_BASE := android-teracube
TARGET_VENDOR := teracube
TARGET_VENDOR_PRODUCT_NAME := emerald
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="full_yk673v6_lwg62_64-user 11 RP1A.200720.011 p1k61v164bspP16 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Teracube/emerald/emerald:11/RP1A.200720.011/202111011925:user/release-keys
