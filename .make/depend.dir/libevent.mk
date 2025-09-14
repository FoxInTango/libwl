DEPEND_TARGETS += libevent.recursive
ECHO_TARGETS += libevent.echo
libevent.recursive:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/libraries/libwl/               >> /volumes/llama/home/alpine/libraries/libevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/libraries/libwl/.make >> /volumes/llama/home/alpine/libraries/libevent/.make/super
	cd /volumes/llama/home/alpine/libraries/libevent/ && make recursive && make install
	-rm /volumes/llama/home/alpine/libraries/libevent/.make/super
libevent.echo:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/libraries/libwl/               >> /volumes/llama/home/alpine/libraries/libevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/libraries/libwl/.make >> /volumes/llama/home/alpine/libraries/libevent/.make/super
	cd /volumes/llama/home/alpine/libraries/libevent/ && make echo
	-rm /volumes/llama/home/alpine/libraries/libevent/.make/super
