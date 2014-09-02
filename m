Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D125752AB8
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AtHmg019893
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AtHg7010385
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:16 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZJ026077;
	Tue, 2 Sep 2014 05:55:15 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:38 +0530
Message-ID: <1409655283-4899-8-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] Wl18xx : recipes update - tag changed to ol_r8.a9.14
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:18 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Changed git sources to git.ti.com
     - Updated to latest release.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb | 31 ----------------------
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb | 31 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
deleted file mode 100644
index 26faa6f..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
-
-DEPENDS = "libnl"
-RDEPENDS_${PN} = "wl18xx-firmware"
-
-PR ="r1+gitr${SRCPV}"
-
-#Tag: ol_r8.a8.10
-SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
-SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
-"
-
-PROVIDES += "ti-wifi-utils"
-RPROVIDES_${PN} += "ti-wifi-utils"
-RREPLACES_${PN} +=  "ti-wifi-utils"
-RCONFLICTS_${PN} +=  "ti-wifi-utils"
-
-S = "${WORKDIR}/git"
-
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-
-EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
-		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
-		NLVER=3'
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 calibrator ${D}${bindir}/
-}
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
new file mode 100644
index 0000000..f74c2f9
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+DEPENDS = "libnl"
+RDEPENDS_${PN} = "wl18xx-firmware"
+
+PR ="r2+gitr${SRCPV}"
+
+#Tag: ol_r8.a9.14
+SRCREV = "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
+SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
+"
+
+PROVIDES += "ti-wifi-utils"
+RPROVIDES_${PN} += "ti-wifi-utils"
+RREPLACES_${PN} +=  "ti-wifi-utils"
+RCONFLICTS_${PN} +=  "ti-wifi-utils"
+
+S = "${WORKDIR}/git"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
+		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
+		NLVER=3'
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 calibrator ${D}${bindir}/
+}
-- 
2.0.1


