Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 46CCC52A26
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AtPFG009473
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AtPLf010446
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:24 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZN026077;
	Tue, 2 Sep 2014 05:55:23 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:42 +0530
Message-ID: <1409655283-4899-12-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] wl18xx-wlconf: version update
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:26 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Update to latest version tag - ol_r8.a9.14
    - move to git.ti.com

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf_r8.a8.10.bb | 41 ---------------------
 .../recipes-connectivity/wlconf/wlconf_r8.a9.14.bb | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 41 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
deleted file mode 100644
index 5f50e88..0000000
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Configuration utility for TI wireless drivers"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
-
-PR ="r1"
-PR_append = "+gitr${SRCPV}"
-
-# Tag: ol_r8.a8.10
-SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
-SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
-
-S = "${WORKDIR}/git/wlconf"
-
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/wlconf/
-	install -d ${D}${bindir}/wlconf/official_inis
-	install -d ${D}/lib/firmware/ti-connectivity
-
-	install -m 0755 wlconf ${D}${bindir}/wlconf/
-	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
-	install -m 0755 struct.bin ${D}${bindir}/wlconf/
-	install -m 0755 default.conf ${D}${bindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
-	install -m 0755 README ${D}${bindir}/wlconf/
-	install -m 0755 example.conf ${D}${bindir}/wlconf/
-	install -m 0755 example.ini ${D}${bindir}/wlconf/
-	install -m 0755 ${S}/official_inis/* \
-			${D}${bindir}/wlconf/official_inis/
-}
-
-FILES_${PN} += " \
-	${bindir}/wlconf \
-	${bindir}/wlconf/official_inis \
-	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
-"
-
-FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
new file mode 100644
index 0000000..02af7f6
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Configuration utility for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
+
+PR ="r2"
+PR_append = "+gitr${SRCPV}"
+
+# Tag: ol_r8.a9.14
+SRCREV = "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
+SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+
+S = "${WORKDIR}/git/wlconf"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${bindir}/wlconf/
+	install -d ${D}${bindir}/wlconf/official_inis
+	install -d ${D}/lib/firmware/ti-connectivity
+
+	install -m 0755 wlconf ${D}${bindir}/wlconf/
+	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
+	install -m 0755 struct.bin ${D}${bindir}/wlconf/
+	install -m 0755 default.conf ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
+	install -m 0755 README ${D}${bindir}/wlconf/
+	install -m 0755 example.conf ${D}${bindir}/wlconf/
+	install -m 0755 example.ini ${D}${bindir}/wlconf/
+	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
+	install -m 0755 ${S}/official_inis/* \
+			${D}${bindir}/wlconf/official_inis/
+}
+
+FILES_${PN} += " \
+	${bindir}/wlconf \
+	${bindir}/wlconf/official_inis \
+	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
+"
+
+FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
-- 
2.0.1


