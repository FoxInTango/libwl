DEPEND_TARGETS += libfsevent.recursive
ECHO_TARGETS += libfsevent.echo
libfsevent.recursive:
	@echo SUPER_MAKE_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/               >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/.make >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/.make/super
	cd /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/ && make recursive && make install
	-rm /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/.make/super
libfsevent.echo:
	@echo SUPER_MAKE_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/               >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libwl/.make >> /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/.make/super
	cd /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/ && make echo
	-rm /mnt/d/CORE_WEB_SYSTEM_WEB/alpine/libraries/libfsevent/.make/super
