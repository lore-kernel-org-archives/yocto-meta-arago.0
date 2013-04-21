Return-Path: <eyalr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 26E5B52A1F
	for <meta-arago@arago-project.org>;
	Sun, 21 Apr 2013 06:27:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3L6RFN7022217
	for <meta-arago@arago-project.org>; Sun, 21 Apr 2013 01:27:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3L6RF49021120
	for <meta-arago@arago-project.org>; Sun, 21 Apr 2013 01:27:15 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 21 Apr 2013 01:27:14 -0500
Received: from user-VirtualBox.emea.dhcp.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r3L6RB5F005053;	Sun, 21 Apr 2013 01:27:13 -0500
From: Eyal Reizer <eyalr@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 21 Apr 2013 09:08:55 +0300
Message-ID: <1366524535-13207-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Sun, 21 Apr 2013 06:27:19 -0000
Content-Type: text/plain

Add a recipe for building and installing the wlconf configuration utility
for TI Wilink8 family of chips.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
Changes in v2:
* Rename to use an actual release name instead of _git
* Line indentation fixes
Changes in v3:
* Drop the PV assignment

 .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
new file mode 100644
index 0000000..ade2e84
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Configuration utility for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
+
+PR ="r1"
+PR_append = "+gitr${SRCREV}"
+
+SRCREV = "ol_r8.a6.01"
+SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
+
+S = "${WORKDIR}/git/wlconf"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${bindir}/wlconf/
+	install -d ${D}${bindir}/wlconf/official_inis
+
+	install -m 0755 wlconf ${D}${bindir}/wlconf/
+	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
+	install -m 0755 struct.bin ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+	install -m 0755 README ${D}${bindir}/wlconf/
+	install -m 0755 example.conf ${D}${bindir}/wlconf/
+	install -m 0755 example.ini ${D}${bindir}/wlconf/
+	install -m 0755 ${S}/official_inis/*
+			${D}${bindir}/wlconf/official_inis/
+}
+
+FILES_${PN} += " \
+	${bindir}/wlconf \
+	${bindir}/wlconf/official_inis \
+"
+
+FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
-- 
1.7.9.5


