Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 76D1E52A92
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99Nx2dC000691
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nx2c6016434
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:59:02 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nx1aw025800	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:59:02 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0vjva013695	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:45 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vjo8013694	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:45 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:35 +0100
Message-ID: <1381366658-13630-9-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] ti-connectivity/wlconf: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:03 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release configuration utility for wilink8
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
      * OMAP5432x-xx-x1-xx

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf_r8.a7.02.bb |   39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb
new file mode 100644
index 0000000..214d05b
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Configuration utility for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
+
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+PR ="r1"
+PR_append = "+gitr${SRCPV}"
+
+# Tag: ol_r8.a7.02
+SRCREV = "badbb7ecb70971857e4863c792a40e91f4f0a985"
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
+	install -m 0755 ${S}/official_inis/* \
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


