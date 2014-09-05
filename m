Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D1F3A52A88
	for <meta-arago@arago-project.org>;
	Fri,  5 Sep 2014 14:53:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s85Er1Z3003014
	for <meta-arago@arago-project.org>; Fri, 5 Sep 2014 09:53:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s85Er1pt012652
	for <meta-arago@arago-project.org>; Fri, 5 Sep 2014 09:53:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 5 Sep 2014 09:53:00 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s85EqpBw003986;
	Fri, 5 Sep 2014 09:52:59 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Sep 2014 20:22:47 +0530
Message-ID: <1409928767-11517-5-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409928767-11517-1-git-send-email-a0393906@ti.com>
References: <1409928767-11517-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master] [PATCH v2 4/4] weston: weston 1.3.0 for DRM backend
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
X-List-Received-Date: Fri, 05 Sep 2014 14:53:02 -0000
Content-Type: text/plain

On devices where the backend is chosen as DRM, as in the case
of dra7xx, there are some addition patches that are specific
to the omapdrm which are needed for basic functionality and
some bug fixes.

This will fully enable
* multiple display support
* Handle screensavers more efficient
* Be compatible with libgbm, TI adaptation of libgbm

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |  26 ++++++
 ...e-Include-option-to-search-in-include-drm.patch |  47 ++++++++++
 ...urce-prevent-input-disable-during-repaint.patch |  34 +++++++
 .../0005-temp-hack-to-enable-weston-1.3.patch      |  33 +++++++
 .../0006-weston-drm-Enable-multiple-displays.patch |  43 +++++++++
 .../recipes-graphics/wayland/weston/pattern.png    | Bin 0 -> 1846 bytes
 .../recipes-graphics/wayland/weston/profile        |   9 ++
 .../recipes-graphics/wayland/weston/terminal.png   | Bin 0 -> 1005 bytes
 .../recipes-graphics/wayland/weston_1.3.0.bb       |  98 +++++++++++++++++----
 9 files changed, 275 insertions(+), 15 deletions(-)
 create mode 100755 meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
 create mode 100755 meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/pattern.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/profile
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/terminal.png

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
new file mode 100755
index 0000000..cd0581a
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
@@ -0,0 +1,26 @@
+From 5f655cb89813e39d6410493b4725e447212ea3a3 Mon Sep 17 00:00:00 2001
+From: Mrinmayee Hingolikar <mrinmayee@ti.com>
+Date: Tue, 24 Sep 2013 19:13:50 +0530
+Subject: [PATCH] compositor-drm: Change path of gbm.h to gbm/gbm.h
+
+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
+---
+ src/compositor-drm.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index f055118..7a59872 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -35,7 +35,7 @@
+ #include <xf86drmMode.h>
+ #include <drm_fourcc.h>
+ 
+-#include <gbm.h>
++#include <gbm/gbm.h>
+ #include <libbacklight.h>
+ #include <libudev.h>
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
new file mode 100755
index 0000000..557373d
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
@@ -0,0 +1,47 @@
+From c8b6fe71ad0231c4787836f4156e604cedfe45a8 Mon Sep 17 00:00:00 2001
+From: Mrinmayee Hingolikar <mrinmayee@ti.com>
+Date: Thu, 3 Jul 2014 15:06:31 +0530
+Subject: [PATCH] Makefile change to search for correct drm headers
+
+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
+---
+ src/Makefile.am   | 3 ++-
+ tests/Makefile.am | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 749c074..a6e44e7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -2,6 +2,7 @@ bin_PROGRAMS = weston				\
+ 	$(weston_launch)
+ 
+ AM_CPPFLAGS =					\
++        $(DRM_COMPOSITOR_CFLAGS)                \
+ 	-I$(top_srcdir)/shared			\
+ 	-DDATADIR='"$(datadir)"'		\
+ 	-DMODULEDIR='"$(moduledir)"'		\
+@@ -9,7 +10,7 @@ AM_CPPFLAGS =					\
+ 	-DIN_WESTON
+ 
+ weston_LDFLAGS = -export-dynamic
+-weston_CFLAGS = $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS)
++weston_CFLAGS = $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS) 
+ weston_LDADD = $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
+ 	$(DLOPEN_LIBS) -lm ../shared/libshared.la
+ 
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 5be52c6..42ebd2b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -47,6 +47,7 @@ AM_CPPFLAGS =					\
+ 	-I$(top_srcdir)/shared			\
+ 	-I$(top_builddir)/src			\
+ 	-DUNIT_TEST				\
++	$(DRM_COMPOSITOR_CFLAGS)                \
+ 	$(COMPOSITOR_CFLAGS)
+ 
+ surface_global_test_la_SOURCES = surface-global-test.c
+-- 
+2.0.1
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
new file mode 100644
index 0000000..74e82fb
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
@@ -0,0 +1,34 @@
+From cdd9043580e0f0a6c60c21b955f1966c78b2098b Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Mon, 2 Dec 2013 15:52:41 +0530
+Subject: [PATCH] input source: prevent input disable during repaint
+
+Under certain race conditions, the input source was getting
+disabled which was preventing the evdev events from keyboard or
+mouse to reach Weston. The side effect of this issue was
+that after the screen gets locked, it was not possible to
+come to Weston desktop without killing Weston.
+
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ src/compositor.c |    4 ----
+ 1 files changed, 0 insertions(+), 4 deletions(-)
+
+diff --git a/src/compositor.c b/src/compositor.c
+index 0e0835f..ced3883 100644
+--- a/src/compositor.c
++++ b/src/compositor.c
+@@ -1084,10 +1084,6 @@ weston_output_schedule_repaint(struct weston_output *output)
+ 	wl_event_loop_add_idle(loop, idle_repaint, output);
+ 	output->repaint_scheduled = 1;
+ 
+-	if (compositor->input_loop_source) {
+-		wl_event_source_remove(compositor->input_loop_source);
+-		compositor->input_loop_source = NULL;
+-	}
+ }
+ 
+ WL_EXPORT void
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
new file mode 100644
index 0000000..0c860b3
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
@@ -0,0 +1,33 @@
+From 518fe5aea452a4660e07855716349a0c84e59b14 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Tue, 21 Jan 2014 11:48:19 +0000
+Subject: [PATCH] temp-hack: to enable weston 1.3
+
+This patch resolves the issue with the black display seen
+when running weston 1.3 version on the dra7xx target.
+
+Known issues:
+1. simple-egl application does not work
+2. weston on multiple displays does not work
+
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ src/compositor-drm.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index 0ac5efa..dd28f0f 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -616,7 +616,7 @@ drm_output_repaint(struct weston_output *output_base,
+ 			.request.sequence = 1,
+ 		};
+ 
+-		if ((!s->current && !s->next) ||
++		if ((!s->current && !s->next) &&
+ 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
+ 			continue;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
new file mode 100644
index 0000000..abc4295
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
@@ -0,0 +1,43 @@
+From dce69cadd858bd959dd41edf82860cd370ca1fa8 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Fri, 14 Mar 2014 18:55:12 +0530
+Subject: [PATCH] weston-drm: Enable multiple displays
+
+We are currently seeing an issue with missing VBlanks for LCD and
+HDMI connectors which leads to display not getting refreshed.
+This patch can be considered as a workaround.
+
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ src/compositor-drm.c |    8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index 79dcc6c..ef2fbd2 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -709,6 +709,7 @@ page_flip_handler(int fd, unsigned int frame,
+ {
+ 	struct drm_output *output = (struct drm_output *) data;
+ 	uint32_t msecs;
++	uint32_t bail;
+ 
+ 	/* We don't set page_flip_pending on start_repaint_loop, in that case
+ 	 * we just want to page flip to the current buffer to get an accurate
+@@ -721,7 +722,12 @@ page_flip_handler(int fd, unsigned int frame,
+ 
+ 	output->page_flip_pending = 0;
+ 
+-	if (!output->vblank_pending) {
++	if (output->vblank_pending) {
++		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
++		bail = 1;
++	}
++
++	if (!output->vblank_pending || bail) {
+ 		msecs = sec * 1000 + usec / 1000;
+ 		weston_output_finish_frame(&output->base, msecs);
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/pattern.png b/meta-arago-extras/recipes-graphics/wayland/weston/pattern.png
new file mode 100644
index 0000000000000000000000000000000000000000..5ac8986d6721b4c19794f1d24e513af7015aa395
GIT binary patch
literal 1846
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

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/profile b/meta-arago-extras/recipes-graphics/wayland/weston/profile
new file mode 100644
index 0000000..69564f2
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/profile
@@ -0,0 +1,9 @@
+if test -z "${XDG_RUNTIME_DIR}"; then
+    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
+    if ! test -d "${XDG_RUNTIME_DIR}"; then
+        mkdir "${XDG_RUNTIME_DIR}"
+        chmod 0700 "${XDG_RUNTIME_DIR}"
+    fi
+else 
+   echo "Doing nothing"
+fi
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/terminal.png b/meta-arago-extras/recipes-graphics/wayland/weston/terminal.png
new file mode 100644
index 0000000000000000000000000000000000000000..3c02dd2100aa31389ace70cbf649215a982674b2
GIT binary patch
literal 1005
zcmV<J0}}j+P)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00004b3#c}2nYxW
zd<bNS00009a7bBm000fw000fw0YWI7cmMzZ8FWQhbW?9;ba!ELWdL_~cP?peYja~^
zaAhuUa%Y?FJQ@H101k9TSaeirbZlh+RAq8)X>MU`)%&240000NbVXQnL3MO!Z*l-k
zVQ_CCLt$)TZDDR?a%E}Xks2xh001d;MObu1WpiV4X>fFDZ*BlWVRL0<Aa7<MN?~ht
zVjxp=Wod3@awl^jcW-iQC(|dH0008`Nkl<ZNQu3aJ#QRk6osGnV|J6^*!u-G4F<Ug
z73p`8V);klAd!Ls(I5)`1_h!-6i7fpD&z<uf-S*+NEDPHAt8hViDO&q-I;gh{kRnS
z;ay^&@P;$G(u_27&fIg)dzFarETNw%`~M+e0p5A{?XO~t+lwSN#@zh$lh3YOfEeTU
z`|o`~mSs<swRY~_7(<K^@BOqw2y@R>Rq@fsA8rFv0hCf)+uB;l-~X_;M~o2|Ta;2_
zlBOq*9!+1=TBDSr_j-@UN`pMldGPZC9_~M+exXjU+rv3Wzu#v#95NgZao&?sBBgY;
zz)E9<8*kmfImgbeTPOvqt7~YjP(~v_tJCJyD_6L@vW&470HrlbE8OAHoPZu#bShAJ
z&*xu$!E0Bqa{Kmopf!S!JICY42joS8HimZRd5WSSAD43l!#oE-M2PWk9Zb+{wdi%b
zbh};d+`Y@%i)&=H8UpwfXm#4GzqC%RUPD9(DG^g7N+OC-xRP1Ur!4XzaCm&o8*g66
z2T!Nn=43FS@}9$^Bed2mEiEw^4souaC>(j7PiHXcU`}AxqGq$n{{B7}FJ0m}qj_ax
zgLbn;?s5(epU`P{u(b>ku(cXljMUQw;+W7C?re*uGYB4wV3c5#;pO#p8jU8-72Laj
zA8if&lRm!klvPDpI*L4}sz&GG%nnkDGbw6}4wSW6W4QCvJrqz@6{|0-l4TjuXcCYy
z`o`Fd7y=;#PLBIyfthnKYmxUAGIN~_1{h;7#!&hSS32T2hA~EB3{&#p{eP$E^71m7
zwU{i!&a4M*G+OIvLQ)(FOo*fR_z?K>_dotUMP*r%M6iIU)3RE@*pehdNRbc&A&mEt
z_xP&%rx~0I{PxSQoELKfN-4Fubq#=Tc6QE9J`tFmL6%ZtcW;->W(yJUVYKj+QpN(c
zs;qw8-TQuXA?#y_$hUx1z(rsK*aQrq&dUvW;A`MOjY(@jeF5YXB%lC-5)qVAYJubv
bh=|Bv8b1-Z;i*mk00000NkvXXu0mjftX;i`

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
index eb38ce1..c34b35e 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
@@ -5,28 +5,45 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
                     file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "git://anongit.freedesktop.org/wayland/weston;protocol=git \
            file://weston.png \
-           file://weston.desktop"
-SRC_URI[md5sum] = "29ad994dd5ea07f52d7bffb24c25d9f7"
-SRC_URI[sha256sum] = "8e4f5b4736358b63d83c3252567ba7aa49cc0da9e2e2c30f59ddf635159702a0"
+           file://weston.desktop \
+           file://terminal.png \
+           file://pattern.png \
+           file://profile \
+           file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch \
+           file://0002-Makefile-Include-option-to-search-in-include-drm.patch \
+	   file://0003-input-source-prevent-input-disable-during-repaint.patch \
+	   file://0005-temp-hack-to-enable-weston-1.3.patch \
+	   file://0006-weston-drm-Enable-multiple-displays.patch "
+          
 
+SRCREV = "95659c03219b057d9d703b04cf89bc0329ce947a" 
+
+S = "${WORKDIR}/git"
+
+PR = "r1"
 
 inherit autotools pkgconfig useradd
 
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/mesa virtual/egl pango"
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg mtdev libpam"
+DEPENDS += "wayland libgbm omap5-sgx-ddk-um-linux pango"
 
-EXTRA_OECONF = "--enable-setuid-install \
+COMPATIBLE_MACHINE = "dra7xx-evm"
+
+EXTRA_OECONF = "--disable-android-compositor \
+                 --disable-simple-egl-clients \
+                 --enable-fbdev-compositor \
+                --enable-setuid-install \
                 --disable-tablet-shell \
                 --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
-                --enable-demo-clients \
-                --disable-simple-egl-clients \
                 --disable-libunwind \
                 --disable-rpi-compositor \
-                --disable-rdp-compositor"
+                --disable-rdp-compositor \
+                --prefix=${STAGING_DIR_TARGET} \
+                --with-libtool-sysroot=${STAGING_DIR_TARGET}"
 
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
@@ -38,9 +55,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,libgbm"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
@@ -49,8 +66,10 @@ PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compo
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
 # weston-launch
 PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
-# VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
+# Use cairo-gl or cairo-glesv2
+PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
+
+
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
@@ -66,15 +85,64 @@ do_install_append() {
 			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
                 fi
 	done
+        install ${WORKDIR}/terminal.png ${D}${datadir}/icons/hicolor/48x48/apps
+        install ${WORKDIR}/pattern.png ${D}${datadir}/icons/hicolor/48x48/apps
+
+        mkdir -p ${D}/usr/bin/weston-clients
+        cp ${S}/clients/weston-calibrator ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-clickdot ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-cliptest ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-dnd ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-editor ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-eventdemo ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-flower ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-fullscreen ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-image ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-keyboard ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-multi-resource ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-resizor ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-simple-egl ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-simple-im ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-simple-shm ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-simple-touch ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-smoke ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-subsurfaces ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-desktop-shell ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-info ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-screenshooter ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-tablet-shell ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-terminal ${D}/usr/bin/weston-clients/
+        cp ${S}/clients/weston-transformed ${D}/usr/bin/weston-clients/
+
+        mkdir -p ${D}/usr/libexec
+        cp ${S}/clients/weston-desktop-shell ${D}/usr/libexec/
+        cp ${S}/clients/weston-screenshooter ${D}/usr/libexec/
+        cp ${S}/clients/weston-tablet-shell ${D}/usr/libexec/
+
+	mkdir -p ${D}/home/root
+        mkdir -p ${D}/home/root/.config
+        cp ${S}/weston.ini ${D}/home/root/.config/
+        cp ${WORKDIR}/profile ${D}/home/root/.profile
+
+}
+
+do_configure() {
+	aclocal -I ${STAGING_DIR_TARGET}/usr/share/aclocal
+        ./autogen.sh --prefix=/usr --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --enable-weston-launch
 }
 
 PACKAGES += "${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir} ${libdir}/weston/* /home/root/.profile /home/root/.config/* /usr/libexec/weston-desktop-shell /usr/libexec/weston-screenshooter /usr/libexec/weston-tablet-shell" 
 FILES_${PN}-examples = "${bindir}/*"
 
+FILES_${PN}-dbg += "${bindir}/weston-clients/.debug"
+
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "liberation-fonts"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system weston-launch"
+
+INSANE_SKIP_weston += "dev-deps"
+
-- 
2.0.1


