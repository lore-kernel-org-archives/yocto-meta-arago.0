Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ABFA6529CB
	for <meta-arago@arago-project.org>;
	Mon, 23 May 2016 17:47:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4NHltMn029744
	for <meta-arago@arago-project.org>; Mon, 23 May 2016 12:47:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4NHltNV025427
	for <meta-arago@arago-project.org>; Mon, 23 May 2016 12:47:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 May 2016 12:47:55 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4NHlsqP012181;	Mon, 23 May 2016 12:47:54 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 May 2016 13:47:47 -0400
Message-ID: <1464025667-10619-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ipsecmgr: bump SRCREV for support on 4.4 kernel
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
X-List-Received-Date: Mon, 23 May 2016 17:47:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb | 2 +-
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc        | 4 ++--
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
index e7ad7bb..34d56f5 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://../../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7e
 
 include ipsecmgr.inc
 
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index b16b939..ae05db9 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 BRANCH="master"
 SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
-#Commit ID corresponding to DEV.IPSECMGR.01.01.00.04
-SRCREV = "a119a44ebf4816d2a921e56d4f8a176832eabfc4"
+
+SRCREV = "37d04f1103216f185eeaddc35d34320b2568d5de"
 PV     = "01.01.00.04+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
index 4d92acd..605e48f 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadc
 
 include ipsecmgr.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "libnl-xfrm"
 RDEPENDS_${PN} = "ipsecmgr-mod"
-- 
2.7.4


