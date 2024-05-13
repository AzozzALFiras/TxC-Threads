ARCHS = arm64 arm64e

MODULES = jailed

GO_EASY_ON_ME = 1
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ThreadsTxC
DISPLAY_NAME = ThreadsTxC


$(TWEAK_NAME)_IPA = /Users/azozzalfiras/Desktop/1TxC_App/Threads/Threads_295.1_3zozz.ipa
# $(TWEAK_NAME)_LOGOSFLAGS = -c generator=internal
$(TWEAK_NAME)_INSTALL_PATH = @executable_path
$(TWEAK_NAME)_USE_SUBSTRATE = false

$(TWEAK_NAME)_FILES = $(wildcard *.m TxCPreferences/*.m TxCLibrary/*.m Apps/*/*.xm interface/*.xm interface/*.m interface/*/*.m interface/*/*.xm interface/DownloadLibrary/*.m)
# -Wno-unsupported-availability-guard -Wno-unused-variable -Wno-unused-function -fobjc-arc -Wno-unguarded-availability-new
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-nullability-completeness
$(TWEAK_NAME)_LDFLAGS = -Wl,-segalign,4000
$(TWEAK_NAME)_FRAMEWORKS = CoreGraphics Security # أضف UIKit Foundation


PROFILE=com.burbn.barcelona
CODESIGN_IPA=0

include $(THEOS)/makefiles/tweak.mk
