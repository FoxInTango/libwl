https://smithay.github.io/smithay////wayland_protocols/wp/linux_dmabuf/zv1/server/zwp_linux_dmabuf_v1/struct.ZwpLinuxDmabufV1.html
用于创建基于 DMABUF 的wl_buffers的工厂

此接口提供了创建基于 dmabuf 的通用wl_buffers的方法。

客户端可以使用get_surface_feedback请求来获取 dmabuf 反馈 对于特定表面。如果客户端想要检索反馈，则不要 绑定到图面时，他们可以使用get_default_feedback请求。

http://allinone.vm:8080/#/chat/conv-1756120978105
http://allinone.vm:8080/#/chat/conv-1756121895002