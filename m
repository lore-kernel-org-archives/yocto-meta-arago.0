Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3D9A55208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 04:07:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2447h32005621
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 22:07:43 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2447hU1009592
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 22:07:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 22:07:42 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s2447gFS019575;	Mon, 3 Mar 2014 22:07:42 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Mar 2014 23:07:41 -0500
Message-ID: <1393906061-15381-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v4] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Tue, 04 Mar 2014 04:07:44 -0000
Content-Type: text/plain

- OpenNTPD is a open source implementation of Network time protocol

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes in patch V4
- Removed unused CFLAGS TI_ADD_SUPPORT_HW_TIMESTAMPING

Changes patch v3
* Remove kernel dependency
* removed Flags depending on staging  kernel
---
---
 .../openntpd/openntpd_3.9p1.bb                     |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb

diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
new file mode 100755
index 0000000..ba8a9d3
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
@@ -0,0 +1,21 @@
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
+EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
+                 --with-privsep-user=root --with-privsep-path=/${prefix}"
+
+SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
+SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
-- 
1.7.9.5


