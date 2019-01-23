Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 71DD3529EA
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4749B40AF5;
	Wed, 23 Jan 2019 04:52:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PwuFjuSCWQhy; Wed, 23 Jan 2019 04:52:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1274040AF7;
	Wed, 23 Jan 2019 04:52:13 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1D73D169B48;
	Tue, 22 Jan 2019 23:52:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:06 -0500
Message-Id: <1548219129-12459-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 6/9] gstreamer1.0-plugins-hevc: stop using -export-symbols-regex
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

The old regex is no longer correct for GStreamer 1.14.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...figure.ac-stop-using-export-symbols-regex.patch | 30 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-hevc_git.bb               |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
new file mode 100644
index 0000000..c9721b7
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
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
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index 741895f..7a95a06 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 
-SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=git"
+SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=git \
+	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
 SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


