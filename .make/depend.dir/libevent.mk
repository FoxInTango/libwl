DEPEND_TARGETS += libevent.recursive
ECHO_TARGETS += libevent.echo
libevent.recursive:
	@echo SUPER_MAKE_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/               >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/.make >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/.make/super
	cd /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/ && make recursive && make install
	-rm /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/.make/super
libevent.echo:
	@echo SUPER_MAKE_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/               >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/.make >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/.make/super
	cd /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/ && make echo
	-rm /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libevent/.make/super
