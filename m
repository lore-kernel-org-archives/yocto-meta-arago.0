Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id D94F752A72
	for <meta-arago@arago-project.org>;
	Sun, 21 Dec 2014 22:23:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGY00IDHE5QJK40@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 21 Dec 2014 16:22:51 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=b6gFOWC0 c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=OmE9Tjkzyc6dQou63xkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0736C200F4;	Sun,
	21 Dec 2014 17:22:38 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 21 Dec 2014 17:22:37 -0500
Message-id: <1419200557-4510-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] switch-config: add initial version
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
X-List-Received-Date: Sun, 21 Dec 2014 22:23:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Requires some newly added APIs available in linux-ti-staging 3.14+, hence
copy modified headers locally to build against standard linux-libc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ig.c-include-stdbool.h-to-define-bool-typ.patch | 25 ++++++++++++++++++++
 .../recipes-bsp/switch-config/switch-config_git.bb | 27 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch
 create mode 100644 meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb

diff --git a/meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch b/meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch
new file mode 100644
index 0000000..ec5e1db
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch
@@ -0,0 +1,25 @@
+From 42c76d70760a8b0d19a4126d3c53578f5f5b3606 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 21 Dec 2014 14:18:46 -0500
+Subject: [PATCH] switch-config.c: include stdbool.h to define bool type
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ switch-config.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/switch-config.c b/switch-config.c
+index d49cac7..0d1f9f9 100644
+--- a/switch-config.c
++++ b/switch-config.c
+@@ -19,6 +19,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <getopt.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>
+-- 
+2.2.0
+
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
new file mode 100644
index 0000000..7df63ae
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Ethernet Switch configuration management"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://switch-config.c;beginline=1;endline=14;md5=659ff9658cbaba3110b81804af60de75"
+
+DEPENDS = "virtual/kernel"
+
+BRANCH ?= "master"
+SRCREV = "4323e6c3a575a845e19378ccb06ab9a3b4825b88"
+
+SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH} \
+           file://0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
+
+do_configure() {
+	mkdir -p ${S}/linux
+	cp ${STAGING_KERNEL_DIR}/include/uapi/linux/net_switch_config.h ${S}/linux
+	cp ${STAGING_KERNEL_DIR}/include/uapi/linux/sockios.h ${S}/linux
+	sed 's|-I$(KBUILD_OUTPUT)/usr/include|${TOOLCHAIN_OPTIONS} -I.|' -i ${S}/Makefile
+}
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/switch-config ${D}${bindir}/switch-config
+}
-- 
2.2.0


