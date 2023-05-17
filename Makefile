export TARGET = iphone:latest:14.0
export ARCHS = arm64 arm64e

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Reveal3Loader

Reveal3Loader_FILES = Tweak.xm
Reveal3Loader_CFLAGS = -fobjc-arc
Reveal3Loader_EXTRA_FRAMEWORKS = AltList

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
