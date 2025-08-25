# https://zhuanlan.zhihu.com/p/671331282 
# wayland-scanner private-code /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > xdg-shell-protocol.c
# wayland-scanner client-header  /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > xdg-shell-client-protocol.h
# cc -o client client.c xdg-shell-protocol.c -lwayland-client -lrt

https://zhuanlan.zhihu.com/p/642922339

wayland:
	wayland-scanner private-code   /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml src/xdg-shell-protocol.c
	wayland-scanner client-header  /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml src/xdg-shell-client-protocol.h
