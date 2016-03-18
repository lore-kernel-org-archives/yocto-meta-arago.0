Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8824552A5A
	for <meta-arago@arago-project.org>;
	Fri, 18 Mar 2016 12:23:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2ICNHwd014908
	for <meta-arago@arago-project.org>; Fri, 18 Mar 2016 07:23:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2ICNGhG031837
	for <meta-arago@arago-project.org>; Fri, 18 Mar 2016 07:23:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Mar 2016 07:23:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2ICNGhh008106;
	Fri, 18 Mar 2016 07:23:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1agtQx-00065o-Un; Fri, 18 Mar 2016 08:23:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Mar 2016 08:23:14 -0400
Message-ID: <1458303794-23386-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ipsecmgr: Bump SRCREV for compilation warning fix
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
X-List-Received-Date: Fri, 18 Mar 2016 12:23:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb | 2 +-
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc        | 2 +-
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
index b282818..e7ad7bb 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://../../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7e
 
 include ipsecmgr.inc
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index 1dba485..b16b939 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -2,5 +2,5 @@ LICENSE = "BSD-3-Clause"
 BRANCH="master"
 SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
 #Commit ID corresponding to DEV.IPSECMGR.01.01.00.04
-SRCREV = "c385c146846a60f5f68cb12670dee6d7c5edb028"
+SRCREV = "a119a44ebf4816d2a921e56d4f8a176832eabfc4"
 PV     = "01.01.00.04+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
index 97f28b4..4d92acd 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadc
 
 include ipsecmgr.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libnl-xfrm"
 RDEPENDS_${PN} = "ipsecmgr-mod"
-- 
1.9.1


