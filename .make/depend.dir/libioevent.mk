DEPEND_TARGETS += libioevent.recursive
ECHO_TARGETS += libioevent.echo
libioevent.recursive:
	@echo SUPER_MAKE_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/               >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/.make >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/.make/super
	cd /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/ && make recursive && make install
	-rm /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/.make/super
libioevent.echo:
	@echo SUPER_MAKE_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/               >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/.make >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/.make/super
	cd /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/ && make echo
	-rm /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libioevent/.make/super
