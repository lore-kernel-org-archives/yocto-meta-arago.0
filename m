Return-Path: <eyalreizer@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by arago-project.org (Postfix) with ESMTPS id 5E92752A78
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2013 13:26:43 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so1574076eaj.40
	for <meta-arago@arago-project.org>;
	Mon, 09 Dec 2013 05:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I7i/nKl/ULKPKXFuh7CkbN1MJLPyS1S4UtBB88GIWok=;
	b=hqkH9tY5fTU4yUFnJWIyMfDTpU4r2BvfbnuaKM75vE+PvGwkf7nVtNtKejtWhl+meF
	AS2wUROglkLaURH7/hMOLMS3NOG3R6L8p3zoVb43UP2DuyHCOO+UMfUujT1I46feZiar
	FvvmJB3yMJxxVaT3U858ZB/kaYMxvOduchD61+b6GxpMLCLtH8g5pxUXeS/HQ2rJffhW
	dhN9kXAhcG5djU+1nv9IVE/8ONoBWKgbEC4ssTG2bkmiO1IaHt3ZaPVZ0Wva5payFmJr
	LXer7X1rr0sGnGCt2onszckUthvIAAtMf/IDWNrnUTk/tQFgApWhs4cn6JaEshnQ+SFH
	8hmA==
X-Received: by 10.14.94.130 with SMTP id n2mr3026486eef.99.1386595602024;
	Mon, 09 Dec 2013 05:26:42 -0800 (PST)
Received: from localhost.localdomain (46-116-178-164.bb.netvision.net.il.
	[46.116.178.164]) by mx.google.com with ESMTPSA id
	j46sm28750148eew.18.2013.12.09.05.26.39 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Dec 2013 05:26:40 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon,  9 Dec 2013 15:26:33 +0200
Message-Id: <1386595593-8175-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCHv2] ti-compat-wireless-wl18xx: build from ol_r8.a8.08
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
X-List-Received-Date: Mon, 09 Dec 2013 13:26:44 -0000

* Add a new recipe fetching and building the Wilink8 drivers from 
TI-Openlink based on release ol_r8.a8.08.

* This recipe is used for building with kernels older then the 3.12 kernel 
where the drivers are now in-tree.
For 3.12 and newer, this recipe is not needed as the wl18xx wlan drivers
are now in-tree.

* Remove previous vrsion of the recipe building ol_r8.a6.01

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
Changes from previous submission:
Combined the 2 patches that add a new version and removed the previous
version into one patch that does both

 ...01.bb => ti-compat-wireless-wl18xx_r8.a8.08.bb} |   34 +++++++++++---------
 1 files changed, 19 insertions(+), 15 deletions(-)
 copy meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a6.01.bb => ti-compat-wireless-wl18xx_r8.a8.08.bb} (70%)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
similarity index 70%
copy from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
copy to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
index a69b7d6..9baf628 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
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
+PV = "r8.a8.08"
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "c"
+PR_append = "a"
 
-# Tags: ol_r8.a6.01
-SRCREV_wl18xx = "f076cdad1988daf207ad560db2fe96caaa7c596e"
-SRCREV_compat = "c37c46c4ab5085ba50f650d15854404983b8d09b"
-SRCREV_compat-wireless = "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
+# Tags: ol_r8.a8.08
+SRCREV_wl18xx = "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
+SRCREV_compat = "5d80865281795f962e1400a95202bbd07dd763c0"
+SRCREV_compat-wireless = "23a0d62ea1a57327709a77f08d6265ec807a909f"
 
 SRCREV_FORMAT = "compat-wireless"
 
@@ -32,27 +34,24 @@ S = "${WORKDIR}/compat-wireless"
 SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
            git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
            git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
-           file://0001-git-version-wl18xx-use-compat-base-tree.patch;patchdir=../wl18xx \
-           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch;patchdir=../wl18xx \
-          "
-
+"
 
 EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
 
-# Prevent sourceipk adjust_git function from running.
+# Prevent sourceipk clear_git function from running.
 # This preserves the git repo until driver-select is ran.
 
-adjust_git() {
+clear_git() {
     :
 }
 
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
1.7.0.4


