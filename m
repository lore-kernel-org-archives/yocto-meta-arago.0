Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BB5B2529D7
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2019 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F50540B66;
	Fri, 25 Jan 2019 20:03:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mHWG2wL-7IBA; Fri, 25 Jan 2019 20:03:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1440E40301;
	Fri, 25 Jan 2019 20:03:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5E11B169B48;
	Fri, 25 Jan 2019 15:03:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2019 15:03:24 -0500
Message-Id: <1548446604-5460-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548446604-5460-1-git-send-email-denis@denix.org>
References: <1548446604-5460-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 3/3] gstreamer1.0-plugins-dsp66: stop using -export-symbols-regex
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
X-List-Received-Date: Fri, 25 Jan 2019 20:03:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

The old regex is no longer correct for GStreamer 1.14.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/branding-core.inc          |  2 +-
 ...figure.ac-stop-using-export-symbols-regex.patch | 30 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-dsp66_git.bb              |  5 ++--
 3 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 6a56f00..07cde67 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -17,7 +17,7 @@ ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
 
 # Temporarily disable "dsp" machine feature for all SOCs while building
-# latest code base, until it is fixed for gdbc6x, gstreamer-dsp66, qt-openvc-opencl
+# latest code base, until it is fixed for gdbc6x, qt-openvc-opencl
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('dsp', '')}"
 
 # Temporarily disable UBI images for K2 "server" rootfs due to size
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
new file mode 100644
index 0000000..c9721b7
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
@@ -0,0 +1,30 @@
+From 0fcda9d85c96d5c39dffe21d3bdf01a038b911c9 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 22 Jan 2019 20:39:15 -0500
+Subject: [PATCH] configure.ac: stop using -export-symbols-regex
+
+The old regex is no longer correct for GStreamer 1.14.
+
+Bug-Debian: https://bugs.debian.org/894642
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fee3161..8159c60 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -81,7 +81,7 @@ fi
+ AC_SUBST(plugindir)
+ 
+ dnl set proper LDFLAGS for plugins
+-GST_PLUGIN_LDFLAGS="-module -avoid-version -export-symbols-regex '^[_]*gst_plugin_desc\$\$' $GST_ALL_LDFLAGS"
++GST_PLUGIN_LDFLAGS="-module -avoid-version $GST_ALL_LDFLAGS"
+ AC_SUBST(GST_PLUGIN_LDFLAGS)
+ 
+ AC_CONFIG_FILES([Makefile src/Makefile])
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 2f5a962..6e28891 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
 SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master \
-file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch \
+	file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch \
+	file://0001-configure.ac-stop-using-export-symbols-regex.patch \
 "
 SRCREV = "0abedafadbed693592804f23482a9447d81b2dbf"
 
@@ -18,7 +19,7 @@ inherit autotools-brokensep pkgconfig gettext
 
 PR = "r1"
 
-RDEPENDS_${PN} += " opencl-runtime"
+RDEPENDS_${PN} += "opencl-runtime"
 
 EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
                  TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
-- 
2.7.4


