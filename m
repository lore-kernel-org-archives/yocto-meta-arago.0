Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 39E3D52A98
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 13:42:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12Dg8mG013543
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8M4023728
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg85L018041;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQbDb-0005G2-Re; Tue, 02 Feb 2016 08:42:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 08:41:58 -0500
Message-ID: <1454420524-20173-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
References: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] ipsecmgr: Bump SRCREV to port to 4.1 kernel
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
X-List-Received-Date: Tue, 02 Feb 2016 13:42:09 -0000
Content-Type: text/plain

* And add ipsecmgr-mod to KERNEL_MODULE_AUTOLOAD

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb | 4 +++-
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc        | 2 +-
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb     | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
index 7bb760a..b282818 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://../../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7e
 
 include ipsecmgr.inc
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
@@ -18,3 +18,5 @@ do_install() {
 # Install kernel module
 	oe_runmake INSTALL_MOD_PATH="${D}" install
 }
+
+KERNEL_MODULE_AUTOLOAD += "ipsecmgr_mod"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index ac99c30..1dba485 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -2,5 +2,5 @@ LICENSE = "BSD-3-Clause"
 BRANCH="master"
 SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
 #Commit ID corresponding to DEV.IPSECMGR.01.01.00.04
-SRCREV = "d28e0b78bf55a2e0af596bab697a448aa3343470"
+SRCREV = "c385c146846a60f5f68cb12670dee6d7c5edb028"
 PV     = "01.01.00.04+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
index c9c3af9..97f28b4 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadc
 
 include ipsecmgr.inc
 
+PR = "r1"
+
 DEPENDS = "libnl-xfrm"
 RDEPENDS_${PN} = "ipsecmgr-mod"
 
-- 
1.9.1


