Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1D0EF52A20
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 18:33:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CIXpdG024573
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 12:33:51 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CIXpFZ023245
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 12:33:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Feb 2014 12:33:50 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1CIXodm022630;	Wed, 12 Feb 2014 12:33:50 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Feb 2014 13:33:49 -0500
Message-ID: <1392230029-12829-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Wed, 12 Feb 2014 18:33:52 -0000
Content-Type: text/plain

- OpenNTPD is a open source implementation of Network time protocol

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
* Moved to recipes-connectivity
* Removed redundant setting of STAGING_KERNEL_DIR
---
---
 .../openntpd/openntpd_3.9p1.bb                     |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb

diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
new file mode 100755
index 0000000..ca090e4
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
+Network Time Protocol."
+HOMEPAGE = "http://www.openntpd.org/"
+SECTION = "console/network"
+LICENSE = "BSD ISC"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
+
+DEPENDS += "virtual/kernel"
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
+CPPFLAGS = "-I${STAGING_KERNEL_DIR}/include"
+CPPFLAGS += "-I${STAGING_KERNEL_DIR}/arch/arm/include"
+
+EXTRA_OECONF += "CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}" \
+                 --with-privsep-user=root --with-privsep-path=/${prefix}"
+
+SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
+SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
-- 
1.7.9.5


