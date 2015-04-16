Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ADF9952A79
	for <meta-arago@arago-project.org>;
	Thu, 16 Apr 2015 14:56:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3GEuQ23005432
	for <meta-arago@arago-project.org>; Thu, 16 Apr 2015 09:56:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3GEuPYx002428
	for <meta-arago@arago-project.org>; Thu, 16 Apr 2015 09:56:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Apr 2015 09:56:25 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3GEuOOs027972;
	Thu, 16 Apr 2015 09:56:24 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Apr 2015 20:26:19 +0530
Message-ID: <1429196179-7877-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: img-pvr-sdk: DRM based demos based IMG SDK
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
X-List-Received-Date: Thu, 16 Apr 2015 14:56:27 -0000
Content-Type: text/plain

* Also contains utilities for SGX performance measurement

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../imgpvrsdk/img-pvr-sdk_3.3.2.bb                 |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb

diff --git a/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
new file mode 100644
index 0000000..9387a74
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
+
+SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git"
+SRCREV = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
+
+PR = "r1"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so"
+
+FILES_${PN} += "/opt/img-powervr-sdk/Examples/Advanced/OGLES2ChameleonMan \
+                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Coverflow \
+                /opt/img-powervr-sdk/Examples/Advanced/OGLES2ExampleUI \
+                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Navigation \
+                /opt/img-powervr-sdk/PVRHub/* \
+                /opt/img-powervr-sdk/PVRScopeDeveloper/* \
+               "
-- 
1.7.9.5


