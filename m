Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 4FB145209D
	for <meta-arago@arago-project.org>;
	Mon, 27 Jun 2016 15:12:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RFCHVT008937
	for <meta-arago@arago-project.org>; Mon, 27 Jun 2016 10:12:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RFCHTR011452
	for <meta-arago@arago-project.org>; Mon, 27 Jun 2016 10:12:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Jun 2016 10:12:17 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5RFCDgp028296;	Mon, 27 Jun 2016 10:12:16 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Jun 2016 20:42:11 +0530
Message-ID: <1467040331-32223-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467040331-32223-1-git-send-email-a0393906@ti.com>
References: <1467040331-32223-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] gstreamer1.0: Switch to GST 1.6.3
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
X-List-Received-Date: Mon, 27 Jun 2016 15:12:17 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc             | 8 ++++++++
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb          | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index cc481cb..a67aaf0 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -66,3 +66,11 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
+
+PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
+
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index d34051e..161430c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -27,7 +27,7 @@ GSTREAMER_DEPS_append_keystone = " \
 
 GSTREAMER_ACCEL_MM = ""
 GSTREAMER_ACCEL_MM_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+#GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER_DEPS} \
-- 
1.9.1


