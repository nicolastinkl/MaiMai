THEOS_DEVICE_IP = 192.168.1.175
THEOS_DEVICE_PORT = 22
ARCHS = armv7 arm64
TARGET = iphone:latest:7.0

include theos/makefiles/common.mk

TWEAK_NAME = tkmaimai
tkmaimai_FILES = Tweak.xm
WeChatRedEnvelop_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	        install.exec "killall -9 NeiTui"

