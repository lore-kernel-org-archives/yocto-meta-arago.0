Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B90A3529CE
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 23:57:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BNv0iY024143
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 17:57:00 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BNv0la003146
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 17:57:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Feb 2014 17:56:59 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1BNuxkd016652;	Tue, 11 Feb 2014 17:56:59 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Feb 2014 18:56:58 -0500
Message-ID: <1392163018-32052-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 11 Feb 2014 23:57:03 -0000
Content-Type: text/plain

- linuxptp is an implementation of precision time protocol (PTP)

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous patch
* Removed redundant setting of STAGING_KERNEL_DIR
---
---
 .../recipes-bsp/linuxptp/linuxptp_1.0.bb           |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb

diff --git a/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
new file mode 100755
index 0000000..6d3d3a1
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
@@ -0,0 +1,24 @@
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
+EXTRA_OEMAKE = "KBUILD_OUTPUT=${STAGING_KERNEL_DIR} CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH}"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
+}
+
-- 
1.7.9.5


