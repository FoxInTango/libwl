DEPEND_TARGETS += libevent.recursive
ECHO_TARGETS += libevent.echo
libevent.recursive:
	@echo SUPER_MAKE_DIR=/home/lidali/alpine/libraries/libwl/               >> /home/lidali/alpine/libraries/libevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/home/lidali/alpine/libraries/libwl/.make >> /home/lidali/alpine/libraries/libevent/.make/super
	cd /home/lidali/alpine/libraries/libevent/ && make recursive && make install
	-rm /home/lidali/alpine/libraries/libevent/.make/super
libevent.echo:
	@echo SUPER_MAKE_DIR=/home/lidali/alpine/libraries/libwl/               >> /home/lidali/alpine/libraries/libevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/home/lidali/alpine/libraries/libwl/.make >> /home/lidali/alpine/libraries/libevent/.make/super
	cd /home/lidali/alpine/libraries/libevent/ && make echo
	-rm /home/lidali/alpine/libraries/libevent/.make/super
