Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id D749652A4E
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2015 16:03:32 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSB000UN5XB98G0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jul 2015 11:03:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=rNF7Lmfm46gEe9FGipwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D14A1161B23;	Thu,
	30 Jul 2015 12:03:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jul 2015 12:03:08 -0400
Message-id: <1438272191-15395-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438272191-15395-1-git-send-email-denis@denix.org>
References: <1438272191-15395-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] HACK: disable multimedia builds until IPC gets merged to 4.1
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
X-List-Received-Date: Thu, 30 Jul 2015 16:03:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb            | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb | 4 +++-
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb            | 6 ++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 4e33cc9..b112f94 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -31,8 +31,8 @@ GST_1X_DEPS = " \
 GST_PLUGINS_PREFIX = "${@base_conditional('GST_PROVIDER', '0.10', 'gst-plugins', 'gstreamer1.0-plugins', d)}"
 
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "${GST_PLUGINS_PREFIX}-ducati", '', d)}"
-GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " ${GST_PLUGINS_PREFIX}-vpe", '', d)}"
+#GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "${GST_PLUGINS_PREFIX}-ducati", '', d)}"
+#GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " ${GST_PLUGINS_PREFIX}-vpe", '', d)}"
 
 RDEPENDS_${PN} = "\
     ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index c5d3c9e..08c1c2d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -4,6 +4,8 @@ PR = "r3"
 
 inherit packagegroup
 
+# Disable due to missing IPC in 4.1
+#    packagegroup-arago-gst-sdk-target
+
 RDEPENDS_${PN} = "\
-    packagegroup-arago-gst-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 9d5ddc3..ae28081 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -53,8 +53,10 @@ ACCEL_FW_append_dra7xx-evm = " \
     "
 
 
+# Disable for now, until IPC gets merged to 4.1 kernel
+#    packagegroup-arago-gst
+#    ${ACCEL_FW}
+
 RDEPENDS_${PN} = "\
-    packagegroup-arago-gst \
     ${MULTIMEDIA} \
-    ${ACCEL_FW} \
 "
-- 
2.2.0


