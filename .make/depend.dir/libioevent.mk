DEPEND_TARGETS += libioevent.recursive
ECHO_TARGETS += libioevent.echo
libioevent.recursive:
	@echo SUPER_MAKE_DIR=/home/lidali/alpine/libraries/libwl/               >> /home/lidali/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/home/lidali/alpine/libraries/libwl/.make >> /home/lidali/alpine/libraries/libioevent/.make/super
	cd /home/lidali/alpine/libraries/libioevent/ && make recursive && make install
	-rm /home/lidali/alpine/libraries/libioevent/.make/super
libioevent.echo:
	@echo SUPER_MAKE_DIR=/home/lidali/alpine/libraries/libwl/               >> /home/lidali/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/home/lidali/alpine/libraries/libwl/.make >> /home/lidali/alpine/libraries/libioevent/.make/super
	cd /home/lidali/alpine/libraries/libioevent/ && make echo
	-rm /home/lidali/alpine/libraries/libioevent/.make/super
