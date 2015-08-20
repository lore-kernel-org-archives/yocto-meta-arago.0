Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 23B7752A14
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2015 00:36:12 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC003SBUZNAV50@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 19 Aug 2015 19:35:53 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=NLkSMJGGaBqm5tL1Gr0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3B394161B83;	Wed,
	19 Aug 2015 20:35:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2015 20:35:36 -0400
Message-id: <1440030941-20751-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1440030941-20751-1-git-send-email-denis@denix.org>
References: <1440030941-20751-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 3/8] Revert "HACK: disable multimedia builds until IPC gets merged to 4.1"
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
X-List-Received-Date: Thu, 20 Aug 2015 00:36:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 9d2a9d9592d72549cb8027f8f9a24c64a997e845.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb           | 4 ++--
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb              | 4 +---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb           | 7 ++-----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index abb8175..ff71236 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -35,8 +35,8 @@ GST_1X_DEPS_append_dra7xx = " \
 GST_PLUGINS_PREFIX = "${@base_conditional('GST_PROVIDER', '0.10', 'gst-plugins', 'gstreamer1.0-plugins', d)}"
 
 GSTREAMER_ACCEL_MM = ""
-#GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "${GST_PLUGINS_PREFIX}-ducati", '', d)}"
-#GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " ${GST_PLUGINS_PREFIX}-vpe", '', d)}"
+GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "${GST_PLUGINS_PREFIX}-ducati", '', d)}"
+GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " ${GST_PLUGINS_PREFIX}-vpe", '', d)}"
 
 RDEPENDS_${PN} = "\
     ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 773ca5a..e803acd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -13,9 +13,7 @@ MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder-staticdev \
 "
 
-# Disable due to missing IPC in 4.1
-#    packagegroup-arago-gst-sdk-target
-
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
+    packagegroup-arago-gst-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 22dbae5..7f9cb90 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -56,11 +56,8 @@ ACCEL_FW_append_dra7xx-evm = " \
     vis \
     "
 
-
-# Disable for now, until IPC gets merged to 4.1 kernel
-#    packagegroup-arago-gst
-#    ${ACCEL_FW}
-
 RDEPENDS_${PN} = "\
+    packagegroup-arago-gst \
     ${MULTIMEDIA} \
+    ${ACCEL_FW} \
 "
-- 
2.2.0


