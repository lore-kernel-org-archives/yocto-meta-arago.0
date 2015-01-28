Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 32DCA529B3
	for <meta-arago@arago-project.org>;
	Wed, 28 Jan 2015 16:19:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0SGJBMF026998
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 10:19:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0SGJAwU006726
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 10:19:10 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 28 Jan 2015 10:19:10 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0SGJApO010456;	Wed, 28 Jan 2015 10:19:10 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Jan 2015 11:19:08 -0500
Message-ID: <1422461948-9670-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: Remove multiprocmgr recipe: moved to meta-ti
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
X-List-Received-Date: Wed, 28 Jan 2015 16:19:12 -0000
Content-Type: text/plain

- Recipe updated in meta-ti as this is TI specific

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-bsp/multiprocmgr/multiprocmgr_git.bb   |   20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb

diff --git a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb b/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
deleted file mode 100644
index 3f2e52c..0000000
--- a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "TI Multiproc Manager for KeyStone II"
-HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
-LICENSE = "BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
-SECTION = "console"
-COMPATIBLE_MACHINE = "keystone"
-
-PR = "r1"
-
-BRANCH ?= "master"
-SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
-
-SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
-}
-- 
1.7.9.5


