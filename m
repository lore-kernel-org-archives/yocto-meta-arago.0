Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9BF0452099
	for <meta-arago@arago-project.org>;
	Thu, 22 Jan 2015 05:07:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0M57uM1030590
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 23:07:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0M57u3H023517
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 23:07:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 23:07:56 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0M57sRl013338;	Wed, 21 Jan 2015 23:07:56 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 00:07:50 -0500
Message-ID: <1421903270-9115-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421903270-9115-1-git-send-email-sam.nelson@ti.com>
References: <1421903270-9115-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libnl: Update recipe from 3.2.22 to 3.2.24
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
X-List-Received-Date: Thu, 22 Jan 2015 05:07:57 -0000
Content-Type: text/plain

- removed old patches
- Updated autotools
- Added some private files to be installed to allow libnl extensions.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Planning to  send as similar patch to oe-core  as well.
Once accepted can be removed here
---
---
 .../libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb}     |   23 ++++++++++----------
 1 file changed, 12 insertions(+), 11 deletions(-)
 rename meta-arago-extras/recipes-support/libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb} (72%)

diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb b/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
similarity index 72%
rename from meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
rename to meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
index a299bfb..50a9cd9 100644
--- a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
+++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
@@ -9,17 +9,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-           file://fix-pktloc_syntax_h-race.patch \
-           file://fix-pc-file.patch \
-           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
-           file://0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch \
-          "
-
-SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
-SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
-
-inherit autotools-brokensep pkgconfig
+SRC_URI[md5sum] = "6e0e7bad0674749d930dd9f285343d55"
+SRC_URI[sha256sum] = "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a646e289a99dd6816"
+SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+#   Install private files to allow libnl extensions
+    install -d ${D}${includedir}/netlink-private
+    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-private/
+    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-private/
+}
 
 FILES_${PN} = "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
-- 
1.7.9.5


