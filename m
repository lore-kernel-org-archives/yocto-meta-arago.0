Return-Path: <eyalreizer@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by arago-project.org (Postfix) with ESMTPS id 0C72C52A5D
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:37 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id u28so2746709qcs.8
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/xHpkc2xJjADMAJPzTlroMnY/peujdLZpMvXBHRhY5U=;
	b=sxa/3LtTf/mwws4nfgySgJ4bcrzaSX3le3k8eQmGLwMMJ7f5ljbUr0jeXyv+6DRYMq
	Bd5Etp1/DTy4V3+Zsw2en5JapLcdLjc7GmUwQ+JPK5+gGaAfWIZ4Dz65Q7lNf3ZEu1Zs
	n70D1Zd5DmEUkScN8xRxhbs6TWlw4dXjcwI2dKfDB2NYKpUh8KR1/5r3aqhkzV42XK1l
	M87GvCKUddYPNbrMeWS3k5kIPP3PrAtDedsn0TNZEU4ofYV1cqcPGFOa/6bVMD1jPdGC
	HFhuIQtcyz6BVIJmoKWCQ5laEGDwko8PIMxX60KZSnTdbV0Il2eicEDN2oaFEiniTRr+
	EYiA==
X-Received: by 10.224.31.73 with SMTP id x9mr19945577qac.11.1363613796758;
	Mon, 18 Mar 2013 06:36:36 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.35
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:36 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:35:58 +0200
Message-Id: <1363613762-6537-6-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 6/9] ti-compat-wireless-wl18xx: build Wilink8 drivers from TI-OpenLink
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:37 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a new recipe for fetching the Wilink8 drivers from TI-Openlink
in github by creating a compat-wireless package and building with the
target linux kernel source.

This package replace the wilink6 package which is provided by the
ti-compat-wireless-wl12xx. Selection between the two is done using a 
"WILINK_VERSION" switch added to arago.conf

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...1-git-version-wl18xx-use-compat-base-tree.patch |   68 ++++++++++++++++++++
 .../ti-compat-wireless-wl18xx_git.bb               |   64 ++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-wl18xx-use-compat-base-tree.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-wl18xx-use-compat-base-tree.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-wl18xx-use-compat-base-tree.patch
new file mode 100644
index 0000000..624d86f
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-wl18xx-use-compat-base-tree.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_git.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_git.bb
new file mode 100644
index 0000000..cd8120e
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_git.bb
@@ -0,0 +1,64 @@
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
+RPROVIDES += "ti-compat-wireless-wl12xx"
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


