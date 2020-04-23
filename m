Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2CD23529E5
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2020 23:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CE73D40C36;
	Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L7Mpt7mAl9xP; Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA66440A6E;
	Thu, 23 Apr 2020 23:57:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6850C172A04;
	Thu, 23 Apr 2020 19:57:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Apr 2020 19:57:15 -0400
Message-Id: <1587686239-6605-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/5] ufs-tool: was upstreamed to meta-openembedded/meta-filesystem
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
X-List-Received-Date: Thu, 23 Apr 2020 23:59:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb            |  2 +-
 meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb    | 20 --------------------
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 3e9bbf1..7b5db05 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -70,7 +70,7 @@ ARAGO_TI_TEST_append_am65xx = " \
 ARAGO_TI_TEST_append_j7 = " \
     viddec-test-app \
     videnc-test-app \
-    ufs-tool \
+    ufs-utils \
 "
 
 ARAGO_TI_TEST_append_keystone = " \
diff --git a/meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb b/meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb
deleted file mode 100644
index 3b780c8..0000000
--- a/meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Tool to access UFS device from user space"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PV = "1.3"
-
-BRANCH ?= "dev"
-
-SRCREV = "8b00e33003b57d7071943f63863fcf8cc48d5be9"
-
-SRC_URI = "git://github.com/westerndigitalcorporation/ufs-tool.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/ufs-tool ${D}${bindir}/
-}
-- 
2.7.4


