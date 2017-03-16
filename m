Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A9C8752A24
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 17:29:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GHTqb4031419
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 12:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489685392;
	bh=Y5wjYIw3up8OILG9Rwr0hkrHNMyr1AWwq0cXRKpDErU=;
	h=From:To:Subject:Date;
	b=Pxp/twaqim5UHBzsLGL1Snb7Pv9KJhHn964MHB0jnCoKMme31XK+z8FFmNaz6bKjL
	0R/OyvvmSCBFYqT3k1jA+jZf0RuXs8vJ1jsh29zkWmjd6n35AYc314XTzTuf22dmKA
	UD6m+/NQ6/vWuoM4RwbKUMHzVazA3A5NMBEiV5/4=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GHTq35010823
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 12:29:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 12:29:51 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2GHTp11013751	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 12:29:52 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Mar 2017 13:29:35 -0400
Message-ID: <1489685377-53666-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth][PATCH 1/3] gstreamer1.0-plugins-bad: kmssink: remove DCE dependencies
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
X-List-Received-Date: Thu, 16 Mar 2017 17:29:53 -0000
Content-Type: text/plain

- remove DCE dependencies from kmssink
- AM4(ti43x) shares the same branch as of AM5(omap-a15)

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0001-kmssink-remove-DCE-dependencies.patch     | 96 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  8 +-
 2 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
new file mode 100644
index 0000000..e050e08
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
@@ -0,0 +1,96 @@
+From 6b04eb39296caec717d310872c1f0acfa85c5ae7 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 15 Mar 2017 09:08:13 -0400
+Subject: [PATCH 1/2] kmssink: remove DCE dependencies
+
+Replace DCE related API calls to libdrm and omapdrm API calls
+to decouple DCE from kmssink
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ configure.ac         |  1 -
+ sys/kms/Makefile.am  |  2 --
+ sys/kms/gstkmssink.c | 17 +++++++++++++----
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2e0d1f3..2b1ecaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2119,7 +2119,6 @@ dnl *** kms ***
+ translit(dnm, m, l) AM_CONDITIONAL(USE_KMS, true)
+ AG_GST_CHECK_FEATURE(KMS, [kmssink], kms, [
+   PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=yes, HAVE_KMS=no)
+-  PKG_CHECK_MODULES(LIBDCE, [libdce >= 1.0.0], HAVE_KMS=yes, HAVE_KMS=no)
+   AC_SUBST(DRM_CFLAGS)
+   AC_SUBST(DRM_LIBS)
+ ])
+diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am
+index 6d56073..cc7353e 100644
+--- a/sys/kms/Makefile.am
++++ b/sys/kms/Makefile.am
+@@ -9,7 +9,6 @@ libgstkmssink_la_CFLAGS = \
+ 	$(GST_PLUGINS_BAD_CFLAGS) \
+ 	$(GST_PLUGINS_BASE_CFLAGS) \
+ 	$(GST_BASE_CFLAGS) \
+-	$(LIBDCE_CFLAGS) \
+ 	$(GST_CFLAGS) \
+ 	$(DRM_CFLAGS)
+ 
+@@ -17,7 +16,6 @@ libgstkmssink_la_LIBADD = \
+ 	$(GST_PLUGINS_BASE_LIBS) \
+ 	$(GST_BASE_LIBS) \
+ 	$(GST_LIBS) \
+-	$(LIBDCE_LIBS) \
+ 	$(DRM_LIBS) \
+ 	-lgstvideo-$(GST_API_VERSION) \
+ 	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la
+diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
+index 17e6407..9795bdf 100644
+--- a/sys/kms/gstkmssink.c
++++ b/sys/kms/gstkmssink.c
+@@ -31,7 +31,6 @@
+ #include "gstkmssink.h"
+ #include "gstkmsbufferpriv.h"
+ 
+-#include <libdce.h>
+ #include <omap_drm.h>
+ #include <omap_drmif.h>
+ #include <xf86drmMode.h>
+@@ -516,13 +515,18 @@ gst_kms_sink_start (GstBaseSink * bsink)
+ 
+   sink = GST_KMS_SINK (bsink);
+ 
+-  drm_dev = dce_init ();
++  drm_fd = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
++  if(drm_fd == NULL)
++    goto drm_failed;
++  else {
++    drm_dev = omap_device_new(drm_fd);
++  }
++
+   if (drm_dev == NULL)
+     goto device_failed;
+   else {
++    sink->fd = drm_fd;
+     sink->dev = drm_dev;
+-    sink->fd = dce_get_fd ();
+-    drm_fd = dce_get_fd ();
+   }
+ 
+   sink->resources = drmModeGetResources (sink->fd);
+@@ -539,6 +543,11 @@ fail:
+   gst_kms_sink_reset (sink);
+   return FALSE;
+ 
++drm_failed:
++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
++      (NULL), ("drmOpen failed"));
++  goto fail;
++
+ device_failed:
+   GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
+       (NULL), ("omap_device_new failed"));
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index b5ccebf..2c903d4 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -8,7 +8,6 @@ PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland',
 PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 
 DEPENDS_append_omap-a15 = " \
-    libdce \
     libdrm \
 "
 
@@ -18,10 +17,14 @@ DEPENDS_append_ti43x = " \
 
 DEPENDS_append_ti33x = " \
     libdrm \
+"
+
+SRC_URI_append_omap-a15 = " \
+    file://0001-kmssink-remove-DCE-dependencies.patch \
 "
 
 SRC_URI_append_ti43x = " \
-    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
+    file://0001-kmssink-remove-DCE-dependencies.patch \
 "
 
 SRC_URI_append_ti33x = " \
@@ -38,6 +41,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
 S = "${WORKDIR}/git"
 
 SRCREV_omap-a15 = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
+SRCREV_ti43x = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
 PR = "r25"
-- 
1.9.1


