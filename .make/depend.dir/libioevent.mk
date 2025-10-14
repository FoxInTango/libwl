DEPEND_TARGETS += libioevent.recursive
ECHO_TARGETS += libioevent.echo
libioevent.recursive:
	@echo SUPER_MAKE_DIR=/Users/lidali/alpine/libraries/libwl/               >> /Users/lidali/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/Users/lidali/alpine/libraries/libwl/.make >> /Users/lidali/alpine/libraries/libioevent/.make/super
	cd /Users/lidali/alpine/libraries/libioevent/ && /Applications/Xcode.app/Contents/Developer/usr/bin/make recursive && /Applications/Xcode.app/Contents/Developer/usr/bin/make install
	-rm /Users/lidali/alpine/libraries/libioevent/.make/super
libioevent.echo:
	@echo SUPER_MAKE_DIR=/Users/lidali/alpine/libraries/libwl/               >> /Users/lidali/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/Users/lidali/alpine/libraries/libwl/.make >> /Users/lidali/alpine/libraries/libioevent/.make/super
	cd /Users/lidali/alpine/libraries/libioevent/ && /Applications/Xcode.app/Contents/Developer/usr/bin/make echo
	-rm /Users/lidali/alpine/libraries/libioevent/.make/super
