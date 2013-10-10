Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AA93752090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3hg4007304
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3gCe008850
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:42 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3gHk014844	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:42 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2OGp016869	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:24 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2O9t016868	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:24 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:12 +0100
Message-ID: <1381420942-16810-2-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381420942-16810-1-git-send-email-r-monk@ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 01/11] ti-connectivity/ti-compat-wireless-wl18xx: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:44 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
      * OMAP5432x-xx-x1-xx

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...01.bb => ti-compat-wireless-wl18xx_r8.a7.02.bb} |   30 +++++++++++---------
 1 file changed, 17 insertions(+), 13 deletions(-)
 copy meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a6.01.bb => ti-compat-wireless-wl18xx_r8.a7.02.bb} (73%)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
similarity index 73%
copy from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
copy to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
index a69b7d6..295dd9c 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "ti compat-wireless drivers for wl18xx"
 HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
 SECTION = "kernel/modules"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 RDEPENDS_${PN} = "wireless-tools"
 
@@ -14,16 +14,18 @@ RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
 RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
 RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
 
-PV = "r8.a6.01"
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+PV = "r8.a7.02"
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "c"
+PR_append = "a"
 
-# Tags: ol_r8.a6.01
-SRCREV_wl18xx = "f076cdad1988daf207ad560db2fe96caaa7c596e"
-SRCREV_compat = "c37c46c4ab5085ba50f650d15854404983b8d09b"
-SRCREV_compat-wireless = "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
+# Tags: ol_r8.a7.02
+SRCREV_wl18xx = "e611d18893fbd66f6c303e111955d8a732fd0c34"
+SRCREV_compat = "595b13b80f9b922d9e3a1c6e7b75c38b471b2b44"
+SRCREV_compat-wireless = "40d5abd0fe6c89a2afd993f633924e716453a09e"
 
 SRCREV_FORMAT = "compat-wireless"
 
@@ -32,10 +34,7 @@ S = "${WORKDIR}/compat-wireless"
 SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
            git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
            git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
-           file://0001-git-version-wl18xx-use-compat-base-tree.patch;patchdir=../wl18xx \
-           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch;patchdir=../wl18xx \
-          "
-
+"
 
 EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
 
@@ -48,11 +47,11 @@ adjust_git() {
 
 do_configure() {
     cd ${S}
-    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh
+    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh network
     ./scripts/driver-select wl18xx
 
     # Delete the .git repository since it should no longer be needed.
-    rm -rf ${S}/.git ${S}/.gitignore
+    #rm -rf ${S}/.git ${S}/.gitignore
 
     # Now generate the sourceipk with the properly configured sources
     sourceipk_do_create_srcipk
@@ -63,5 +62,10 @@ do_configure_append() {
 }
 
 do_install() {
+    # Remove hardcoded references to host depmod
+    sed -i "s#@/sbin/depmod -a## " Makefile
+    sed -i "s#@/sbin/depmod -ae## " Makefile
+
+    # Install modules
     oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
 }
-- 
1.7.9.5


