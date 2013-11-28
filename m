Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 628225298F
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:40:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBeu0c023841
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:56 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBeup9018238
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:56 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:40:56 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBes7t031963;	Thu, 28 Nov 2013 05:40:55 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:39:04 +0200
Message-ID: <1385638744-12180-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 14/14] crda: Removed 1.1.1 version.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:40:57 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Clean up unsupported version.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../recipes-connectivity/crda/crda_1.1.1.bb        |   37 --------------------
 1 files changed, 0 insertions(+), 37 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb

diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
deleted file mode 100644
index e3880a1..0000000
--- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Wireless Central Regulatory Domain Agent"
-HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
-SECTION = "base"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
-
-PR = "r0"
-
-DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
-RDEPENDS_${PN} = "udev"
-
-SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
-           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
-"
-
-CFLAGS += " -DCONFIG_LIBNL20"
-
-EXTRA_OEMAKE = "MAKEFLAGS="
-do_compile() {
-    oe_runmake all_noverify
-}
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-    install -d ${D}/usr/lib/crda/
-    install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
-}
-
-SRC_URI[crda.md5sum] = "5fc77af68b3e21736b8ef2f8b061c810"
-SRC_URI[crda.sha256sum] = "59b4760da44a8f803caeaaa7fb97e0c6bd3f35f40445b28258e7f14c2fbe13b5"
-SRC_URI[reg.md5sum] = "1535e98bcaba732e2f8e8f62dac6f369"
-SRC_URI[reg.sha256sum] = "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe01011a318b3dceaba33b"
-
-FILES_${PN} += "\
-    /lib/udev/rules.d/85-regulatory.rules \
-    /usr/lib/crda/regulatory.bin \
-"
-- 
1.7.9


