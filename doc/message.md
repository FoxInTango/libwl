https://wayland.arktoria.org/2-protocol-design/interfaces-reqs-events.html
Requests 请求
Surface 是可以在屏幕上显示的像素区域， 是我们构建应用程序窗口之类的东西的基本元素之一。 它有个请求名为“damage”（损坏），客户端发送这个请求表示某个 surface 的某些部分发生了变化，需要重绘。 下面是 wire 中的一个 damage 消息的带注释示例（16 进制）：

0000000A    对象 ID (10)
00180002    消息长度 (24) 和请求操作码 (2)
00000000    X 坐标       (int): 0
00000000    Y 坐标       (int): 0
00000100    宽度         (int): 256
00000100    高度         (int): 256

这是 session 会话的小片段：surface 已经提前分配，它的 ID 为 10。 当服务端收到这条消息后，服务端会查找 ID 为 10 的对象，发现它是一个 wl_surface 实例。 基于此，服务端用请求的 opcode 操作码 2 查找请求的签名。 然后就知道了接下来有四个整型作为参数，这样服务器就能解码这条消息，分派到内部处理。

Events 事件
请求是从客户端发送到服务端，反之，服务端也可以给客户端广播消息，叫做“事件”。 例如，其中一个事件是 wl_surface 的 enter 事件，在 surface 被显示到指定的 output 时，服务端将发送该事件 （客户端可能会响应这一事件，比如为 HiDPI 高分屏调整缩放的比例因数）。 这样一条消息的示例如下：

0000000A    对象 ID (10)
000C0000    消息长度 (12) 和事件操作码 (0)
00000005    Output (object ID): 5

这条消息通过 ID 引用了另一对象：wl_output，surface 就是在这对象上显示。 客户端收到该消息后，行为与服务端类似：查找 ID 为 10 的对象、将其与 wl_surface 接口关联、查找操作码 0 对应事件的签名。 它相应地解码其余信息（查找 ID 为 5 的 wl_output），然后分派内部处理。

[sparrow@VMH-ALL-IN-ONE wayland-protocols]$ vim build/tests/xdg-shell-code.c
[sparrow@VMH-ALL-IN-ONE wayland-protocols]$ vim build/tests/xdg-shell-client.h
xdg_wm_base_get_xdg_surface & xdg_wm_base_pong:

    wl_proxy_marshal_array_flags  - 
        ...
        wl_closure_send - connection.c

trace : wl_connection_read
