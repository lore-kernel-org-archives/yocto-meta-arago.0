Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B8B075208C
	for <meta-arago@arago-project.org>;
	Sun,  2 Mar 2014 22:03:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s22M3Z1f011505
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 16:03:35 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s22M3ZCs003577
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 16:03:35 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 2 Mar 2014 16:03:34 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s22M3YOT023697;	Sun, 2 Mar 2014 16:03:34 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 2 Mar 2014 17:03:33 -0500
Message-ID: <1393797813-21978-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Sun, 02 Mar 2014 22:03:36 -0000
Content-Type: text/plain

- OpenNTPD is a open source implementation of Network time protocol

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
* Remove kernel dependency
* removed Flags depending on staging  kernel
---
---
 .../openntpd/openntpd_3.9p1.bb                     |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb

diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
new file mode 100755
index 0000000..9b5e6ce
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
+Network Time Protocol."
+HOMEPAGE = "http://www.openntpd.org/"
+SECTION = "console/network"
+LICENSE = "BSD ISC"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
+
+PR = "r0"
+
+SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
+
+S = "${WORKDIR}/openntpd-${PV}"
+EXTRA_OECONF = "--disable-strip"
+inherit autotools
+
+LDFLAGS += "-lrt"
+CFLAGS += "-DTI_ADD_SUPPORT_HW_TIMESTAMPING"
+EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
+                 --with-privsep-user=root --with-privsep-path=/${prefix}"
+
+SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
+SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
-- 
1.7.9.5


