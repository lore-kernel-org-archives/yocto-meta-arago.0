Return-Path: <x0038811@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4061E52995
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 09:19:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0259Gxge057222
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 03:16:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583399819;
	bh=5YybUH4X4rxwRBgDDSE7tgF5j2bfZ+EkrU1UkLvNQA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hXwBGSrDd63hbj6BYtlb0Gausf4eqzEqEN6gNdBkRT3hdzlQioMWTrpeK0nu+HLKm
	vTgF8f4lW9MrmYXNDL4/IYKEF6JR+4H+gDqzxAmK/oKMUpEbxRgxOROOE68vSeFWxW
	/wh5KYfrdeiTaOJXBepYQ+ZZa7kDk2ZKQAJ+j8aE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0259GxjQ043762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 03:16:59 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 03:16:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 03:16:59 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0259GsTn020206;
	Thu, 5 Mar 2020 03:16:58 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2020 14:46:48 +0530
Message-ID: <1583399809-26608-3-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583399809-26608-1-git-send-email-x0038811@ti.com>
References: <1583399809-26608-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master 2/3] gstreamer1.0*-bad: Update waylandsink patches
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 09:19:03 -0000
Content-Type: text/plain

New patches have been created on waylandsink.
Waylandsink on 1.16.1 needs following changes
* wl-drm support
* crop support
* scale support
* input device support

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...ylandsink-Add-mouse-drag-and-drop-support.patch |  426 ++++++++
 ...aylandsink-Add-drm-support-in-waylandsink.patch |  703 ++++++++++++++
 ...0005-waylandsink-Add-input-device-support.patch | 1022 ++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend       |   22 +-
 4 files changed, 2161 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
