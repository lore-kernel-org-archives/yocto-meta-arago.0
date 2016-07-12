Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id EA29A529DB
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 20:31:34 +0000 (UTC)
Received: from vz-proxy-m003.mx.aol.com ([64.236.83.2])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA700KERYBH8F00@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Jul 2016 15:30:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=EDCZS3Slg7tGr17y9w9vtg==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=HykXX59mIMhSlo1aw0cA:9
Received: by 100.15.86.14 with SMTP id 7ebb0a97; Tue, 12 Jul 2016 20:30:59 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 8F3A21620AC;	Tue, 12 Jul 2016 16:30:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Jul 2016 16:30:52 -0400
Message-id: <1468355452-18244-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1468355452-18244-1-git-send-email-denis@denix.org>
References: <1468355452-18244-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] Revert "gstreamer1.0: Switch to GST 1.6.3"
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
X-List-Received-Date: Tue, 12 Jul 2016 20:31:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 392b48b5ae75403d119d4a5eaa16f8c09f3d67e9.
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc             | 8 --------
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb          | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a67aaf0..cc481cb 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -66,11 +66,3 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
-
-PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
-
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 161430c..d34051e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -27,7 +27,7 @@ GSTREAMER_DEPS_append_keystone = " \
 
 GSTREAMER_ACCEL_MM = ""
 GSTREAMER_ACCEL_MM_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-#GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER_DEPS} \
-- 
2.7.4


