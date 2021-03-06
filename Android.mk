LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  main.c \
  perf_swevent.c

LOCAL_MODULE := break_setresuid

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES := \
  libmole_plough_plugins \
  libdiagexploit \
  libfb_mem_exploit \
  libkallsyms

LOCAL_LDFLAGS += -static
LOCAL_CFLAGS := -DMOLE_PLOUGH_PLUGIN_STATIC_LINK

TOP_SRCDIR := $(abspath $(LOCAL_PATH))
TARGET_C_INCLUDES +=              \
  $(TOP_SRCDIR)/kallsyms          \
  $(TOP_SRCDIR)/device_database

include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))
