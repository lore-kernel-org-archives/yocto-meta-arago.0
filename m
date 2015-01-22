Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2B90152099
	for <meta-arago@arago-project.org>;
	Thu, 22 Jan 2015 05:07:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0M57s28024864
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 23:07:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0M57shX012647
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 23:07:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 23:07:54 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0M57sRk013338;	Wed, 21 Jan 2015 23:07:54 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 00:07:49 -0500
Message-ID: <1421903270-9115-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] libnl: Adding recipe for 3.2.22 from oe-core
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
X-List-Received-Date: Thu, 22 Jan 2015 05:07:56 -0000
Content-Type: text/plain

- Copied with intention to update to new version of libnl

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-support/libnl/libnl_3.2.22.bb          |   44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb

diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
new file mode 100644
index 0000000..a299bfb
--- /dev/null
+++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
@@ -0,0 +1,44 @@
+SUMMARY = "A library for applications dealing with netlink sockets"
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+SECTION = "libs/network"
+
+PE = "1"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
+           file://fix-pktloc_syntax_h-race.patch \
+           file://fix-pc-file.patch \
+           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
+           file://0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch \
+          "
+
+SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
+SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
+
+inherit autotools-brokensep pkgconfig
+
+FILES_${PN} = "${libdir}/libnl-3.so.* \
+               ${libdir}/libnl.so.* \
+               ${sysconfdir}"
+RREPLACES_${PN} = "libnl2"
+RCONFLICTS_${PN} = "libnl2"
+FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
+FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
+                    ${libdir}/libnl/cli/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
+
+PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
+FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
+                     ${libdir}/libnl/cli/*/*.so.* \
+                     ${sbindir}/nl-*"
+FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
+                     ${libdir}/libnl-genl.so.* \
+                     ${sbindir}/genl-ctrl-list"
+RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
+RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
1.7.9.5


