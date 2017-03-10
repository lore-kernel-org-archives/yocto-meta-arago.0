Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 08C2E52960
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A969D20BBC;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bMQMS040FOQM; Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FB2E20BBD;
	Fri, 10 Mar 2017 21:10:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 32F1D1623B9;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:08 -0500
Message-Id: <1489180211-138519-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180211-138519-1-git-send-email-denis@denix.org>
References: <1489180211-138519-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/6] wlconf: moved to meta-ti, remove here
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf.bb          | 43 ----------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
deleted file mode 100644
index 625891c..0000000
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "Configuration utility for TI wireless drivers"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
-
-PV = "R8.6+git${SRCPV}"
-
-PR = "r5"
-
-# Tag: R8.6
-SRCREV = "cf8965aad73764022669647fa33852558a657930"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
-
-S = "${WORKDIR}/git/wlconf"
-
-EXTRA_OEMAKE = "CC="${CC}""
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
-	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
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
-- 
2.7.4


