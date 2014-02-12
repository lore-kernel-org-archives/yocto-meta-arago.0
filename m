Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0EA1D52A14
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 18:26:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CIQ6mw030655
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 12:26:06 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CIQ6X6016172
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 12:26:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Feb 2014 12:26:06 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1CIQ5GA016572;	Wed, 12 Feb 2014 12:26:06 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Feb 2014 13:26:04 -0500
Message-ID: <1392229564-8938-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Wed, 12 Feb 2014 18:26:07 -0000
Content-Type: text/plain

- linuxptp is an implementation of precision time protocol (PTP)

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous patch
* Moved to recipes-connectivity directory
* Updated to use tarball from release
* Rename recipe to 1.3 version
* Added SRC_URI checksum
---
---
 .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb

diff --git a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
new file mode 100755
index 0000000..33ddb06
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "This software is an implementation of the Precision Time Protocol (PTP) \
+according to IEEE standard 1588 for Linux"
+HOMEPAGE = "http://linuxptp.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS += "virtual/kernel"
+PR = "r0"
+
+SRC_URI = "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-${PV}.tgz"
+SRC_URI[md5sum] = "664706a86fe1413391d4536080548501"
+SRC_URI[sha256sum] = "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad3085"
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


