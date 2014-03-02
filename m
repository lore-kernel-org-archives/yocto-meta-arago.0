Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 235A85208C
	for <meta-arago@arago-project.org>;
	Sun,  2 Mar 2014 21:50:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s22LonZx020532
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 15:50:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s22LonMQ017003
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 15:50:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 2 Mar 2014 15:50:48 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s22LomBA010765;	Sun, 2 Mar 2014 15:50:48 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 2 Mar 2014 16:50:46 -0500
Message-ID: <1393797046-961-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v4] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Sun, 02 Mar 2014 21:50:50 -0000
Content-Type: text/plain

- linuxptp is an implementation of precision time protocol (PTP)

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous patch
* Removed dependency on kernel
* Added flags for CLOCKADJTIME & ONESTEPSYNC
---
---
 .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb

diff --git a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
new file mode 100755
index 0000000..0a36631
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "This software is an implementation of the Precision Time Protocol (PTP) \
+according to IEEE standard 1588 for Linux"
+HOMEPAGE = "http://linuxptp.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+PR = "r0"
+
+SRC_URI = "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-${PV}.tgz"
+SRC_URI[md5sum] = "664706a86fe1413391d4536080548501"
+SRC_URI[sha256sum] = "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad3085"
+
+inherit autotools 
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
+		EXTRA_CFLAGS=\"-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
+		-DHAVE_ONESTEP_SYNC\""
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
+}
+
-- 
1.7.9.5


