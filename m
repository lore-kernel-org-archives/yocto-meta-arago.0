Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8B46952A72
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 01:24:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1B1Oj8V028422
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2014 19:24:46 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1B1Oj8G003261
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2014 19:24:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 10 Feb 2014 19:24:45 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1B1Og2d004377;	Mon, 10 Feb 2014 19:24:43 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Feb 2014 20:24:39 -0500
Message-ID: <1392081879-10520-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 11 Feb 2014 01:24:46 -0000
Content-Type: text/plain

- linuxptp is an implementtation of precision time protocol (PTP)

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-bsp/linuxptp/linuxptp_1.0.bb           |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb

diff --git a/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
new file mode 100755
index 0000000..c7482aa
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "This software is an implementation of the Precision Time Protocol (PTP) \
+according to IEEE standard 1588 for Linux"
+HOMEPAGE = "http://linuxptp.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS += "virtual/kernel"
+PR = "r0"
+
+SRC_URI = "git://git.code.sf.net/p/linuxptp/code;protocol=git"
+
+SRCREV = "74e703727ec9b1c334c7bfbba9be1cabf4b7b461"
+
+S = "${WORKDIR}/git"
+
+inherit autotools 
+
+STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+EXTRA_OEMAKE = "KBUILD_OUTPUT=${STAGING_KERNEL_DIR} CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH}"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
+}
+
-- 
1.7.9.5


