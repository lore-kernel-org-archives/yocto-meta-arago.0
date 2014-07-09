Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 949DC5298E
	for <meta-arago@arago-project.org>;
	Wed,  9 Jul 2014 18:08:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s69I8kLh020012
	for <meta-arago@arago-project.org>; Wed, 9 Jul 2014 13:08:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s69I8kHd011694
	for <meta-arago@arago-project.org>; Wed, 9 Jul 2014 13:08:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 9 Jul 2014 13:08:46 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s69I8jb9031579;	Wed, 9 Jul 2014 13:08:46 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s69I8h8D013407;	Wed, 9 Jul 2014 23:38:43 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 9 Jul 2014 13:08:40 -0500
Message-ID: <1404929320-10398-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] ptpd: Remove recipe from layer
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
X-List-Received-Date: Wed, 09 Jul 2014 18:08:47 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Version 2.3.0 has been pushed to meta-oe daisy.
* Local recipe no longer needed

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-daemons/ptpd/ptpd_2.3.0.bb             |   30 --------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb

diff --git a/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb b/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
deleted file mode 100644
index c54f507..0000000
--- a/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "The PTP daemon (PTPd)"
-DESCRIPTION = "The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as \
-defined by the relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \
-and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise \
-time coordination of LAN connected computers."
-HOMEPAGE = "http://sourceforge.net/projects/ptpd"
-SECTION = "network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"
-
-DEPENDS = "libpcap"
-
-PR = "r0"
-
-inherit autotools
-
-SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "f5e931b4a229705ff0dbdfe22490566b"
-SRC_URI[sha256sum] = "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
-
-S = "${WORKDIR}/ptpd-${PV}"
-
-EXTRA_OEMAKE = ""
-
-do_install() {
-    install -d ${D}${bindir} ${D}${mandir}/man8
-    install -m 0755 ${S}/src/ptpd2 ${D}${bindir}
-    install -m 0644 ${S}/src/ptpd2.8 ${D}${mandir}/man8
-}
-- 
1.7.9.5