new file mode 100644
index 0000000..2dcb055
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
@@ -0,0 +1,426 @@
+From 2fbb4e711f2e413e20085cc771d3b3f77c5f6229 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Wed, 28 Mar 2018 13:01:06 +0530
+Subject: [PATCH] waylandsink: Add mouse drag and drop support
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ ext/wayland/wldisplay.c | 321 +++++++++++++++++++++++++++++++++++++++++++++++-
+ ext/wayland/wldisplay.h |   5 +
+ ext/wayland/wlwindow.c  |   3 +
+ 3 files changed, 328 insertions(+), 1 deletion(-)
+
+diff --git a/ext/wayland/wldisplay.c b/ext/wayland/wldisplay.c
+index 9400095..bdb4fee 100644
+--- a/ext/wayland/wldisplay.c
++++ b/ext/wayland/wldisplay.c
+@@ -22,18 +22,47 @@
+ #include <config.h>
+ #endif
+ 
++#include <stdlib.h>
++#include <stdio.h>
++
+ #include "wldisplay.h"
+ #include "wlbuffer.h"
++#include "wlwindow.h"
++
+ #include "wlvideoformat.h"
++#include <wayland-client-protocol.h>
+ 
++#include <unistd.h>
+ #include <errno.h>
++#include <linux/input.h>
+ 
+ GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
+ #define GST_CAT_DEFAULT gstwayland_debug
+ 
+ G_DEFINE_TYPE (GstWlDisplay, gst_wl_display, G_TYPE_OBJECT);
+ 
++struct touch_point
++{
++  int32_t id;
++  struct wl_list link;
++};
++
++struct input
++{
++  GstWlDisplay *display;
++  struct wl_seat *seat;
++  struct wl_pointer *pointer;
++  struct wl_touch *touch;
++  struct wl_list touch_point_list;
++  GstWlWindow *pointer_focus;
++  GstWlWindow *touch_focus;
++  struct wl_list link;
++  GstWlWindow *grab;
++};
++
+ static void gst_wl_display_finalize (GObject * gobject);
++static void input_grab (struct input *input, GstWlWindow *window);
++static void input_ungrab (struct input *input);
+ 
+ static void
+ gst_wl_display_class_init (GstWlDisplayClass * klass)
+@@ -51,6 +80,53 @@ gst_wl_display_init (GstWlDisplay * self)
+   self->buffers = g_hash_table_new (g_direct_hash, g_direct_equal);
+   g_mutex_init (&self->buffers_mutex);
+ }
++static void
++input_grab (struct input *input, GstWlWindow *window)
++{
++  input->grab = window;
++}
++
++static void
++input_ungrab (struct input *input)
++{
++  input->grab = NULL;
++}
++
++static void
++input_remove_pointer_focus (struct input *input)
++{
++  GstWlWindow *window = input->pointer_focus;
++
++  if (!window)
++    return;
++
++  input->pointer_focus = NULL;
++}
++
++static void
++input_destroy (struct input *input)
++{
++  input_remove_pointer_focus (input);
++
++  if (input->display->seat_version >= 3) {
++    if (input->pointer)
++      wl_pointer_release (input->pointer);
++  }
++
++  wl_list_remove (&input->link);
++  wl_seat_destroy (input->seat);
++  free (input);
++}
++
++static void
++display_destroy_inputs (GstWlDisplay *display)
++{
++  struct input *tmp;
++  struct input *input;
++
++  wl_list_for_each_safe (input, tmp, &display->input_list, link)
++      input_destroy (input);
++}
+ 
+ static void
+ gst_wl_display_finalize (GObject * gobject)
+@@ -130,6 +206,239 @@ shm_format (void *data, struct wl_shm *wl_shm, uint32_t format)
+ static const struct wl_shm_listener shm_listener = {
+   shm_format
+ };
++static void
++pointer_handle_enter (void *data, struct wl_pointer *pointer,
++    uint32_t serial, struct wl_surface *surface,
++    wl_fixed_t sx_w, wl_fixed_t sy_w)
++{
++  struct input *input = data;
++
++  if (!surface) {
++    /* enter event for a window we've just destroyed */
++    return;
++  }
++
++  input->display->serial = serial;
++  input->pointer_focus = wl_surface_get_user_data (surface);
++}
++
++static void
++pointer_handle_leave (void *data, struct wl_pointer *pointer,
++    uint32_t serial, struct wl_surface *surface)
++{
++  struct input *input = data;
++
++  input_remove_pointer_focus (input);
++}
++
++static void
++pointer_handle_motion (void *data, struct wl_pointer *pointer,
++    uint32_t time, wl_fixed_t sx_w, wl_fixed_t sy_w)
++{
++  struct input *input = data;
++  GstWlWindow *window = input->pointer_focus;
++
++  if (!window)
++    return;
++
++  if (input->grab)
++    wl_shell_surface_move (input->grab->wl_shell_surface, input->seat,
++        input->display->serial);
++
++}
++
++static void
++pointer_handle_button (void *data, struct wl_pointer *pointer, uint32_t serial,
++    uint32_t time, uint32_t button, uint32_t state_w)
++{
++  struct input *input = data;
++  enum wl_pointer_button_state state = state_w;
++  input->display->serial = serial;
++
++  if (button == BTN_LEFT) {
++    if (state == WL_POINTER_BUTTON_STATE_PRESSED)
++      input_grab (input, input->pointer_focus);
++
++    if (input->grab && state == WL_POINTER_BUTTON_STATE_RELEASED)
++      input_ungrab (input);
++  }
++
++  if (input->grab)
++    wl_shell_surface_move (input->grab->wl_shell_surface, input->seat,
++        input->display->serial);
++}
++
++static void
++pointer_handle_axis (void *data, struct wl_pointer *pointer,
++    uint32_t time, uint32_t axis, wl_fixed_t value)
++{
++}
++
++static void pointer_frame(void *data, struct wl_pointer *wl_pointer)
++{
++}
++
++static void pointer_axis_source(void *data, struct wl_pointer *wl_pointer, uint32_t axis_source)
++{
++}
++static void pointer_axis_stop(void *data, struct wl_pointer *wl_pointer, uint32_t time, uint32_t axis)
++{
++}
++
++static const struct wl_pointer_listener pointer_listener = {
++  pointer_handle_enter,
++  pointer_handle_leave,
++  pointer_handle_motion,
++  pointer_handle_button,
++  pointer_handle_axis,
++  pointer_frame,
++  pointer_axis_source,
++  pointer_axis_stop
++
++};
++
++static void
++touch_handle_down (void *data, struct wl_touch *wl_touch,
++    uint32_t serial, uint32_t time, struct wl_surface *surface,
++    int32_t id, wl_fixed_t x_w, wl_fixed_t y_w)
++{
++  struct input *input = data;
++  struct touch_point *tp;
++
++  input->display->serial = serial;
++  input->touch_focus = wl_surface_get_user_data (surface);
++  if (!input->touch_focus) {
++    return;
++  }
++
++  tp = malloc (sizeof *tp);
++  if (tp) {
++    tp->id = id;
++    wl_list_insert (&input->touch_point_list, &tp->link);
++    wl_shell_surface_move (input->touch_focus->wl_shell_surface, input->seat,
++        serial);
++  }
++}
++
++static void
++touch_handle_motion (void *data, struct wl_touch *wl_touch,
++    uint32_t time, int32_t id, wl_fixed_t x_w, wl_fixed_t y_w)
++{
++  struct input *input = data;
++  struct touch_point *tp;
++
++  if (!input->touch_focus) {
++    return;
++  }
++  wl_list_for_each (tp, &input->touch_point_list, link) {
++    if (tp->id != id)
++      continue;
++
++    wl_shell_surface_move (input->touch_focus->wl_shell_surface, input->seat,
++        input->display->serial);
++
++    return;
++  }
++}
++
++static void
++touch_handle_frame (void *data, struct wl_touch *wl_touch)
++{
++}
++
++static void
++touch_handle_cancel (void *data, struct wl_touch *wl_touch)
++{
++}
++
++static void
++touch_handle_up (void *data, struct wl_touch *wl_touch,
++    uint32_t serial, uint32_t time, int32_t id)
++{
++  struct input *input = data;
++  struct touch_point *tp, *tmp;
++
++  if (!input->touch_focus) {
++    return;
++  }
++
++  wl_list_for_each_safe (tp, tmp, &input->touch_point_list, link) {
++    if (tp->id != id)
++      continue;
++
++    wl_list_remove (&tp->link);
++    free (tp);
++
++    return;
++  }
++}
++
++static const struct wl_touch_listener touch_listener = {
++  touch_handle_down,
++  touch_handle_up,
++  touch_handle_motion,
++  touch_handle_frame,
++  touch_handle_cancel,
++};
++
++static void
++seat_handle_capabilities (void *data, struct wl_seat *seat,
++    enum wl_seat_capability caps)
++{
++  struct input *input = data;
++
++  if ((caps & WL_SEAT_CAPABILITY_POINTER) && !input->pointer) {
++    input->pointer = wl_seat_get_pointer (seat);
++    wl_pointer_set_user_data (input->pointer, input);
++    wl_pointer_add_listener (input->pointer, &pointer_listener, input);
++  } else if (!(caps & WL_SEAT_CAPABILITY_POINTER) && input->pointer) {
++    wl_pointer_destroy (input->pointer);
++    input->pointer = NULL;
++  }
++
++  if ((caps & WL_SEAT_CAPABILITY_TOUCH) && !input->touch) {
++    input->touch = wl_seat_get_touch (seat);
++    wl_touch_set_user_data (input->touch, input);
++    wl_touch_add_listener (input->touch, &touch_listener, input);
++  } else if (!(caps & WL_SEAT_CAPABILITY_TOUCH) && input->touch) {
++    wl_touch_destroy (input->touch);
++    input->touch = NULL;
++  }
++}
++
++static void
++seat_handle_name (void *data, struct wl_seat *seat, const char *name)
++{
++
++}
++
++static const struct wl_seat_listener seat_listener = {
++  seat_handle_capabilities,
++  seat_handle_name
++};
++
++static void
++display_add_input (GstWlDisplay *d, uint32_t id)
++{
++  struct input *input;
++
++  input = calloc (1, sizeof (*input));
++  if (input == NULL) {
++    fprintf (stderr, "%s: out of memory\n", "gst-wayland-sink");
++    exit (EXIT_FAILURE);
++  }
++  input->display = d;
++  input->seat = wl_registry_bind (d->registry, id, &wl_seat_interface,
++      MAX (d->seat_version, 3));
++  input->touch_focus = NULL;
++  input->pointer_focus = NULL;
++  wl_list_init (&input->touch_point_list);
++  wl_list_insert (d->input_list.prev, &input->link);
++
++  wl_seat_add_listener (input->seat, &seat_listener, input);
++  wl_seat_set_user_data (input->seat, input);
++
++}
+ 
+ static void
+ dmabuf_format (void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,
+@@ -224,6 +533,9 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   } else if (g_strcmp0 (interface, "wl_shm") == 0) {
+     self->shm = wl_registry_bind (registry, id, &wl_shm_interface, 1);
+     wl_shm_add_listener (self->shm, &shm_listener, self);
++  } else if (g_strcmp0 (interface, "wl_seat") == 0) {
++    self->seat_version = version;
++    display_add_input (self, id);
+   } else if (g_strcmp0 (interface, "wp_viewporter") == 0) {
+     self->viewporter =
+         wl_registry_bind (registry, id, &wp_viewporter_interface, 1);
+@@ -233,9 +545,15 @@ registry_handle_global (void *data, struct wl_registry *registry,
+     zwp_linux_dmabuf_v1_add_listener (self->dmabuf, &dmabuf_listener, self);
+   }
+ }
++static void
++registry_handle_global_remove(void *data, struct wl_registry *registry,
++                uint32_t name)
++{
++}
+ 
+ static const struct wl_registry_listener registry_listener = {
+-  registry_handle_global
++  registry_handle_global,
++  registry_handle_global_remove
+ };
+ 
+ static gpointer
+@@ -306,6 +624,7 @@ gst_wl_display_new_existing (struct wl_display * display,
+   self->display_wrapper = wl_proxy_create_wrapper (display);
+   self->own_display = take_ownership;
+ 
++  wl_list_init (&self->input_list);
+   self->queue = wl_display_create_queue (self->display);
+   wl_proxy_set_queue ((struct wl_proxy *) self->display_wrapper, self->queue);
+   self->registry = wl_display_get_registry (self->display_wrapper);
+diff --git a/ext/wayland/wldisplay.h b/ext/wayland/wldisplay.h
+index 4ecc0d6..b4339c0 100644
+--- a/ext/wayland/wldisplay.h
++++ b/ext/wayland/wldisplay.h
+@@ -71,6 +71,11 @@ struct _GstWlDisplay
+   GMutex buffers_mutex;
+   GHashTable *buffers;
+   gboolean shutting_down;
++
++  struct wl_list input_list;
++  int seat_version;
++  uint32_t serial;
++
+ };
+ 
+ struct _GstWlDisplayClass
+diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
+index 9ebbcaf..8dd5420 100644
+--- a/ext/wayland/wlwindow.c
++++ b/ext/wayland/wlwindow.c
+@@ -199,6 +199,9 @@ gst_wl_window_new_internal (GstWlDisplay * display, GMutex * render_lock)
+   window->area_surface = wl_compositor_create_surface (display->compositor);
+   window->video_surface = wl_compositor_create_surface (display->compositor);
+ 
++  wl_surface_set_user_data (window->area_surface, window);
++  wl_surface_set_user_data (window->video_surface, window);
++
+   window->area_surface_wrapper = wl_proxy_create_wrapper (window->area_surface);
+   window->video_surface_wrapper =
+       wl_proxy_create_wrapper (window->video_surface);
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
new file mode 100644
index 0000000..6a5e648
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
@@ -0,0 +1,703 @@
+From 0f7df5b0b7ec131d9d7af76005dbe3b78521b58f Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 20 Feb 2020 14:38:55 +0530
+Subject: [PATCH 4/5] waylandsink: Add drm support in waylandsink
+
+Waylandsink works out of shm memory. We have a DRM
+based memory allocator in place. Adding wl_drm support
+enables us to use DRM buffers without copy
+
+Following features are also added
+1) YUY2 and BGRA input format support
+2) Crop support
+3) Window resolution configuration support
+4) A property use-drm to command DRM buffer allocation
+   when propose_allocation is called
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ ext/wayland/Makefile.am      |  11 +++-
+ ext/wayland/gstwaylandsink.c |  89 +++++++++++++++++++++++++++++--
+ ext/wayland/gstwaylandsink.h |   2 +
+ ext/wayland/wldisplay.c      |  56 +++++++++++++++++++
+ ext/wayland/wldisplay.h      |   9 ++++
+ ext/wayland/wldrm.c          | 124 +++++++++++++++++++++++++++++++++++++++++++
+ ext/wayland/wldrm.h          |  21 ++++++++
+ ext/wayland/wlwindow.c       |  63 +++++++++++++++++++---
+ 8 files changed, 363 insertions(+), 12 deletions(-)
+ create mode 100644 ext/wayland/wldrm.c
+ create mode 100644 ext/wayland/wldrm.h
+
+diff --git a/ext/wayland/Makefile.am b/ext/wayland/Makefile.am
+index 95bb97e..a118033 100644
+--- a/ext/wayland/Makefile.am
++++ b/ext/wayland/Makefile.am
+@@ -8,12 +8,15 @@ BUILT_SOURCES = \
+ 	fullscreen-shell-unstable-v1-protocol.c \
+ 	fullscreen-shell-unstable-v1-client-protocol.h \
+ 	xdg-shell-protocol.c \
+-	xdg-shell-client-protocol.h
++	xdg-shell-client-protocol.h \
++	wayland-drm-protocol.c \
++	wayland-drm-client-protocol.h
+ 
+ libgstwaylandsink_la_SOURCES =  \
+ 	gstwaylandsink.c \
+ 	wlshmallocator.c \
+ 	wlbuffer.c \
++	wldrm.c \
+ 	wldisplay.c \
+ 	wlwindow.c \
+ 	wlvideoformat.c \
+@@ -23,18 +26,21 @@ nodist_libgstwaylandsink_la_SOURCES = \
+ 	viewporter-protocol.c \
+ 	linux-dmabuf-unstable-v1-protocol.c \
+ 	fullscreen-shell-unstable-v1-protocol.c \
+-	xdg-shell-protocol.c
++	xdg-shell-protocol.c \
++	wayland-drm-protocol.c
+ 
+ libgstwaylandsink_la_CFLAGS = \
+ 	$(GST_PLUGINS_BAD_CFLAGS) \
+ 	$(GST_PLUGINS_BASE_CFLAGS) \
+ 	$(GST_CFLAGS) \
++	$(DRM_CFLAGS) \
+ 	$(WAYLAND_CFLAGS)
+ libgstwaylandsink_la_LIBADD = \
+ 	$(top_builddir)/gst-libs/gst/wayland/libgstwayland-$(GST_API_VERSION).la \
+ 	$(GST_PLUGINS_BASE_LIBS) \
+ 	-lgstvideo-$(GST_API_VERSION) \
+ 	-lgstallocators-$(GST_API_VERSION) \
++	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la \
+ 	$(WAYLAND_LIBS)
+ libgstwaylandsink_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
+ 
+@@ -42,6 +48,7 @@ noinst_HEADERS = \
+ 	gstwaylandsink.h \
+ 	wlshmallocator.h \
+ 	wlbuffer.h \
++	wldrm.h \
+ 	wldisplay.h \
+ 	wlwindow.h \
+ 	wlvideoformat.h \
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 78dd294..9441232 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -46,6 +46,7 @@
+ #include "wlbuffer.h"
+ #include "wlshmallocator.h"
+ #include "wllinuxdmabuf.h"
++#include "wldrm.h"
+ 
+ #include <gst/wayland/wayland.h>
+ #include <gst/video/videooverlay.h>
+@@ -62,7 +63,9 @@ enum
+ {
+   PROP_0,
+   PROP_DISPLAY,
+-  PROP_FULLSCREEN
++  PROP_FULLSCREEN,
++  PROP_ALLOCATION,
++  PROP_SCALE
+ };
+ 
+ GST_DEBUG_CATEGORY (gstwayland_debug);
+@@ -208,6 +211,18 @@ gst_wayland_sink_class_init (GstWaylandSinkClass * klass)
+       g_param_spec_boolean ("fullscreen", "Fullscreen",
+           "Whether the surface should be made fullscreen ", FALSE,
+           G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
++  g_object_class_install_property (gobject_class, PROP_ALLOCATION,
++      g_param_spec_boolean ("use-drm", "Wayland Allocation name", "Wayland "
++          "Use DRM based memory for allocation",
++          FALSE, G_PARAM_WRITABLE));
++
++  g_object_class_install_property (gobject_class, PROP_SCALE,
++      g_param_spec_string ("window-resolution", "window resolution on display",
++          "resolution of video widthxheight ",
++          "NULL",
++          G_PARAM_WRITABLE | G_PARAM_STATIC_STRINGS));
++
+ }
+ 
+ static void
+@@ -215,6 +230,7 @@ gst_wayland_sink_init (GstWaylandSink * sink)
+ {
+   g_mutex_init (&sink->display_lock);
+   g_mutex_init (&sink->render_lock);
++  sink->scale_width = sink->scale_height = 0;
+ }
+ 
+ static void
+@@ -257,6 +273,7 @@ gst_wayland_sink_set_property (GObject * object,
+     guint prop_id, const GValue * value, GParamSpec * pspec)
+ {
+   GstWaylandSink *sink = GST_WAYLAND_SINK (object);
++  gchar *string = NULL, *end;
+ 
+   switch (prop_id) {
+     case PROP_DISPLAY:
+@@ -269,6 +286,24 @@ gst_wayland_sink_set_property (GObject * object,
+       gst_wayland_sink_set_fullscreen (sink, g_value_get_boolean (value));
+       GST_OBJECT_UNLOCK (sink);
+       break;
++    case PROP_ALLOCATION:
++      GST_OBJECT_LOCK (sink);
++      sink->use_drm = g_value_get_boolean (value);
++      GST_OBJECT_UNLOCK (sink);
++      break;
++    case PROP_SCALE:
++      GST_OBJECT_LOCK (sink);
++      string = g_value_dup_string (value);
++      sink->scale_width = g_ascii_strtoull (string, &end, 10);
++      if (*end != 'x')
++         sink->scale_width = 0 ;
++
++      sink->scale_height = g_ascii_strtoull (end+1, &end, 10);
++      if(string)
++          g_free(string);
++      GST_OBJECT_UNLOCK (sink);
++      break;
++
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -353,6 +388,9 @@ gst_wayland_sink_find_display (GstWaylandSink * sink)
+         /* if the application didn't set a display, let's create it ourselves */
+         GST_OBJECT_LOCK (sink);
+         sink->display = gst_wl_display_new (sink->display_name, &error);
++	sink->display->use_drm = sink->use_drm;
++        sink->display->scale_width = sink->scale_width;
++        sink->display->scale_height = sink->scale_height;
+         GST_OBJECT_UNLOCK (sink);
+ 
+         if (error) {
+@@ -529,7 +567,11 @@ gst_wayland_create_pool (GstWaylandSink * sink, GstCaps * caps)
+   structure = gst_buffer_pool_get_config (pool);
+   gst_buffer_pool_config_set_params (structure, caps, size, 2, 0);
+ 
+-  alloc = gst_wl_shm_allocator_get ();
++  if(sink->display->use_drm)
++	alloc = gst_drm_allocator_get ();
++  else
++	alloc = gst_wl_shm_allocator_get ();
++
+   gst_buffer_pool_config_set_allocator (structure, alloc, NULL);
+   if (!gst_buffer_pool_set_config (pool, structure)) {
+     g_object_unref (pool);
+@@ -540,16 +582,34 @@ gst_wayland_create_pool (GstWaylandSink * sink, GstCaps * caps)
+   return pool;
+ }
+ 
++static void
++wait_authentication (GstWaylandSink * sink)
++{
++  GST_DEBUG_OBJECT (sink, "Before wait aunthenticated value is %d : \n", sink->display->authenticated );
++  while (!sink->display->authenticated) {
++    GST_DEBUG_OBJECT (sink, "waiting for authentication");
++    wl_display_roundtrip (sink->display->display);
++  }
++  GST_DEBUG_OBJECT (sink, "After wait aunthenticated value is %d : \n", sink->display->authenticated );
++}
++
+ static gboolean
+ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+ {
+   GstWaylandSink *sink;
+   gboolean use_dmabuf;
++  gboolean use_drm = 0;
+   GstVideoFormat format;
++  GstStructure *s;
+ 
+   sink = GST_WAYLAND_SINK (bsink);
+ 
+   GST_DEBUG_OBJECT (sink, "set caps %" GST_PTR_FORMAT, caps);
++  wait_authentication (sink);
++
++  while (!sink->display->authenticated) {
++    GST_DEBUG_OBJECT (sink, "not authenticated yet");
++  }
+ 
+   /* extract info from caps */
+   if (!gst_video_info_from_caps (&sink->video_info, caps))
+@@ -558,6 +618,12 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+   format = GST_VIDEO_INFO_FORMAT (&sink->video_info);
+   sink->video_info_changed = TRUE;
+ 
++  s = gst_caps_get_structure (caps, 0);
++  gst_structure_get_boolean (s, "drm_mem", &use_drm);
++
++  if(use_drm)
++     sink->display->use_drm = TRUE;
++
+   /* create a new pool for the new caps */
+   if (sink->pool)
+     gst_object_unref (sink->pool);
+@@ -610,7 +676,12 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
+   if (pool)
+     g_object_unref (pool);
+ 
+-  alloc = gst_wl_shm_allocator_get ();
++
++  if(sink->display->use_drm)
++     alloc = gst_drm_allocator_get ();
++  else
++     alloc = gst_wl_shm_allocator_get ();
++
+   gst_query_add_allocation_param (query, alloc, NULL);
+   gst_query_add_allocation_meta (query, GST_VIDEO_META_API_TYPE, NULL);
+   g_object_unref (alloc);
+@@ -687,6 +758,10 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+ 
+   GST_LOG_OBJECT (sink, "render buffer %p", buffer);
+ 
++  if (sink->display) {
++     sink->display->crop = gst_buffer_get_video_crop_meta (buffer);
++  }
++
+   if (G_UNLIKELY (!sink->window)) {
+     /* ask for window handle. Unlock render_lock while doing that because
+      * set_window_handle & friends will lock it in this context */
+@@ -741,7 +816,13 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+       "display, creating it", buffer);
+ 
+   format = GST_VIDEO_INFO_FORMAT (&sink->video_info);
+-  if (gst_wl_display_check_format_for_dmabuf (sink->display, format)) {
++
++  if (gst_is_drm_memory (mem)) {
++     wbuf = gst_wl_drm_memory_construct_wl_buffer (mem, sink->display,
++         &sink->video_info);
++  }
++
++  if (!wbuf && gst_wl_display_check_format_for_dmabuf (sink->display, format)) {
+     guint i, nb_dmabuf = 0;
+ 
+     for (i = 0; i < gst_buffer_n_memory (buffer); i++)
+diff --git a/ext/wayland/gstwaylandsink.h b/ext/wayland/gstwaylandsink.h
+index be92fe7..f6d010e 100644
+--- a/ext/wayland/gstwaylandsink.h
++++ b/ext/wayland/gstwaylandsink.h
+@@ -64,6 +64,8 @@ struct _GstWaylandSink
+ 
+   gchar *display_name;
+ 
++  gboolean use_drm;
++  gint scale_width, scale_height;
+   gboolean redraw_pending;
+   GMutex render_lock;
+   GstBuffer *last_buffer;
+diff --git a/ext/wayland/wldisplay.c b/ext/wayland/wldisplay.c
+index 9400095..363e817 100644
+--- a/ext/wayland/wldisplay.c
++++ b/ext/wayland/wldisplay.c
+@@ -26,6 +26,10 @@
+ #include "wlbuffer.h"
+ #include "wlvideoformat.h"
+ 
++#include "wayland-drm-client-protocol.h"
++#include <fcntl.h>
++#include <xf86drm.h>
++#include <xf86drmMode.h>
+ #include <errno.h>
+ 
+ GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
+@@ -46,9 +50,12 @@ static void
+ gst_wl_display_init (GstWlDisplay * self)
+ {
+   self->shm_formats = g_array_new (FALSE, FALSE, sizeof (uint32_t));
++  self->drm_formats = g_array_new (FALSE, FALSE, sizeof (uint32_t));
+   self->dmabuf_formats = g_array_new (FALSE, FALSE, sizeof (uint32_t));
+   self->wl_fd_poll = gst_poll_new (TRUE);
+   self->buffers = g_hash_table_new (g_direct_hash, g_direct_equal);
++  self->fd = -1;
++  self->use_drm = FALSE;
+   g_mutex_init (&self->buffers_mutex);
+ }
+ 
+@@ -73,11 +80,15 @@ gst_wl_display_finalize (GObject * gobject)
+   g_hash_table_remove_all (self->buffers);
+ 
+   g_array_unref (self->shm_formats);
++  g_array_unref (self->drm_formats);
+   g_array_unref (self->dmabuf_formats);
+   gst_poll_free (self->wl_fd_poll);
+   g_hash_table_unref (self->buffers);
+   g_mutex_clear (&self->buffers_mutex);
+ 
++  if(self->fd != -1)
++	close(self->fd);
++
+   if (self->viewporter)
+     wp_viewporter_destroy (self->viewporter);
+ 
+@@ -87,6 +98,9 @@ gst_wl_display_finalize (GObject * gobject)
+   if (self->dmabuf)
+     zwp_linux_dmabuf_v1_destroy (self->dmabuf);
+ 
++  if (self->drm)
++    wl_drm_destroy (self->drm);
++
+   if (self->wl_shell)
+     wl_shell_destroy (self->wl_shell);
+ 
+@@ -200,6 +214,44 @@ static const struct xdg_wm_base_listener xdg_wm_base_listener = {
+   handle_xdg_wm_base_ping
+ };
+ 
++/* For wl_drm_listener */
++static void
++drm_handle_device (void *data, struct wl_drm *drm, const char *device)
++{
++  GstWlDisplay *d = data;
++  drm_magic_t magic;
++  d->fd = open (device, O_RDWR | O_CLOEXEC);
++  if (d->fd == -1) {
++    GST_ERROR ("could not open %s: %m", device);
++    return;
++  }
++  drmGetMagic (d->fd, &magic);
++  wl_drm_authenticate (d->drm, magic);
++}
++
++static void
++drm_handle_format (void *data, struct wl_drm *drm, uint32_t format)
++{
++  GstWlDisplay *self = data;
++  g_array_append_val (self->drm_formats, format);
++  GST_DEBUG ("got format: %" GST_FOURCC_FORMAT, GST_FOURCC_ARGS (format));
++}
++
++static void
++drm_handle_authenticated (void *data, struct wl_drm *drm)
++{
++  GstWlDisplay *d = data;
++  GST_DEBUG ("authenticated");
++  d->authenticated = 1;
++  GST_DEBUG ("drm_handle_authenticated: d->authenticated: %d\n",d->authenticated);
++}
++
++static const struct wl_drm_listener drm_listener = {
++  drm_handle_device,
++  drm_handle_format,
++  drm_handle_authenticated
++};
++
+ static void
+ registry_handle_global (void *data, struct wl_registry *registry,
+     uint32_t id, const char *interface, uint32_t version)
+@@ -224,6 +276,9 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   } else if (g_strcmp0 (interface, "wl_shm") == 0) {
+     self->shm = wl_registry_bind (registry, id, &wl_shm_interface, 1);
+     wl_shm_add_listener (self->shm, &shm_listener, self);
++  } else if (g_strcmp0 (interface, "wl_drm") == 0) {
++    self->drm = wl_registry_bind (registry, id, &wl_drm_interface, 1);
++    wl_drm_add_listener (self->drm, &drm_listener, self);
+   } else if (g_strcmp0 (interface, "wp_viewporter") == 0) {
+     self->viewporter =
+         wl_registry_bind (registry, id, &wp_viewporter_interface, 1);
+@@ -334,6 +389,7 @@ gst_wl_display_new_existing (struct wl_display * display,
+   VERIFY_INTERFACE_EXISTS (compositor, "wl_compositor");
+   VERIFY_INTERFACE_EXISTS (subcompositor, "wl_subcompositor");
+   VERIFY_INTERFACE_EXISTS (shm, "wl_shm");
++  VERIFY_INTERFACE_EXISTS (drm, "wl_drm");
+ 
+ #undef VERIFY_INTERFACE_EXISTS
+ 
+diff --git a/ext/wayland/wldisplay.h b/ext/wayland/wldisplay.h
+index 4ecc0d6..81e96bc 100644
+--- a/ext/wayland/wldisplay.h
++++ b/ext/wayland/wldisplay.h
+@@ -58,9 +58,11 @@ struct _GstWlDisplay
+   struct xdg_wm_base *xdg_wm_base;
+   struct zwp_fullscreen_shell_v1 *fullscreen_shell;
+   struct wl_shm *shm;
++  struct wl_drm *drm;
+   struct wp_viewporter *viewporter;
+   struct zwp_linux_dmabuf_v1 *dmabuf;
+   GArray *shm_formats;
++  GArray *drm_formats;
+   GArray *dmabuf_formats;
+ 
+   /* private */
+@@ -71,6 +73,13 @@ struct _GstWlDisplay
+   GMutex buffers_mutex;
+   GHashTable *buffers;
+   gboolean shutting_down;
++
++  int fd;
++  int authenticated;
++  gboolean use_drm;
++  gint scale_width, scale_height;
++  GstVideoCropMeta *crop;
++
+ };
+ 
+ struct _GstWlDisplayClass
+diff --git a/ext/wayland/wldrm.c b/ext/wayland/wldrm.c
+new file mode 100644
+index 0000000..0da9b73
+--- /dev/null
++++ b/ext/wayland/wldrm.c
+@@ -0,0 +1,124 @@
++#include "wldisplay.h"
++#include <gst/drm/gstdrmallocator.h>
++#include "wayland-drm-client-protocol.h"
++#include <wayland-client.h>
++
++GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
++#define GST_CAT_DEFAULT gstwayland_debug
++
++
++struct wl_buffer *
++gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
++    const GstVideoInfo * info)
++{
++  gint video_width = GST_VIDEO_INFO_WIDTH (info);
++  gint video_height = GST_VIDEO_INFO_HEIGHT (info);
++  GstVideoFormat format = GST_VIDEO_INFO_FORMAT (info);
++  int fd = -1;
++  struct wl_buffer *buffer;
++  uint32_t fourcc;
++  uint32_t bpp;
++  uint32_t name;
++  int singlePlane = 0;
++  int ret;
++  struct drm_prime_handle req1;
++  struct drm_gem_flink req2;
++  /* note: wayland and mesa use the terminology:
++   *    stride - rowstride in bytes
++   *    pitch  - rowstride in pixels
++   */
++  uint32_t strides[3] = {
++    GST_ROUND_UP_4 (video_width), 0, 0,
++  };
++  uint32_t offsets[3] = {
++    0, strides[0] * video_height, 0
++  };
++
++  if (format == GST_VIDEO_FORMAT_NV12)
++  {
++    /* NV12 */
++    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
++    strides[0] = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
++    strides[1] = GST_VIDEO_INFO_PLANE_STRIDE (info, 1);
++    offsets[0] = GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++    offsets[1] = GST_VIDEO_INFO_PLANE_OFFSET (info, 1);
++  }
++  else if(format == GST_VIDEO_FORMAT_I420)
++  {
++    /* YUV420 */
++    fourcc = GST_MAKE_FOURCC ('Y', 'U', '1', '2');
++    strides[0] = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
++    strides[1] = GST_VIDEO_INFO_PLANE_STRIDE (info, 1);
++    strides[2] = GST_VIDEO_INFO_PLANE_STRIDE (info, 2);
++    offsets[0] = GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++    offsets[1] = GST_VIDEO_INFO_PLANE_OFFSET (info, 1);
++    offsets[2] = GST_VIDEO_INFO_PLANE_OFFSET (info, 2);
++
++  }
++  else if(format == GST_VIDEO_FORMAT_BGRA)
++  {
++    singlePlane = 1;
++    bpp = 4;
++    fourcc = GST_MAKE_FOURCC ('A', 'R', '2', '4');
++  }
++  else if(format == GST_VIDEO_FORMAT_YUY2)
++  {
++    singlePlane = 1;
++    bpp = 2;
++    fourcc = GST_MAKE_FOURCC ('Y', 'U', 'Y', 'V');
++  }
++  else
++  {
++
++    GST_DEBUG ("Unsupported video format: %d", format);
++    /*
++     * There are two xRGB frames with width and height = 1 required in the begining of a video stream.
++     * If we consider them as errot, then it will case libwayland-clent.so crashes
++     * due to invalid error handling.
++     * Consider them as NV12 until we can figure out a better solution
++     */
++    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
++    strides[1] = GST_ROUND_UP_4 (video_width);
++  }
++
++  fd = gst_fd_memory_get_fd (mem);
++
++  if (fd < 0 ) {
++    GST_DEBUG ("Invalid fd");
++    return NULL;
++  }
++  req1.fd = fd,
++
++  ret = drmIoctl(display->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &req1);
++  if (ret) {
++    GST_DEBUG ("could not get handle, DRM_IOCTL_PRIME_FD_TO_HANDLE returned %d", ret);
++    return NULL;
++  }
++
++  req2.handle = req1.handle;
++
++  ret = drmIoctl(display->fd, DRM_IOCTL_GEM_FLINK, &req2);
++  if (ret) {
++    GST_DEBUG ("could not get name, DRM_IOCTL_GEM_FLINK returned %d", ret);
++    return NULL;
++  }
++
++  name = req2.name;
++  GST_LOG ("width = %d , height = %d , fourcc = %d ",  video_width, video_height, fourcc );
++
++  if(!singlePlane)
++     buffer = wl_drm_create_planar_buffer (display->drm, name,
++          video_width, video_height, fourcc,
++          offsets[0], strides[0],
++          offsets[1], strides[1],
++          offsets[2], strides[2]);
++  else
++     buffer = wl_drm_create_buffer(display->drm, name, video_width, video_height,
++			video_width * bpp, fourcc);
++
++  GST_DEBUG ("create planar buffer: %p (name=%d)",
++      buffer, name);
++
++  return buffer;
++}
++
+diff --git a/ext/wayland/wldrm.h b/ext/wayland/wldrm.h
+new file mode 100644
+index 0000000..c6b4ae1
+--- /dev/null
++++ b/ext/wayland/wldrm.h
+@@ -0,0 +1,21 @@
++/*
++ *******************************************************************************
++ *
++ * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
++ * ALL RIGHTS RESERVED
++ *
++ *******************************************************************************
++ */
++#ifndef __GST_WL_DRM_H__
++#define __GST_WL_DRM_H__
++
++#include <gst/drm/gstdrmallocator.h>
++#include "wayland-drm-client-protocol.h"
++#include <wayland-client.h>
++
++struct wl_buffer *
++gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
++    const GstVideoInfo * info);
++
++
++#endif /* __GST_WL_DRM_H__ */
+diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
+index 9ebbcaf..b184dfc 100644
+--- a/ext/wayland/wlwindow.c
++++ b/ext/wayland/wlwindow.c
+@@ -221,6 +221,17 @@ gst_wl_window_new_internal (GstWlDisplay * display, GMutex * render_lock)
+         window->video_surface);
+   }
+ 
++  if (display->crop) {
++    GST_DEBUG ("Setting source crop : %d %d %d %d",display->crop->x, display->crop->y,
++                    display->crop->width, display->crop->height);
++    wp_viewport_set_source (window->video_viewport,
++                                        wl_fixed_from_int(display->crop->x),
++                                        wl_fixed_from_int(display->crop->y),
++                                        wl_fixed_from_int(display->crop->width),
++                                        wl_fixed_from_int(display->crop->height));
++
++  }
++
+   /* do not accept input */
+   wl_surface_set_input_region (window->area_surface, NULL);
+   wl_surface_set_input_region (window->video_surface, NULL);
+@@ -380,6 +391,8 @@ gst_wl_window_resize_video_surface (GstWlWindow * window, gboolean commit)
+   GstVideoRectangle src = { 0, };
+   GstVideoRectangle dst = { 0, };
+   GstVideoRectangle res;
++  gint scale_width = window->display->scale_width;
++  gint scale_height = window->display->scale_height;
+ 
+   /* center the video_subsurface inside area_subsurface */
+   src.w = window->video_width;
+@@ -389,8 +402,28 @@ gst_wl_window_resize_video_surface (GstWlWindow * window, gboolean commit)
+ 
+   if (window->video_viewport) {
+     gst_video_sink_center_rect (src, dst, &res, TRUE);
+-    wp_viewport_set_destination (window->video_viewport, res.w, res.h);
+-  } else {
++
++    if(scale_width > 0 && scale_height > 0)
++    {
++	    res.x = 0;
++	    res.y = 0;
++	    res.w = scale_width;
++	    res.h = scale_height;
++	    if (window->display->crop) {
++		    window->display->crop->width = scale_width;
++		    window->display->crop->height = scale_height;
++	    }
++    }
++
++    if (window->display->crop) {
++	    wp_viewport_set_destination (window->area_viewport, window->display->crop->width,  window->display->crop->height);
++	    wp_viewport_set_destination (window->video_viewport, window->display->crop->width,  window->display->crop->height);
++    } else
++    {
++	    wp_viewport_set_destination (window->video_viewport, res.w, res.h);
++    }
++  }
++   else {
+     gst_video_sink_center_rect (src, dst, &res, FALSE);
+   }
+ 
+@@ -507,13 +540,23 @@ gst_wl_window_update_borders (GstWlWindow * window)
+   /* draw the area_subsurface */
+   gst_video_info_set_format (&info, format, width, height);
+ 
+-  alloc = gst_wl_shm_allocator_get ();
++  if(!window->display->use_drm)
++      alloc = gst_wl_shm_allocator_get ();
++  else
++      alloc = gst_drm_allocator_get ();
+ 
+   buf = gst_buffer_new_allocate (alloc, info.size, NULL);
+   gst_buffer_memset (buf, 0, 0, info.size);
+-  wlbuf =
+-      gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
+-      window->display, &info);
++
++  if(!window->display->use_drm)
++      wlbuf =
++          gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
++          window->display, &info);
++  else
++      wlbuf =
++          gst_wl_drm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
++          window->display, &info);
++
+   gwlbuf = gst_buffer_add_wl_buffer (buf, wlbuf, window->display);
+   gst_wl_buffer_attach (gwlbuf, window->area_surface_wrapper);
+ 
+@@ -527,8 +570,16 @@ void
+ gst_wl_window_set_render_rectangle (GstWlWindow * window, gint x, gint y,
+     gint w, gint h)
+ {
++  gint scale_width = window->display->scale_width;
++  gint scale_height = window->display->scale_height;
++
+   g_return_if_fail (window != NULL);
+ 
++  if(scale_width > 0 && scale_height > 0) {
++    w = scale_width;
++    h = scale_height;
++   }
++
+   window->render_rectangle.x = x;
+   window->render_rectangle.y = y;
+   window->render_rectangle.w = w;
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch
new file mode 100644
index 0000000..cba2369
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch
@@ -0,0 +1,1022 @@
+From 0368b83f0cce76c00954577e037cc64c42a99bac Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 20 Feb 2020 15:36:10 +0530
+Subject: [PATCH 5/5] waylandsink: Add input device support
+
+Remove wldispay.h and wlwindow.h to avoid
+circular dependency and create a single .h
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ ext/wayland/Makefile.am                   |   4 +-
+ ext/wayland/gstwaylandsink.c              |   1 -
+ ext/wayland/gstwaylandsink.h              |   3 +-
+ ext/wayland/wlbuffer.c                    |   2 +-
+ ext/wayland/wlbuffer.h                    |  67 -------
+ ext/wayland/wldisplay-wlwindow-wlbuffer.h | 243 +++++++++++++++++++++++++
+ ext/wayland/wldisplay.c                   | 292 +++++++++++++++++++++++++++++-
+ ext/wayland/wldisplay.h                   | 107 -----------
+ ext/wayland/wldrm.c                       |   2 +-
+ ext/wayland/wlshmallocator.h              |   2 +-
+ ext/wayland/wlwindow.c                    |   7 +-
+ ext/wayland/wlwindow.h                    | 102 -----------
+ 12 files changed, 543 insertions(+), 289 deletions(-)
+ delete mode 100644 ext/wayland/wlbuffer.h
+ create mode 100644 ext/wayland/wldisplay-wlwindow-wlbuffer.h
+ delete mode 100644 ext/wayland/wldisplay.h
+ delete mode 100644 ext/wayland/wlwindow.h
+
+diff --git a/ext/wayland/Makefile.am b/ext/wayland/Makefile.am
+index a118033..6f222b7 100644
+--- a/ext/wayland/Makefile.am
++++ b/ext/wayland/Makefile.am
+@@ -47,10 +47,8 @@ libgstwaylandsink_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
+ noinst_HEADERS = \
+ 	gstwaylandsink.h \
+ 	wlshmallocator.h \
+-	wlbuffer.h \
+ 	wldrm.h \
+-	wldisplay.h \
+-	wlwindow.h \
++	wldisplay-wlwindow-wlbuffer.h \
+ 	wlvideoformat.h \
+ 	wllinuxdmabuf.h
+ 
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 9441232..752a0b6 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -43,7 +43,6 @@
+ 
+ #include "gstwaylandsink.h"
+ #include "wlvideoformat.h"
+-#include "wlbuffer.h"
+ #include "wlshmallocator.h"
+ #include "wllinuxdmabuf.h"
+ #include "wldrm.h"
+diff --git a/ext/wayland/gstwaylandsink.h b/ext/wayland/gstwaylandsink.h
+index f6d010e..3917918 100644
+--- a/ext/wayland/gstwaylandsink.h
++++ b/ext/wayland/gstwaylandsink.h
+@@ -27,8 +27,7 @@
+ 
+ #include <wayland-client.h>
+ 
+-#include "wldisplay.h"
+-#include "wlwindow.h"
++#include "wldisplay-wlwindow-wlbuffer.h"
+ 
+ G_BEGIN_DECLS
+ 
+diff --git a/ext/wayland/wlbuffer.c b/ext/wayland/wlbuffer.c
+index 2121460..3642d17 100644
+--- a/ext/wayland/wlbuffer.c
++++ b/ext/wayland/wlbuffer.c
+@@ -76,7 +76,7 @@
+  * as soon as we remove the reference that GstWlDisplay holds.
+  */
+ 
+-#include "wlbuffer.h"
++#include "wldisplay-wlwindow-wlbuffer.h"
+ 
+ GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
+ #define GST_CAT_DEFAULT gstwayland_debug
+diff --git a/ext/wayland/wlbuffer.h b/ext/wayland/wlbuffer.h
+deleted file mode 100644
+index cbb50f7..0000000
+--- a/ext/wayland/wlbuffer.h
++++ /dev/null
+@@ -1,67 +0,0 @@
+-/* GStreamer Wayland video sink
+- *
+- * Copyright (C) 2014 Collabora Ltd.
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Library General Public
+- * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Library General Public License for more details.
+- *
+- * You should have received a copy of the GNU Library General Public
+- * License along with this library; if not, write to the Free
+- * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
+- * Boston, MA 02110-1301 USA.
+- */
+-
+-#ifndef __GST_WL_BUFFER_H__
+-#define __GST_WL_BUFFER_H__
+-
+-#include "wldisplay.h"
+-
+-G_BEGIN_DECLS
+-
+-#define GST_TYPE_WL_BUFFER                  (gst_wl_buffer_get_type ())
+-#define GST_WL_BUFFER(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_WL_BUFFER, GstWlBuffer))
+-#define GST_IS_WL_BUFFER(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_WL_BUFFER))
+-#define GST_WL_BUFFER_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_WL_BUFFER, GstWlBufferClass))
+-#define GST_IS_WL_BUFFER_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_WL_BUFFER))
+-#define GST_WL_BUFFER_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_WL_BUFFER, GstWlBufferClass))
+-
+-typedef struct _GstWlBuffer GstWlBuffer;
+-typedef struct _GstWlBufferClass GstWlBufferClass;
+-
+-struct _GstWlBuffer
+-{
+-  GObject parent_instance;
+-
+-  struct wl_buffer * wlbuffer;
+-  GstBuffer *gstbuffer;
+-
+-  GstWlDisplay *display;
+-
+-  gboolean used_by_compositor;
+-};
+-
+-struct _GstWlBufferClass
+-{
+-  GObjectClass parent_class;
+-};
+-
+-GType gst_wl_buffer_get_type (void);
+-
+-GstWlBuffer * gst_buffer_add_wl_buffer (GstBuffer * gstbuffer,
+-    struct wl_buffer * wlbuffer, GstWlDisplay * display);
+-GstWlBuffer * gst_buffer_get_wl_buffer (GstBuffer * gstbuffer);
+-
+-void gst_wl_buffer_force_release_and_unref (GstWlBuffer * self);
+-
+-void gst_wl_buffer_attach (GstWlBuffer * self, struct wl_surface *surface);
+-
+-G_END_DECLS
+-
+-#endif /* __GST_WL_BUFFER_H__ */
+diff --git a/ext/wayland/wldisplay-wlwindow-wlbuffer.h b/ext/wayland/wldisplay-wlwindow-wlbuffer.h
+new file mode 100644
+index 0000000..face05f
+--- /dev/null
++++ b/ext/wayland/wldisplay-wlwindow-wlbuffer.h
+@@ -0,0 +1,243 @@
++/* GStreamer Wayland video sink
++ *
++ * Copyright (C) 2014 Collabora Ltd.
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the Free
++ * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
++ * Boston, MA 02110-1301 USA.
++ */
++
++#ifndef __GST_WL_DISPLAY_H__
++#define __GST_WL_DISPLAY_H__
++
++#include <gst/gst.h>
++#include <stdlib.h>
++#include <stdio.h>
++#include <gst/video/video.h>
++#include <gst/gstbuffer.h>
++#include <gst/drm/gstdrmallocator.h>
++#include <wayland-client.h>
++#include "xdg-shell-client-protocol.h"
++#include "viewporter-client-protocol.h"
++#include "linux-dmabuf-unstable-v1-client-protocol.h"
++#include "fullscreen-shell-unstable-v1-client-protocol.h"
++
++G_BEGIN_DECLS
++
++#define GST_TYPE_WL_BUFFER                  (gst_wl_buffer_get_type ())
++#define GST_WL_BUFFER(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_WL_BUFFER, GstWlBuffer))
++#define GST_IS_WL_BUFFER(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_WL_BUFFER))
++#define GST_WL_BUFFER_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_WL_BUFFER, GstWlBufferClass))
++#define GST_IS_WL_BUFFER_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_WL_BUFFER))
++#define GST_WL_BUFFER_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_WL_BUFFER, GstWlBufferClass))
++
++
++#define GST_TYPE_WL_WINDOW                  (gst_wl_window_get_type ())
++#define GST_WL_WINDOW(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_WL_WINDOW, GstWlWindow))
++#define GST_IS_WL_WINDOW(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_WL_WINDOW))
++#define GST_WL_WINDOW_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_WL_WINDOW, GstWlWindowClass))
++#define GST_IS_WL_WINDOW_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_WL_WINDOW))
++#define GST_WL_WINDOW_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_WL_WINDOW, GstWlWindowClass))
++
++
++#define GST_TYPE_WL_DISPLAY                  (gst_wl_display_get_type ())
++#define GST_WL_DISPLAY(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_WL_DISPLAY, GstWlDisplay))
++#define GST_IS_WL_DISPLAY(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_WL_DISPLAY))
++#define GST_WL_DISPLAY_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_WL_DISPLAY, GstWlDisplayClass))
++#define GST_IS_WL_DISPLAY_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_WL_DISPLAY))
++#define GST_WL_DISPLAY_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_WL_DISPLAY, GstWlDisplayClass))
++
++typedef struct _GstWlBuffer GstWlBuffer;
++typedef struct _GstWlBufferClass GstWlBufferClass;
++
++typedef struct _GstWlWindow GstWlWindow;
++typedef struct _GstWlWindowClass GstWlWindowClass;
++
++typedef struct _GstWlDisplay GstWlDisplay;
++typedef struct _GstWlDisplayClass GstWlDisplayClass;
++
++struct _GstWlBuffer
++{
++  GObject parent_instance;
++
++  struct wl_buffer * wlbuffer;
++  GstBuffer *gstbuffer;
++
++  GstWlDisplay *display;
++
++  gboolean used_by_compositor;
++};
++
++struct _GstWlBufferClass
++{
++  GObjectClass parent_class;
++};
++
++GType gst_wl_buffer_get_type (void);
++
++GstWlBuffer * gst_buffer_add_wl_buffer (GstBuffer * gstbuffer,
++    struct wl_buffer * wlbuffer, GstWlDisplay * display);
++GstWlBuffer * gst_buffer_get_wl_buffer (GstBuffer * gstbuffer);
++
++void gst_wl_buffer_force_release_and_unref (GstWlBuffer * self);
++
++void gst_wl_buffer_attach (GstWlBuffer * self, struct wl_surface *surface);
++
++
++struct _GstWlWindow
++{
++  GObject parent_instance;
++
++  GMutex *render_lock;
++
++  GstWlDisplay *display;
++  struct wl_surface *area_surface;
++  struct wl_surface *area_surface_wrapper;
++  struct wl_subsurface *area_subsurface;
++  struct wp_viewport *area_viewport;
++  struct wl_surface *video_surface;
++  struct wl_surface *video_surface_wrapper;
++  struct wl_subsurface *video_subsurface;
++  struct wp_viewport *video_viewport;
++  struct wl_shell_surface *wl_shell_surface;
++  struct xdg_surface *xdg_surface;
++  struct xdg_toplevel *xdg_toplevel;
++  gboolean configured;
++  GCond configure_cond;
++  GMutex configure_mutex;
++
++  /* the size and position of the area_(sub)surface */
++  GstVideoRectangle render_rectangle;
++
++  /* the size and position of the video_subsurface */
++  GstVideoRectangle video_rectangle;
++
++  /* the size of the video in the buffers */
++  gint video_width, video_height;
++
++  /* this will be set when viewporter is available and black background has
++   * already been set on the area_subsurface */
++  gboolean no_border_update;
++
++};
++
++struct _GstWlWindowClass
++{
++  GObjectClass parent_class;
++};
++
++GType gst_wl_window_get_type (void);
++void gst_wl_window_ensure_fullscreen (GstWlWindow * window,
++         gboolean fullscreen);
++
++GstWlWindow *gst_wl_window_new_toplevel (GstWlDisplay * display,
++        const GstVideoInfo * info, gboolean fullscreen, GMutex * render_lock);
++GstWlWindow *gst_wl_window_new_in_surface (GstWlDisplay * display,
++        struct wl_surface * parent, GMutex * render_lock);
++
++GstWlDisplay *gst_wl_window_get_display (GstWlWindow * window);
++struct wl_surface *gst_wl_window_get_wl_surface (GstWlWindow * window);
++gboolean gst_wl_window_is_toplevel (GstWlWindow *window);
++
++void gst_wl_window_render (GstWlWindow * window, GstWlBuffer * buffer,
++        const GstVideoInfo * info);
++void gst_wl_window_set_render_rectangle (GstWlWindow * window, gint x, gint y,
++        gint w, gint h);
++
++struct touch_point
++{
++  int32_t id;
++  struct wl_list link;
++};
++
++struct input
++{
++  GstWlDisplay *display;
++  struct wl_seat *seat;
++  struct wl_pointer *pointer;
++  struct wl_touch *touch;
++  struct wl_list touch_point_list;
++  GstWlWindow *pointer_focus;
++  GstWlWindow *touch_focus;
++  struct wl_list link;
++  GstWlWindow *grab;
++};
++
++struct _GstWlDisplay
++{
++  GObject parent_instance;
++
++  /* public objects */
++  struct wl_display *display;
++  struct wl_display *display_wrapper;
++  struct wl_event_queue *queue;
++
++  /* globals */
++  struct wl_registry *registry;
++  struct wl_compositor *compositor;
++  struct wl_subcompositor *subcompositor;
++  struct wl_shell *wl_shell;
++  struct xdg_wm_base *xdg_wm_base;
++  struct zwp_fullscreen_shell_v1 *fullscreen_shell;
++  struct wl_shm *shm;
++  struct wl_drm *drm;
++  struct wp_viewporter *viewporter;
++  struct zwp_linux_dmabuf_v1 *dmabuf;
++  GArray *shm_formats;
++  GArray *dmabuf_formats;
++  GArray *drm_formats;
++
++  /* private */
++  gboolean own_display;
++  GThread *thread;
++  GstPoll *wl_fd_poll;
++
++  GMutex buffers_mutex;
++  GHashTable *buffers;
++  gboolean shutting_down;
++
++  int fd;
++  int authenticated;
++  gboolean use_drm;
++  gint scale_width, scale_height;
++  GstVideoCropMeta *crop;
++
++  struct wl_list input_list;
++  int seat_version;
++  uint32_t serial;
++};
++
++struct _GstWlDisplayClass
++{
++  GObjectClass parent_class;
++};
++
++GType gst_wl_display_get_type (void);
++
++GstWlDisplay *gst_wl_display_new (const gchar * name, GError ** error);
++GstWlDisplay *gst_wl_display_new_existing (struct wl_display * display,
++    gboolean take_ownership, GError ** error);
++
++/* see wlbuffer.c for explanation */
++void gst_wl_display_register_buffer (GstWlDisplay * self, gpointer buf);
++void gst_wl_display_unregister_buffer (GstWlDisplay * self, gpointer buf);
++
++gboolean gst_wl_display_check_format_for_shm (GstWlDisplay * display,
++    GstVideoFormat format);
++gboolean gst_wl_display_check_format_for_dmabuf (GstWlDisplay * display,
++    GstVideoFormat format);
++
++G_END_DECLS
++
++#endif /* __GST_WL_DISPLAY_H__ */
+diff --git a/ext/wayland/wldisplay.c b/ext/wayland/wldisplay.c
+index 363e817..7ae952c 100644
+--- a/ext/wayland/wldisplay.c
++++ b/ext/wayland/wldisplay.c
+@@ -22,14 +22,15 @@
+ #include <config.h>
+ #endif
+ 
+-#include "wldisplay.h"
+-#include "wlbuffer.h"
++#include "wldisplay-wlwindow-wlbuffer.h"
+ #include "wlvideoformat.h"
+ 
+ #include "wayland-drm-client-protocol.h"
++#include <linux/input.h>
+ #include <fcntl.h>
+ #include <xf86drm.h>
+ #include <xf86drmMode.h>
++#include <unistd.h>
+ #include <errno.h>
+ 
+ GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
+@@ -58,6 +59,53 @@ gst_wl_display_init (GstWlDisplay * self)
+   self->use_drm = FALSE;
+   g_mutex_init (&self->buffers_mutex);
+ }
++static void
++input_grab (struct input *input, GstWlWindow *window)
++{
++	input->grab = window;
++}
++
++static void
++input_ungrab (struct input *input)
++{
++	input->grab = NULL;
++}
++
++static void
++input_remove_pointer_focus (struct input *input)
++{
++	GstWlWindow *window = input->pointer_focus;
++
++	if (!window)
++		return;
++
++	input->pointer_focus = NULL;
++}
++
++static void
++input_destroy (struct input *input)
++{
++	input_remove_pointer_focus (input);
++
++	if (input->display->seat_version >= 3) {
++		if (input->pointer)
++			wl_pointer_release (input->pointer);
++	}
++
++	wl_list_remove (&input->link);
++	wl_seat_destroy (input->seat);
++	free (input);
++}
++
++static void
++display_destroy_inputs (GstWlDisplay *display)
++{
++	struct input *tmp;
++	struct input *input;
++
++	wl_list_for_each_safe (input, tmp, &display->input_list, link)
++		input_destroy (input);
++}
+ 
+ static void
+ gst_wl_display_finalize (GObject * gobject)
+@@ -86,6 +134,8 @@ gst_wl_display_finalize (GObject * gobject)
+   g_hash_table_unref (self->buffers);
+   g_mutex_clear (&self->buffers_mutex);
+ 
++  display_destroy_inputs (self);
++
+   if(self->fd != -1)
+ 	close(self->fd);
+ 
+@@ -252,6 +302,240 @@ static const struct wl_drm_listener drm_listener = {
+   drm_handle_authenticated
+ };
+ 
++ static void
++pointer_handle_enter (void *data, struct wl_pointer *pointer,
++    uint32_t serial, struct wl_surface *surface,
++    wl_fixed_t sx_w, wl_fixed_t sy_w)
++{
++  struct input *input = data;
++
++  if (!surface) {
++    /* enter event for a window we've just destroyed */
++    return;
++  }
++
++  input->display->serial = serial;
++  input->pointer_focus = wl_surface_get_user_data (surface);
++}
++
++static void
++pointer_handle_leave (void *data, struct wl_pointer *pointer,
++    uint32_t serial, struct wl_surface *surface)
++{
++  struct input *input = data;
++
++  input_remove_pointer_focus (input);
++}
++
++static void
++pointer_handle_motion (void *data, struct wl_pointer *pointer,
++    uint32_t time, wl_fixed_t sx_w, wl_fixed_t sy_w)
++{
++  struct input *input = data;
++  GstWlWindow *window = input->pointer_focus;
++
++  if (!window)
++    return;
++
++  if (input->grab)
++    wl_shell_surface_move (input->grab->wl_shell_surface, input->seat,
++        input->display->serial);
++
++}
++
++static void
++pointer_handle_button (void *data, struct wl_pointer *pointer, uint32_t serial,
++    uint32_t time, uint32_t button, uint32_t state_w)
++{
++  struct input *input = data;
++  enum wl_pointer_button_state state = state_w;
++  input->display->serial = serial;
++
++  if (button == BTN_LEFT) {
++    if (state == WL_POINTER_BUTTON_STATE_PRESSED)
++      input_grab (input, input->pointer_focus);
++
++    if (input->grab && state == WL_POINTER_BUTTON_STATE_RELEASED)
++      input_ungrab (input);
++  }
++
++  if (input->grab)
++    wl_shell_surface_move (input->grab->wl_shell_surface, input->seat,
++        input->display->serial);
++}
++
++static void
++pointer_handle_axis (void *data, struct wl_pointer *pointer,
++    uint32_t time, uint32_t axis, wl_fixed_t value)
++{
++}
++
++static void pointer_frame(void *data, struct wl_pointer *wl_pointer)
++{
++}
++static void pointer_axis_source(void *data, struct wl_pointer *wl_pointer, uint32_t axis_source)
++{
++}
++static void pointer_axis_stop(void *data, struct wl_pointer *wl_pointer, uint32_t time, uint32_t axis)
++{
++}
++
++static const struct wl_pointer_listener pointer_listener = {
++  pointer_handle_enter,
++  pointer_handle_leave,
++  pointer_handle_motion,
++  pointer_handle_button,
++  pointer_handle_axis,
++  pointer_frame,
++  pointer_axis_source,
++  pointer_axis_stop
++};
++
++static void
++touch_handle_down (void *data, struct wl_touch *wl_touch,
++    uint32_t serial, uint32_t time, struct wl_surface *surface,
++    int32_t id, wl_fixed_t x_w, wl_fixed_t y_w)
++{
++  struct input *input = data;
++  struct touch_point *tp;
++
++  input->display->serial = serial;
++  input->touch_focus = wl_surface_get_user_data (surface);
++  if (!input->touch_focus) {
++    return;
++  }
++
++  tp = malloc (sizeof *tp);
++  if (tp) {
++    tp->id = id;
++    wl_list_insert (&input->touch_point_list, &tp->link);
++    wl_shell_surface_move (input->touch_focus->wl_shell_surface, input->seat,
++        serial);
++  }
++}
++
++static void
++touch_handle_motion (void *data, struct wl_touch *wl_touch,
++    uint32_t time, int32_t id, wl_fixed_t x_w, wl_fixed_t y_w)
++{
++  struct input *input = data;
++  struct touch_point *tp;
++
++
++  if (!input->touch_focus) {
++    return;
++  }
++  wl_list_for_each (tp, &input->touch_point_list, link) {
++    if (tp->id != id)
++      continue;
++
++    wl_shell_surface_move (input->touch_focus->wl_shell_surface, input->seat,
++        input->display->serial);
++
++    return;
++  }
++}
++
++static void
++touch_handle_frame (void *data, struct wl_touch *wl_touch)
++{
++}
++
++static void
++touch_handle_cancel (void *data, struct wl_touch *wl_touch)
++{
++}
++
++static void
++touch_handle_up (void *data, struct wl_touch *wl_touch,
++    uint32_t serial, uint32_t time, int32_t id)
++{
++  struct input *input = data;
++  struct touch_point *tp, *tmp;
++
++  if (!input->touch_focus) {
++    return;
++  }
++
++  wl_list_for_each_safe (tp, tmp, &input->touch_point_list, link) {
++    if (tp->id != id)
++      continue;
++
++    wl_list_remove (&tp->link);
++    free (tp);
++
++    return;
++  }
++}
++
++static const struct wl_touch_listener touch_listener = {
++  touch_handle_down,
++  touch_handle_up,
++  touch_handle_motion,
++  touch_handle_frame,
++  touch_handle_cancel,
++};
++
++static void
++seat_handle_capabilities (void *data, struct wl_seat *seat,
++    enum wl_seat_capability caps)
++{
++  struct input *input = data;
++
++  if ((caps & WL_SEAT_CAPABILITY_POINTER) && !input->pointer) {
++    input->pointer = wl_seat_get_pointer (seat);
++    wl_pointer_set_user_data (input->pointer, input);
++    wl_pointer_add_listener (input->pointer, &pointer_listener, input);
++  } else if (!(caps & WL_SEAT_CAPABILITY_POINTER) && input->pointer) {
++    wl_pointer_destroy (input->pointer);
++    input->pointer = NULL;
++  }
++
++  if ((caps & WL_SEAT_CAPABILITY_TOUCH) && !input->touch) {
++    input->touch = wl_seat_get_touch (seat);
++    wl_touch_set_user_data (input->touch, input);
++    wl_touch_add_listener (input->touch, &touch_listener, input);
++  } else if (!(caps & WL_SEAT_CAPABILITY_TOUCH) && input->touch) {
++    wl_touch_destroy (input->touch);
++    input->touch = NULL;
++  }
++}
++
++static void
++seat_handle_name (void *data, struct wl_seat *seat, const char *name)
++{
++
++}
++
++static const struct wl_seat_listener seat_listener = {
++  seat_handle_capabilities,
++  seat_handle_name
++};
++
++static void
++display_add_input (GstWlDisplay *d, uint32_t id)
++{
++  struct input *input;
++
++  input = calloc (1, sizeof (*input));
++  if (input == NULL) {
++    fprintf (stderr, "%s: out of memory\n", "gst-wayland-sink");
++    exit (EXIT_FAILURE);
++  }
++  input->display = d;
++  input->seat = wl_registry_bind (d->registry, id, &wl_seat_interface,
++      MAX (d->seat_version, 3));
++  input->touch_focus = NULL;
++  input->pointer_focus = NULL;
++  wl_list_init (&input->touch_point_list);
++  wl_list_insert (d->input_list.prev, &input->link);
++
++  wl_seat_add_listener (input->seat, &seat_listener, input);
++  wl_seat_set_user_data (input->seat, input);
++
++}
++
++
+ static void
+ registry_handle_global (void *data, struct wl_registry *registry,
+     uint32_t id, const char *interface, uint32_t version)
+@@ -279,6 +563,9 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   } else if (g_strcmp0 (interface, "wl_drm") == 0) {
+     self->drm = wl_registry_bind (registry, id, &wl_drm_interface, 1);
+     wl_drm_add_listener (self->drm, &drm_listener, self);
++  } else if (g_strcmp0 (interface, "wl_seat") == 0) {
++    self->seat_version = version;
++    display_add_input (self, id);
+   } else if (g_strcmp0 (interface, "wp_viewporter") == 0) {
+     self->viewporter =
+         wl_registry_bind (registry, id, &wp_viewporter_interface, 1);
+@@ -361,6 +648,7 @@ gst_wl_display_new_existing (struct wl_display * display,
+   self->display_wrapper = wl_proxy_create_wrapper (display);
+   self->own_display = take_ownership;
+ 
++  wl_list_init (&self->input_list);
+   self->queue = wl_display_create_queue (self->display);
+   wl_proxy_set_queue ((struct wl_proxy *) self->display_wrapper, self->queue);
+   self->registry = wl_display_get_registry (self->display_wrapper);
+diff --git a/ext/wayland/wldisplay.h b/ext/wayland/wldisplay.h
+deleted file mode 100644
+index 81e96bc..0000000
+--- a/ext/wayland/wldisplay.h
++++ /dev/null
+@@ -1,107 +0,0 @@
+-/* GStreamer Wayland video sink
+- *
+- * Copyright (C) 2014 Collabora Ltd.
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Library General Public
+- * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Library General Public License for more details.
+- *
+- * You should have received a copy of the GNU Library General Public
+- * License along with this library; if not, write to the Free
+- * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
+- * Boston, MA 02110-1301 USA.
+- */
+-
+-#ifndef __GST_WL_DISPLAY_H__
+-#define __GST_WL_DISPLAY_H__
+-
+-#include <gst/gst.h>
+-#include <gst/video/video.h>
+-#include <wayland-client.h>
+-#include "xdg-shell-client-protocol.h"
+-#include "viewporter-client-protocol.h"
+-#include "linux-dmabuf-unstable-v1-client-protocol.h"
+-#include "fullscreen-shell-unstable-v1-client-protocol.h"
+-
+-G_BEGIN_DECLS
+-
+-#define GST_TYPE_WL_DISPLAY                  (gst_wl_display_get_type ())
+-#define GST_WL_DISPLAY(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_WL_DISPLAY, GstWlDisplay))
+-#define GST_IS_WL_DISPLAY(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_WL_DISPLAY))
+-#define GST_WL_DISPLAY_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_WL_DISPLAY, GstWlDisplayClass))
+-#define GST_IS_WL_DISPLAY_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_WL_DISPLAY))
+-#define GST_WL_DISPLAY_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_WL_DISPLAY, GstWlDisplayClass))
+-
+-typedef struct _GstWlDisplay GstWlDisplay;
+-typedef struct _GstWlDisplayClass GstWlDisplayClass;
+-
+-struct _GstWlDisplay
+-{
+-  GObject parent_instance;
+-
+-  /* public objects */
+-  struct wl_display *display;
+-  struct wl_display *display_wrapper;
+-  struct wl_event_queue *queue;
+-
+-  /* globals */
+-  struct wl_registry *registry;
+-  struct wl_compositor *compositor;
+-  struct wl_subcompositor *subcompositor;
+-  struct wl_shell *wl_shell;
+-  struct xdg_wm_base *xdg_wm_base;
+-  struct zwp_fullscreen_shell_v1 *fullscreen_shell;
+-  struct wl_shm *shm;
+-  struct wl_drm *drm;
+-  struct wp_viewporter *viewporter;
+-  struct zwp_linux_dmabuf_v1 *dmabuf;
+-  GArray *shm_formats;
+-  GArray *drm_formats;
+-  GArray *dmabuf_formats;
+-
+-  /* private */
+-  gboolean own_display;
+-  GThread *thread;
+-  GstPoll *wl_fd_poll;
+-
+-  GMutex buffers_mutex;
+-  GHashTable *buffers;
+-  gboolean shutting_down;
+-
+-  int fd;
+-  int authenticated;
+-  gboolean use_drm;
+-  gint scale_width, scale_height;
+-  GstVideoCropMeta *crop;
+-
+-};
+-
+-struct _GstWlDisplayClass
+-{
+-  GObjectClass parent_class;
+-};
+-
+-GType gst_wl_display_get_type (void);
+-
+-GstWlDisplay *gst_wl_display_new (const gchar * name, GError ** error);
+-GstWlDisplay *gst_wl_display_new_existing (struct wl_display * display,
+-    gboolean take_ownership, GError ** error);
+-
+-/* see wlbuffer.c for explanation */
+-void gst_wl_display_register_buffer (GstWlDisplay * self, gpointer buf);
+-void gst_wl_display_unregister_buffer (GstWlDisplay * self, gpointer buf);
+-
+-gboolean gst_wl_display_check_format_for_shm (GstWlDisplay * display,
+-    GstVideoFormat format);
+-gboolean gst_wl_display_check_format_for_dmabuf (GstWlDisplay * display,
+-    GstVideoFormat format);
+-
+-G_END_DECLS
+-
+-#endif /* __GST_WL_DISPLAY_H__ */
+diff --git a/ext/wayland/wldrm.c b/ext/wayland/wldrm.c
+index 0da9b73..0b72896 100644
+--- a/ext/wayland/wldrm.c
++++ b/ext/wayland/wldrm.c
+@@ -1,4 +1,4 @@
+-#include "wldisplay.h"
++#include "wldisplay-wlwindow-wlbuffer.h"
+ #include <gst/drm/gstdrmallocator.h>
+ #include "wayland-drm-client-protocol.h"
+ #include <wayland-client.h>
+diff --git a/ext/wayland/wlshmallocator.h b/ext/wayland/wlshmallocator.h
+index 07ae17f..2860fc3 100644
+--- a/ext/wayland/wlshmallocator.h
++++ b/ext/wayland/wlshmallocator.h
+@@ -26,7 +26,7 @@
+ #include <gst/video/video.h>
+ #include <gst/allocators/allocators.h>
+ #include <wayland-client-protocol.h>
+-#include "wldisplay.h"
++#include "wldisplay-wlwindow-wlbuffer.h"
+ 
+ G_BEGIN_DECLS
+ 
+diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
+index b184dfc..2c768f2 100644
+--- a/ext/wayland/wlwindow.c
++++ b/ext/wayland/wlwindow.c
+@@ -24,9 +24,9 @@
+ #include <config.h>
+ #endif
+ 
+-#include "wlwindow.h"
+ #include "wlshmallocator.h"
+-#include "wlbuffer.h"
++#include "wldisplay-wlwindow-wlbuffer.h"
++#include "wldrm.h"
+ 
+ GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
+ #define GST_CAT_DEFAULT gstwayland_debug
+@@ -199,6 +199,9 @@ gst_wl_window_new_internal (GstWlDisplay * display, GMutex * render_lock)
+   window->area_surface = wl_compositor_create_surface (display->compositor);
+   window->video_surface = wl_compositor_create_surface (display->compositor);
+ 
++  wl_surface_set_user_data (window->area_surface, window);
++  wl_surface_set_user_data (window->video_surface, window);
++
+   window->area_surface_wrapper = wl_proxy_create_wrapper (window->area_surface);
+   window->video_surface_wrapper =
+       wl_proxy_create_wrapper (window->video_surface);
+diff --git a/ext/wayland/wlwindow.h b/ext/wayland/wlwindow.h
+deleted file mode 100644
+index c3f0172..0000000
+--- a/ext/wayland/wlwindow.h
++++ /dev/null
+@@ -1,102 +0,0 @@
+-/* GStreamer Wayland video sink
+- *
+- * Copyright (C) 2014 Collabora Ltd.
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Library General Public
+- * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Library General Public License for more details.
+- *
+- * You should have received a copy of the GNU Library General Public
+- * License along with this library; if not, write to the Free
+- * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
+- * Boston, MA 02110-1301 USA.
+- */
+-
+-#ifndef __GST_WL_WINDOW_H__
+-#define __GST_WL_WINDOW_H__
+-
+-#include "wldisplay.h"
+-#include "wlbuffer.h"
+-#include <gst/video/video.h>
+-
+-G_BEGIN_DECLS
+-
+-#define GST_TYPE_WL_WINDOW                  (gst_wl_window_get_type ())
+-#define GST_WL_WINDOW(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_WL_WINDOW, GstWlWindow))
+-#define GST_IS_WL_WINDOW(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_WL_WINDOW))
+-#define GST_WL_WINDOW_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_WL_WINDOW, GstWlWindowClass))
+-#define GST_IS_WL_WINDOW_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_WL_WINDOW))
+-#define GST_WL_WINDOW_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_WL_WINDOW, GstWlWindowClass))
+-
+-typedef struct _GstWlWindow GstWlWindow;
+-typedef struct _GstWlWindowClass GstWlWindowClass;
+-
+-struct _GstWlWindow
+-{
+-  GObject parent_instance;
+-
+-  GMutex *render_lock;
+-
+-  GstWlDisplay *display;
+-  struct wl_surface *area_surface;
+-  struct wl_surface *area_surface_wrapper;
+-  struct wl_subsurface *area_subsurface;
+-  struct wp_viewport *area_viewport;
+-  struct wl_surface *video_surface;
+-  struct wl_surface *video_surface_wrapper;
+-  struct wl_subsurface *video_subsurface;
+-  struct wp_viewport *video_viewport;
+-  struct wl_shell_surface *wl_shell_surface;
+-  struct xdg_surface *xdg_surface;
+-  struct xdg_toplevel *xdg_toplevel;
+-  gboolean configured;
+-  GCond configure_cond;
+-  GMutex configure_mutex;
+-
+-  /* the size and position of the area_(sub)surface */
+-  GstVideoRectangle render_rectangle;
+-
+-  /* the size and position of the video_subsurface */
+-  GstVideoRectangle video_rectangle;
+-
+-  /* the size of the video in the buffers */
+-  gint video_width, video_height;
+-
+-  /* this will be set when viewporter is available and black background has
+-   * already been set on the area_subsurface */
+-  gboolean no_border_update;
+-
+-};
+-
+-struct _GstWlWindowClass
+-{
+-  GObjectClass parent_class;
+-};
+-
+-GType gst_wl_window_get_type (void);
+-
+-void gst_wl_window_ensure_fullscreen (GstWlWindow * window,
+-        gboolean fullscreen);
+-GstWlWindow *gst_wl_window_new_toplevel (GstWlDisplay * display,
+-        const GstVideoInfo * info, gboolean fullscreen, GMutex * render_lock);
+-GstWlWindow *gst_wl_window_new_in_surface (GstWlDisplay * display,
+-        struct wl_surface * parent, GMutex * render_lock);
+-
+-GstWlDisplay *gst_wl_window_get_display (GstWlWindow * window);
+-struct wl_surface *gst_wl_window_get_wl_surface (GstWlWindow * window);
+-gboolean gst_wl_window_is_toplevel (GstWlWindow *window);
+-
+-void gst_wl_window_render (GstWlWindow * window, GstWlBuffer * buffer,
+-        const GstVideoInfo * info);
+-void gst_wl_window_set_render_rectangle (GstWlWindow * window, gint x, gint y,
+-        gint w, gint h);
+-
+-G_END_DECLS
+-
+-#endif /* __GST_WL_WINDOW_H__ */
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 4138c31..b7b9efe 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -25,36 +25,34 @@ DEPENDS_append_k3 = " \
     libdrm \
 "
 
-#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
-#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
+    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
+    file://0005-waylandsink-Add-input-device-support.patch \
 "
 
-#SRC_URI_append_ti33x = " \
-#    file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
-#"
+SRC_URI_append_ti33x = " \
+    file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
+"
 
-#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
-#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_omap-a15 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
+    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
+    file://0005-waylandsink-Add-input-device-support.patch \
 "
 
-#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
-#    file://0005-waylandsink-Add-input-device-support.patch
-#    file://0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
-#    file://0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
 SRC_URI_append_k3 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-Pick-bug-fixes-on-different-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
+    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
+    file://0005-waylandsink-Add-input-device-support.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = ".arago0"
+PR_append = ".arago1"
-- 
1.9.1


