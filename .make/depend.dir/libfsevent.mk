DEPEND_TARGETS += libfsevent.recursive
ECHO_TARGETS += libfsevent.echo
libfsevent.recursive:
	@echo SUPER_MAKE_DIR=/home/lidali/alpine/libraries/libwl/               >> /home/lidali/alpine/libraries/libfsevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/home/lidali/alpine/libraries/libwl/.make >> /home/lidali/alpine/libraries/libfsevent/.make/super
	cd /home/lidali/alpine/libraries/libfsevent/ && make recursive && make install
	-rm /home/lidali/alpine/libraries/libfsevent/.make/super
libfsevent.echo:
	@echo SUPER_MAKE_DIR=/home/lidali/alpine/libraries/libwl/               >> /home/lidali/alpine/libraries/libfsevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/home/lidali/alpine/libraries/libwl/.make >> /home/lidali/alpine/libraries/libfsevent/.make/super
	cd /home/lidali/alpine/libraries/libfsevent/ && make echo
	-rm /home/lidali/alpine/libraries/libfsevent/.make/super
