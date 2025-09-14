DEPEND_TARGETS += libioevent.recursive
ECHO_TARGETS += libioevent.echo
libioevent.recursive:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/libraries/libwl/               >> /volumes/llama/home/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/libraries/libwl/.make >> /volumes/llama/home/alpine/libraries/libioevent/.make/super
	cd /volumes/llama/home/alpine/libraries/libioevent/ && make recursive && make install
	-rm /volumes/llama/home/alpine/libraries/libioevent/.make/super
libioevent.echo:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/libraries/libwl/               >> /volumes/llama/home/alpine/libraries/libioevent/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/libraries/libwl/.make >> /volumes/llama/home/alpine/libraries/libioevent/.make/super
	cd /volumes/llama/home/alpine/libraries/libioevent/ && make echo
	-rm /volumes/llama/home/alpine/libraries/libioevent/.make/super
