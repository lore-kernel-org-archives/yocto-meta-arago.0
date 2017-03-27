Return-Path: <poojaprajod@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8B5305297D
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 13:16:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RDG3MN008614
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490620563;
	bh=VhnDg2ztq/x/4KSRcbyMvY0e9IPkxur4GiKH3NaE1FI=;
	h=From:To:CC:Subject:Date;
	b=h9BxTfDEkolqtA7SNhNxncpOQ6KIm9m4/oRKtyByZ2jUwpcDT5/hmOo68KHHs85yp
	uixgII1AejAos6xwUFDeYX8k+Wuj8/J6AHSgMm2UAygbSFWCnTl6cOmYSLFVPLBO2s
	ihUSIfYl6A3WWYDDM6Z5uIpaGfOSm4/Vy9HEN2Tw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDG2H0007913
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:16:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 08:16:02 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDG0pd009174;
	Mon, 27 Mar 2017 08:16:01 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 18:45:58 +0530
Message-ID: <1490620558-142842-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [morty] Update gst-bad for bug fix and bump PR
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
X-List-Received-Date: Mon, 27 Mar 2017 13:16:03 -0000
Content-Type: text/plain

Pick the patch:-
   0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 ...ink-Implement-callbacks-for-version-5-of-.patch | 65 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.8.3.bbappend        |  3 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch
new file mode 100644
index 0000000..d2091db
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch
@@ -0,0 +1,65 @@
+From adfc38273882a102d25fc420adc82b3f225588f9 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Mon, 27 Mar 2017 18:27:06 +0530
+Subject: [gst-bad] gstwaylandsink: Implement callbacks for version 5 of
+ wl_pointer
+
+Few extra callbacks are required for wl_pointer listener
+with the newer weston. Without the extra dummy callbacks
+the pipelines results in segfault.
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ ext/wayland/wldisplay.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/ext/wayland/wldisplay.c b/ext/wayland/wldisplay.c
+index 2f58fd2..54acfdb 100644
+--- a/ext/wayland/wldisplay.c
++++ b/ext/wayland/wldisplay.c
+@@ -326,12 +326,25 @@ pointer_handle_axis (void *data, struct wl_pointer *pointer,
+ {
+ }
+ 
++static void pointer_frame(void *data, struct wl_pointer *wl_pointer)
++{
++}
++static void pointer_axis_source(void *data, struct wl_pointer *wl_pointer, uint32_t axis_source)
++{
++}
++void pointer_axis_stop(void *data, struct wl_pointer *wl_pointer, uint32_t time, uint32_t axis)
++{
++}
++
+ static const struct wl_pointer_listener pointer_listener = {
+   pointer_handle_enter,
+   pointer_handle_leave,
+   pointer_handle_motion,
+   pointer_handle_button,
+   pointer_handle_axis,
++  pointer_frame,
++  pointer_axis_source,
++  pointer_axis_stop
+ };
+ 
+ static void
+@@ -508,8 +521,15 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   }
+ }
+ 
++static void
++registry_handle_global_remove(void *data, struct wl_registry *registry,
++                uint32_t name)
++{
++}
++
+ static const struct wl_registry_listener registry_listener = {
+-  registry_handle_global
++  registry_handle_global,
++  registry_handle_global_remove
+ };
+ 
+ static gpointer
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
index 5e099d5..3b61d2f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
@@ -33,8 +33,9 @@ SRC_URI_append_omap-a15 = " \
     file://0002-parsers-Pick-previos-bug-fixes-on-different-parsers.patch \
     file://0003-gstkmssink-Add-support-for-KMS-based-sink.patch \
     file://0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch \
+    file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r3"
+PR = "r4"
-- 
1.9.1


