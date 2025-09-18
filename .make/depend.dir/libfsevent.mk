DEPEND_TARGETS += libfsevent.recursive
ECHO_TARGETS += libfsevent.echo
libfsevent.recursive:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/libraries/libwl/               >> /volumes/llama/home/alpine/libraries/libfsevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/libraries/libwl/.make >> /volumes/llama/home/alpine/libraries/libfsevent/.make/super
	cd /volumes/llama/home/alpine/libraries/libfsevent/ && make recursive && make install
	-rm /volumes/llama/home/alpine/libraries/libfsevent/.make/super
libfsevent.echo:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/libraries/libwl/               >> /volumes/llama/home/alpine/libraries/libfsevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/libraries/libwl/.make >> /volumes/llama/home/alpine/libraries/libfsevent/.make/super
	cd /volumes/llama/home/alpine/libraries/libfsevent/ && make echo
	-rm /volumes/llama/home/alpine/libraries/libfsevent/.make/super
