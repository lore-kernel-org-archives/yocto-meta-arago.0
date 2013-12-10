Return-Path: <eyalreizer@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by arago-project.org (Postfix) with ESMTPS id B7CBC5299E
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2013 09:02:58 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so2036628eek.25
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2013 01:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=w35TfXiznQ3WqzEwRzaMcb6VUl/sv3wTNFC3tZQE0ak=;
	b=JOBaO8Lapii4B4zTlilwrUC+5GLqCWvCYfs0u7bh90b+mQEIYSX4PiuFk12lR0pkBA
	Yu0uAfH5Ry3QSIOrIhizomDIERCLIg73Jiz0La9Un0TFsZJArdIJDMPs5wi2EWW84EjM
	mCmSwFz9oUyUijC7OEuPVqw92VSpGazFqcrw5qsXwCkX14yvz5nZfOOl4R/0DIfT2Oir
	Csoy3s+OCT6SAd6QzBt6el5Bj3nsO/9hxWQXDi3jqMk4by4092yBlZmhM/5hZseKKYS6
	Zz67YeQDWDDO6X8f7URsx7et1/6RTL8VBxu6qv+8omwNFbZ+t7uzkvEYk5eDviCxutXT
	fRpQ==
X-Received: by 10.14.215.199 with SMTP id e47mr883357eep.107.1386666177452;
	Tue, 10 Dec 2013 01:02:57 -0800 (PST)
Received: from localhost.localdomain (46-116-178-164.bb.netvision.net.il.
	[46.116.178.164])
	by mx.google.com with ESMTPSA id a51sm38636345eeh.8.2013.12.10.01.02.55
	for <meta-arago@arago-project.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Dec 2013 01:02:56 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 10 Dec 2013 11:02:49 +0200
Message-Id: <1386666169-9623-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCHv3] ti-compat-wireless-wl18xx: build from ol_r8.a8.08
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
X-List-Received-Date: Tue, 10 Dec 2013 09:02:59 -0000

From: Eyal Reizer <eyalr@ti.com>

* Add a new recipe fetching and building the Wilink8 drivers from
TI-Openlink based on release ol_r8.a8.08.

* This recipe is used for building with kernels older then the 3.12 kernel
where the drivers are now in-tree.
For 3.12 and newer, this recipe is not needed as the wl18xx wlan drivers
are now in-tree.

* Remove previous version of the recipe building ol_r8.a6.01

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
Changes from previous patch version:
- fix review comments made by franklin
- Remove a left over patch file used by the previous version of the recipe

 ...1-git-version-wl18xx-use-compat-base-tree.patch |   68 --------------------
 ...01.bb => ti-compat-wireless-wl18xx_r8.a8.08.bb} |   38 +++++------
 2 files changed, 16 insertions(+), 90 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a6.01.bb => ti-compat-wireless-wl18xx_r8.a8.08.bb} (63%)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch
deleted file mode 100644
index 624d86f..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From bb09bbce828112d81ae473d10a07736e73704ac4 Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Sun, 10 Mar 2013 04:42:58 -0700
-Subject: [PATCH] git-version-wl18xx: use compat base tree
-
-For compat-wireless based builds use compat_base_tree_version in  version.h
-When building with compat-wireless mechanism, the version info captured
-in version.h reflects target kernel and not the wl18xx version.
-
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- drivers/net/wireless/ti/wl18xx/Makefile |   12 ++++++++----
- drivers/net/wireless/ti/wlcore/Makefile |   12 ++++++++----
- 2 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/drivers/net/wireless/ti/wl18xx/Makefile b/drivers/net/wireless/ti/wl18xx/Makefile
-index 4ddb258..55cc561 100644
---- a/drivers/net/wireless/ti/wl18xx/Makefile
-+++ b/drivers/net/wireless/ti/wl18xx/Makefile
-@@ -1,12 +1,16 @@
- wl18xx-objs	= main.o acx.o tx.o io.o debugfs.o
- 
- define filechk_version.h
--	(echo 'static const char *wl18xx_git_head = \
--			"$(shell git describe --dirty)";')
-+         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
-+         echo 'static const char *wl18xx_git_head =  COMPAT_BASE_TREE_VERSION;'; \
-+         echo '#else'; \
-+         echo 'static const char *wl18xx_git_head = \
-+                        "$(shell git describe --dirty)";'; \
-+         echo '#endif')
- endef
- 
--$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
--	@$(call filechk,version.h)
-+#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
-+#	@$(call filechk,version.h)
- 
- $(obj)/main.c: $(src)/version.h
- 
-diff --git a/drivers/net/wireless/ti/wlcore/Makefile b/drivers/net/wireless/ti/wlcore/Makefile
-index 9923a1a..647489c 100644
---- a/drivers/net/wireless/ti/wlcore/Makefile
-+++ b/drivers/net/wireless/ti/wlcore/Makefile
-@@ -3,12 +3,16 @@ wlcore-objs		= main.o cmd.o io.o event.o tx.o rx.o ps.o acx.o \
- 
- define filechk_version.h
- 	(echo 'static const char *wlcore_timestamp = __TIMESTAMP__;'; \
--	echo 'static const char *wlcore_git_head = \
--			"$(shell git describe --dirty)";')
-+         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
-+         echo 'static const char *wl12xx_git_head =  COMPAT_BASE_TREE_VERSION;'; \
-+         echo '#else'; \
-+         echo 'static const char *wl12xx_git_head = \
-+                        "$(shell git describe --dirty)";'; \
-+         echo '#endif')
- endef
- 
--$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
--	@$(call filechk,version.h)
-+#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
-+#	@$(call filechk,version.h)
- 
- $(obj)/main.c: $(src)/version.h
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
similarity index 63%
rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
index a69b7d6..c377667 100644
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
 
@@ -32,28 +34,15 @@ S = "${WORKDIR}/compat-wireless"
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
-# This preserves the git repo until driver-select is ran.
-
-adjust_git() {
-    :
-}
-
 do_configure() {
     cd ${S}
-    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh
+    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh network
     ./scripts/driver-select wl18xx
 
-    # Delete the .git repository since it should no longer be needed.
-    rm -rf ${S}/.git ${S}/.gitignore
-
     # Now generate the sourceipk with the properly configured sources
     sourceipk_do_create_srcipk
 }
@@ -63,5 +52,10 @@ do_configure_append() {
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


