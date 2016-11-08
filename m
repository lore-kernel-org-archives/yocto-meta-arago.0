Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5A48052A87
	for <meta-arago@arago-project.org>;
	Tue,  8 Nov 2016 14:24:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA8EOCSU021148
	for <meta-arago@arago-project.org>; Tue, 8 Nov 2016 08:24:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA8EOCs0028332
	for <meta-arago@arago-project.org>; Tue, 8 Nov 2016 08:24:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 8 Nov 2016 08:24:12 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uA8EOC7V000700	for <meta-arago@arago-project.org>;
	Tue, 8 Nov 2016 08:24:12 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 8 Nov 2016 09:24:08 -0500
Message-ID: <1478615048-19038-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-bad: add mouse drag and drop support for AM3/4
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
X-List-Received-Date: Tue, 08 Nov 2016 14:24:18 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...ylandsink-Add-mouse-drag-and-drop-support.patch | 408 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |   4 +-
 2 files changed, 411 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch
new file mode 100644
index 0000000..6962026
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch
@@ -0,0 +1,408 @@
+From 79db7e4cab226515f0e4d40afdb5a5b478755396 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Wed, 14 Sep 2016 16:03:17 -0400
+Subject: [PATCH] gstwaylandsink: Add mouse drag and drop support
+
+This patch adds mouse input listeners to WlDisplay instance.
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ ext/wayland/wldisplay.c | 305 +++++++++++++++++++++++++++++++++++++++++++++++-
+ ext/wayland/wldisplay.h |   4 +
+ ext/wayland/wlwindow.c  |   2 +
+ 3 files changed, 310 insertions(+), 1 deletion(-)
+
+diff --git a/ext/wayland/wldisplay.c b/ext/wayland/wldisplay.c
+index 8c5eeaf..c647f34 100644
+--- a/ext/wayland/wldisplay.c
++++ b/ext/wayland/wldisplay.c
+@@ -21,18 +21,45 @@
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
+-
++#include <stdlib.h>
++#include <stdio.h>
+ #include "wldisplay.h"
+ #include "wlbuffer.h"
++#include "wlwindow.h"
++
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
+@@ -51,6 +78,54 @@ gst_wl_display_init (GstWlDisplay * self)
+ }
+ 
+ static void
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
++
++static void
+ gst_wl_display_finalize (GObject * gobject)
+ {
+   GstWlDisplay *self = GST_WL_DISPLAY (gobject);
+@@ -74,6 +149,8 @@ gst_wl_display_finalize (GObject * gobject)
+   g_hash_table_unref (self->buffers);
+   g_mutex_clear (&self->buffers_mutex);
+ 
++  display_destroy_inputs (self);
++
+   if (self->shm)
+     wl_shm_destroy (self->shm);
+ 
+@@ -143,6 +220,228 @@ static const struct wl_shm_listener shm_listener = {
+   shm_format
+ };
+ 
++
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
++    wl_shell_surface_move (input->grab->shell_surface, input->seat,
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
++    wl_shell_surface_move (input->grab->shell_surface, input->seat,
++        input->display->serial);
++}
++
++static void
++pointer_handle_axis (void *data, struct wl_pointer *pointer,
++    uint32_t time, uint32_t axis, wl_fixed_t value)
++{
++}
++
++static const struct wl_pointer_listener pointer_listener = {
++  pointer_handle_enter,
++  pointer_handle_leave,
++  pointer_handle_motion,
++  pointer_handle_button,
++  pointer_handle_axis,
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
++    wl_shell_surface_move (input->touch_focus->shell_surface, input->seat,
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
++    wl_shell_surface_move (input->touch_focus->shell_surface, input->seat,
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
+ static void
+ registry_handle_global (void *data, struct wl_registry *registry,
+     uint32_t id, const char *interface, uint32_t version)
+@@ -160,6 +459,9 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   } else if (g_strcmp0 (interface, "wl_shm") == 0) {
+     self->shm = wl_registry_bind (registry, id, &wl_shm_interface, 1);
+     wl_shm_add_listener (self->shm, &shm_listener, self);
++  } else if (g_strcmp0 (interface, "wl_seat") == 0) {
++    self->seat_version = version;
++    display_add_input (self, id);
+   } else if (g_strcmp0 (interface, "wl_scaler") == 0) {
+     self->scaler = wl_registry_bind (registry, id, &wl_scaler_interface, 2);
+   }
+@@ -237,6 +539,7 @@ gst_wl_display_new_existing (struct wl_display * display,
+   self->own_display = take_ownership;
+ 
+   self->queue = wl_display_create_queue (self->display);
++  wl_list_init (&self->input_list);
+   self->registry = wl_display_get_registry (self->display);
+   wl_proxy_set_queue ((struct wl_proxy *) self->registry, self->queue);
+   wl_registry_add_listener (self->registry, &registry_listener, self);
+diff --git a/ext/wayland/wldisplay.h b/ext/wayland/wldisplay.h
+index 5505d60..d8c2cef 100644
+--- a/ext/wayland/wldisplay.h
++++ b/ext/wayland/wldisplay.h
+@@ -62,6 +62,10 @@ struct _GstWlDisplay
+   GMutex buffers_mutex;
+   GHashTable *buffers;
+   gboolean shutting_down;
++
++  struct wl_list input_list;
++  int seat_version;
++  uint32_t serial;
+ };
+ 
+ struct _GstWlDisplayClass
+diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
+index a964335..34ae385 100644
+--- a/ext/wayland/wlwindow.c
++++ b/ext/wayland/wlwindow.c
+@@ -111,6 +111,8 @@ gst_wl_window_new_internal (GstWlDisplay * display)
+ 
+   window->area_surface = wl_compositor_create_surface (display->compositor);
+   window->video_surface = wl_compositor_create_surface (display->compositor);
++  wl_surface_set_user_data (window->area_surface, window);
++  wl_surface_set_user_data (window->video_surface, window);
+ 
+   wl_proxy_set_queue ((struct wl_proxy *) window->area_surface, display->queue);
+   wl_proxy_set_queue ((struct wl_proxy *) window->video_surface,
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index 6dd3117..33291ee 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -21,9 +21,11 @@ DEPENDS_append_ti33x = " \
 "
 
 SRC_URI_append_ti43x = " \
+    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
 "
 
 SRC_URI_append_ti33x = " \
+    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -38,4 +40,4 @@ S = "${WORKDIR}/git"
 SRCREV_omap-a15 = "aec06528aca416c7b2c77db5b6dcb24907728ef7"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
-PR = "r22"
+PR = "r23"
-- 
1.9.1


