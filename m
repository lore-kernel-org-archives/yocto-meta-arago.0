Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 03D09529D8
	for <meta-arago@arago-project.org>;
	Wed, 11 Jun 2014 14:00:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5BE0fuI030129
	for <meta-arago@arago-project.org>; Wed, 11 Jun 2014 09:00:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BE0fI0027346
	for <meta-arago@arago-project.org>; Wed, 11 Jun 2014 09:00:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 11 Jun 2014 09:00:40 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BE0YUg028627;
	Wed, 11 Jun 2014 09:00:39 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Jun 2014 09:00:32 -0500
Message-ID: <1402495232-30133-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1402495232-30133-1-git-send-email-fcooper@ti.com>
References: <1402495232-30133-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] ptpd: Add latest version of ptpd 2.3.0
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
X-List-Received-Date: Wed, 11 Jun 2014 14:00:42 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-daemons/ptpd/ptpd_2.3.0.bb             |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb

diff --git a/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb b/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
new file mode 100644
index 0000000..c54f507
--- /dev/null
+++ b/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "The PTP daemon (PTPd)"
+DESCRIPTION = "The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as \
+defined by the relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \
+and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise \
+time coordination of LAN connected computers."
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+SECTION = "network"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"
+
+DEPENDS = "libpcap"
+
+PR = "r0"
+
+inherit autotools
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f5e931b4a229705ff0dbdfe22490566b"
+SRC_URI[sha256sum] = "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
+
+S = "${WORKDIR}/ptpd-${PV}"
+
+EXTRA_OEMAKE = ""
+
+do_install() {
+    install -d ${D}${bindir} ${D}${mandir}/man8
+    install -m 0755 ${S}/src/ptpd2 ${D}${bindir}
+    install -m 0644 ${S}/src/ptpd2.8 ${D}${mandir}/man8
+}
-- 
1.7.0.4


