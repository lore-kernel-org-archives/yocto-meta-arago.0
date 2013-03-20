Return-Path: <eyalr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5F05B52A7A
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 09:30:49 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K9UlNW001897
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2013 04:30:48 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K9Uk9o021173
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 15:00:46 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 15:00:46 +0530
Received: from user-VirtualBox.emea.dhcp.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r2K9URxL013496;	Wed, 20 Mar 2013 15:00:45 +0530
From: Eyal Reizer <eyalr@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Mar 2013 11:30:13 +0200
Message-ID: <1363771816-4022-6-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363771816-4022-2-git-send-email-eyalr@ti.com>
References: <1363771816-4022-2-git-send-email-eyalr@ti.com>
MIME-Version: 1.0
Subject: [PATCHv3 6/9] ti-compat-wireless-wl18xx: build Wilink8 drivers from TI-OpenLink
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
X-List-Received-Date: Wed, 20 Mar 2013 09:30:50 -0000
Content-Type: text/plain

Add a new recipe from fetching the Wilink8 drivers from TI-Openlink
in github by creating a compa-wireless package and build with the
target linux kernel source.

This package replace the wilink6 package which is provided by the
ti-compat-wireless-wl12xx recipe. Selection between the two is
done using a "WILINK_VERSION" switch added to arago.conf

Changes in v2:
* Use an actual release name in the recipe name instead of _git
* Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely 
  replace the wilink6 one.

Changes in v3:
* Add _${PN} to all runtime variables

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...1-git-version-wl18xx-use-compat-base-tree.patch |   68 ++++++++++++++++++++
 .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |   66 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch
new file mode 100644
index 0000000..624d86f
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-tree.patch
@@ -0,0 +1,68 @@
+From bb09bbce828112d81ae473d10a07736e73704ac4 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Sun, 10 Mar 2013 04:42:58 -0700
+Subject: [PATCH] git-version-wl18xx: use compat base tree
+
+For compat-wireless based builds use compat_base_tree_version in  version.h
+When building with compat-wireless mechanism, the version info captured
+in version.h reflects target kernel and not the wl18xx version.
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ drivers/net/wireless/ti/wl18xx/Makefile |   12 ++++++++----
+ drivers/net/wireless/ti/wlcore/Makefile |   12 ++++++++----
+ 2 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/net/wireless/ti/wl18xx/Makefile b/drivers/net/wireless/ti/wl18xx/Makefile
+index 4ddb258..55cc561 100644
+--- a/drivers/net/wireless/ti/wl18xx/Makefile
++++ b/drivers/net/wireless/ti/wl18xx/Makefile
+@@ -1,12 +1,16 @@
+ wl18xx-objs	= main.o acx.o tx.o io.o debugfs.o
+ 
+ define filechk_version.h
+-	(echo 'static const char *wl18xx_git_head = \
+-			"$(shell git describe --dirty)";')
++         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
++         echo 'static const char *wl18xx_git_head =  COMPAT_BASE_TREE_VERSION;'; \
++         echo '#else'; \
++         echo 'static const char *wl18xx_git_head = \
++                        "$(shell git describe --dirty)";'; \
++         echo '#endif')
+ endef
+ 
+-$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
+-	@$(call filechk,version.h)
++#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
++#	@$(call filechk,version.h)
+ 
+ $(obj)/main.c: $(src)/version.h
+ 
+diff --git a/drivers/net/wireless/ti/wlcore/Makefile b/drivers/net/wireless/ti/wlcore/Makefile
+index 9923a1a..647489c 100644
+--- a/drivers/net/wireless/ti/wlcore/Makefile
++++ b/drivers/net/wireless/ti/wlcore/Makefile
+@@ -3,12 +3,16 @@ wlcore-objs		= main.o cmd.o io.o event.o tx.o rx.o ps.o acx.o \
+ 
+ define filechk_version.h
+ 	(echo 'static const char *wlcore_timestamp = __TIMESTAMP__;'; \
+-	echo 'static const char *wlcore_git_head = \
+-			"$(shell git describe --dirty)";')
++         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
++         echo 'static const char *wl12xx_git_head =  COMPAT_BASE_TREE_VERSION;'; \
++         echo '#else'; \
++         echo 'static const char *wl12xx_git_head = \
++                        "$(shell git describe --dirty)";'; \
++         echo '#endif')
+ endef
+ 
+-$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
+-	@$(call filechk,version.h)
++#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
++#	@$(call filechk,version.h)
+ 
+ $(obj)/main.c: $(src)/version.h
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
new file mode 100644
index 0000000..7549f47
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
@@ -0,0 +1,66 @@
+# This is a TI specific version of the compat-wireless recipe using a
+# compat-wireless package created from the TI Systems Tested mac80211 releases.
+
+DESCRIPTION = "ti compat-wireless drivers for wl18xx"
+HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+RDEPENDS_${PN} = "wireless-tools"
+
+PROVIDES += "ti-compat-wireless-wl12xx"
+RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
+RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
+RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
+
+PV = "r8.a6.01"
+inherit module
+
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+SRCREV_wl18xx = "ol_r8.a6.01"
+SRCREV_compat = "ol_r8.a6.01"
+SRCREV_compat-wireless = "ol_r8.a6.01"
+
+SRCREV_FORMAT = "compat-wireless"
+
+S = "${WORKDIR}/compat-wireless"
+
+SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
+           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
+           git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
+           file://0001-git-version-wl18xx-use-compat-base-tree.patch;patchdir=../wl18xx \
+           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch;patchdir=../wl18xx \
+          "
+
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
+
+# Prevent sourceipk clear_git function from running.
+# This preserves the git repo until driver-select is ran.
+
+clear_git() {
+    :
+}
+
+do_configure() {
+    cd ${S}
+    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh
+    ./scripts/driver-select wl18xx
+
+    # Delete the .git repository since it should no longer be needed.
+    rm -rf ${S}/.git ${S}/.gitignore
+
+    # Now generate the sourceipk with the properly configured sources
+    sourceipk_do_create_srcipk
+}
+
+do_configure_append() {
+    sed -i "s#@./scripts/update-initramfs## " Makefile
+}
+
+do_install() {
+    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+}
-- 
1.7.9.5


