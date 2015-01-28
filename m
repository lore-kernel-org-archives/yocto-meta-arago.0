Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 0FB3252B39
	for <meta-arago@arago-project.org>;
	Wed, 28 Jan 2015 01:33:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIV00MW25MO8UA0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 27 Jan 2015 19:32:49 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Kc1larcG c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=6lOFTim3ljhF90GePSsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BA0A4200DD;	Tue,
	27 Jan 2015 20:32:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 27 Jan 2015 20:32:48 -0500
Message-id: <1422408768-26587-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gst-plugins-*-mm-accel: sync up on customizations between gst plugins
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
X-List-Received-Date: Wed, 28 Jan 2015 01:33:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend          | 9 +++++++++
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend         | 6 ++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
new file mode 100644
index 0000000..e6d72ba
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
@@ -0,0 +1,9 @@
+PR_append = "-arago0"
+
+PACKAGECONFIG = "bzip curl faad"
+
+# Disable features that have potential commercial licensing restrictions
+EXTRA_OECONF += "\
+    --disable-mpeg2enc \
+    --disable-acm \
+"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
new file mode 100644
index 0000000..4cb0608
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
@@ -0,0 +1,6 @@
+PR_append = "-arago0"
+
+DEPENDS := "${@oe_filter_out('gconf','${DEPENDS}', d)}"
+DEPENDS := "${@oe_filter_out('gconf-native','${DEPENDS}', d)}"
+
+EXTRA_OECONF += "--disable-gconftool --disable-gconf"
-- 
2.2.0


