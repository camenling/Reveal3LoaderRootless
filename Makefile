export TARGET = iphone:16.5:14.5
export ARCHS = arm64 arm64e

THEOS_DEVICE_IP = localhost -o StrictHostKeyChecking=no
THEOS_DEVICE_PORT = 2222

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Reveal3Loader

Reveal3Loader_FILES = Tweak.xm
Reveal3Loader_CFLAGS = -fobjc-arc
Reveal3Loader_EXTRA_FRAMEWORKS = AltList

include $(THEOS_MAKE_PATH)/tweak.mk

before-package::
	ldid -Slayout/Library/Frameworks/RevealServer.framework/RevealServer

after-install::
	install.exec "killall -9 SpringBoard"
