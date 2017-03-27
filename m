Return-Path: <poojaprajod@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 02942520C1
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 14:16:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2REGXmC002900
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 09:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490624193;
	bh=EMC2w4MR3bUzlv6J/Pt7KAVrH8T9KqzMNWBgsZIFUQ4=;
	h=From:To:CC:Subject:Date;
	b=hpcd24f7nfA6nav2tmviH4Hi+ZMnJRLS5rxuA6PTinkyxSEb+pzJleuf/pyGMDloQ
	CzDeLwmrpQNQRv0wWRWLdhi016o+rmRdeiQbmNvUCLHie4kKQMqTrJHywh9xGWMiLk
	UIHwz6lYL22k933VQ1eZIdY6w8iT21LudHc3jkw8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2REGXp4020244
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 09:16:33 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 09:16:32 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2REGVF1026327;
	Mon, 27 Mar 2017 09:16:32 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 19:46:29 +0530
Message-ID: <1490624189-70412-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [morty V2] Add bbappend for gst-base
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
X-List-Received-Date: Mon, 27 Mar 2017 14:16:34 -0000
Content-Type: text/plain

A hack patch : 0001-playbin-HACK-Change-default-value-of-flags.patch
needs to be added for low fps issue with playbin. Hence adding append file.

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 ...laybin-HACK-Change-default-value-of-flags.patch | 30 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.8.3.bbappend       |  6 +++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
new file mode 100644
index 0000000..16e7668
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
@@ -0,0 +1,30 @@
+From 436543acab9441ebb121da74b6433eae43bc8786 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Fri, 24 Mar 2017 18:24:15 +0530
+Subject: [gst-plugins-base] playbin HACK: Change default value of flags
+
+The deinterlace flag in playbin is causing
+high cpu load which in turn lowers fps of the playback.
+The behavior is not yet rootcaused. This is a workaround.
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ gst/playback/gstplaybin2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/playback/gstplaybin2.c b/gst/playback/gstplaybin2.c
+index ad63600..13439e3 100644
+--- a/gst/playback/gstplaybin2.c
++++ b/gst/playback/gstplaybin2.c
+@@ -524,7 +524,7 @@ struct _GstPlayBinClass
+ #define DEFAULT_SUBURI            NULL
+ #define DEFAULT_SOURCE            NULL
+ #define DEFAULT_FLAGS             GST_PLAY_FLAG_AUDIO | GST_PLAY_FLAG_VIDEO | GST_PLAY_FLAG_TEXT | \
+-                                  GST_PLAY_FLAG_SOFT_VOLUME | GST_PLAY_FLAG_DEINTERLACE | \
++                                  GST_PLAY_FLAG_SOFT_VOLUME | \
+                                   GST_PLAY_FLAG_SOFT_COLORBALANCE
+ #define DEFAULT_N_VIDEO           0
+ #define DEFAULT_CURRENT_VIDEO     -1
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
new file mode 100644
index 0000000..7cf6e3f
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " \
+    file://0001-playbin-HACK-Change-default-value-of-flags.patch \
+"
+PR = "r4"
-- 
1.9.1


