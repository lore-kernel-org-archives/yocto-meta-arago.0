Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1C02452A81
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 23:37:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QNbaC9023699
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 17:37:36 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QNbaVX005003
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 17:37:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 17:37:36 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1QNbZYA029685	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 17:37:35 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Feb 2016 18:37:32 -0500
Message-ID: <1456529852-23308-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer-plugins-bad: Enable waylandsink plus mouse movement support for AM3/AM4
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
X-List-Received-Date: Fri, 26 Feb 2016 23:37:38 -0000
Content-Type: text/plain

- Enable and pickup waylandsink support from upstream version 1.2.3 for AM3/4
- Add the mouse movement patch implemented by Pooja Prajod <a0132412@ti.com>

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-mouse-movement-for-videos-on-waylandsink.patch | 404 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |  16 +-
 2 files changed, 418 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
new file mode 100644
index 0000000..06d28bc
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
@@ -0,0 +1,404 @@
+From 90fafb6ea39940161f3bf86ab7f557197ff389ff Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Fri, 26 Feb 2016 16:46:39 -0500
+Subject: [PATCH] Enable mouse movement for videos on waylandsink
+
+This patch enables grab, drag and ungrab of videos
+that are being played on waylandsink.
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ ext/wayland/gstwaylandsink.c | 283 +++++++++++++++++++++++++++++++++++++++++++
+ ext/wayland/gstwaylandsink.h |  26 ++++
+ 2 files changed, 309 insertions(+)
+
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index cabf310..7394a2b 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -41,6 +41,7 @@
+ #endif
+ 
+ #include "gstwaylandsink.h"
++#include <linux/input.h>
+ 
+ /* signals */
+ enum
+@@ -100,6 +101,9 @@ static void create_window (GstWaylandSink * sink, struct display *display,
+     int width, int height);
+ static void shm_pool_destroy (struct shm_pool *pool);
+ 
++static void input_grab (struct input *input, struct window *window);
++static void input_ungrab (struct input *input);
++
+ typedef struct
+ {
+   uint32_t wl_format;
+@@ -225,6 +229,54 @@ gst_wayland_sink_set_property (GObject * object,
+ }
+ 
+ static void
++input_grab (struct input *input, struct window *window)
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
++  struct window *window = input->pointer_focus;
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
++display_destroy_inputs (struct display *display)
++{
++  struct input *tmp;
++  struct input *input;
++
++  wl_list_for_each_safe (input, tmp, &display->input_list, link)
++      input_destroy (input);
++}
++
++static void
+ destroy_display (struct display *display)
+ {
+   if (display->shm)
+@@ -236,6 +288,7 @@ destroy_display (struct display *display)
+   if (display->compositor)
+     wl_compositor_destroy (display->compositor);
+ 
++  display_destroy_inputs (display);
+   wl_display_flush (display->display);
+   wl_display_disconnect (display->display);
+   free (display);
+@@ -318,6 +371,229 @@ struct wl_shm_listener shm_listenter = {
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
++  struct window *window = input->pointer_focus;
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
++display_add_input (struct display *d, uint32_t id)
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
+@@ -332,6 +608,9 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   } else if (strcmp (interface, "wl_shm") == 0) {
+     d->shm = wl_registry_bind (registry, id, &wl_shm_interface, 1);
+     wl_shm_add_listener (d->shm, &shm_listenter, d);
++  } else if (strcmp (interface, "wl_seat") == 0) {
++    d->seat_version = version;
++    display_add_input (d, id);
+   }
+ }
+ 
+@@ -352,6 +631,8 @@ create_display (void)
+     return NULL;
+   }
+ 
++  wl_list_init (&display->input_list);
++
+   display->registry = wl_display_get_registry (display->display);
+   wl_registry_add_listener (display->registry, &registry_listener, display);
+ 
+@@ -491,6 +772,8 @@ create_window (GstWaylandSink * sink, struct display *display, int width,
+ 
+   window->surface = wl_compositor_create_surface (display->compositor);
+ 
++  wl_surface_set_user_data (window->surface, window);
++
+   window->shell_surface = wl_shell_get_shell_surface (display->shell,
+       window->surface);
+ 
+diff --git a/ext/wayland/gstwaylandsink.h b/ext/wayland/gstwaylandsink.h
+index cb3383e..f7d30dc 100644
+--- a/ext/wayland/gstwaylandsink.h
++++ b/ext/wayland/gstwaylandsink.h
+@@ -55,6 +55,27 @@
+ #define GST_WAYLAND_SINK_GET_CLASS(inst) \
+         (G_TYPE_INSTANCE_GET_CLASS ((inst), GST_TYPE_WAYLAND_SINK, GstWaylandSinkClass))
+ 
++struct touch_point
++{
++  int32_t id;
++  struct wl_list link;
++};
++
++struct input
++{
++  struct display *display;
++  struct wl_seat *seat;
++  struct wl_pointer *pointer;
++  struct wl_touch *touch;
++  struct wl_list touch_point_list;
++  struct window *pointer_focus;
++  struct window *touch_focus;
++  struct wl_list link;
++  struct window *grab;
++
++};
++
++
+ struct  display
+ {
+   struct wl_display *display;
+@@ -63,6 +84,11 @@ struct  display
+   struct wl_shell *shell;
+   struct wl_shm *shm;
+   uint32_t formats;
++
++  struct wl_list input_list;
++  int seat_version;
++  uint32_t serial;
++
+ };
+ 
+ struct window
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index 831b8ac..355d4ad 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -3,6 +3,16 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PACKAGECONFIG = "faad"
 
 PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti43x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti33x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+
+SRC_URI_append_ti43x = " \
+        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
+"
+
+SRC_URI_append_ti33x = " \
+        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
+"
 
 DEPENDS_append_omap-a15 = " \
     libdce \
@@ -16,7 +26,9 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "12b0d2ac50aba19da53d2e1ac40d6ada70a79930"
+SRCREV = "12b0d2ac50aba19da53d2e1ac40d6ada70a79930"
+SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
+SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 
-PR_append = "-arago5"
+PR_append = "-arago6"
 
-- 
1.9.1


