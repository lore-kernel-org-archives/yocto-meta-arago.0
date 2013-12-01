Return-Path: <eyalreizer@gmail.com>
Received: from mail-bk0-f53.google.com (mail-bk0-f53.google.com
	[209.85.214.53])
	by arago-project.org (Postfix) with ESMTPS id 4C09D529CE
	for <meta-arago@arago-project.org>;
	Sun,  1 Dec 2013 12:45:56 +0000 (UTC)
Received: by mail-bk0-f53.google.com with SMTP id na10so4859889bkb.26
	for <meta-arago@arago-project.org>;
	Sun, 01 Dec 2013 04:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7uO/99iU/p6DMiGqxS6Y6SSqMmpXHcMZ2H9g+GClskg=;
	b=rot670Firl722KIAWpsDeUd8vdaNNIuWHgEE6qGtZTQiPbWU+aSBc7j2hAsD6W/D7e
	OZ20TOfPghcsS6+/olz5aKCKkK4+z0XIp7IVG94OWs9kWRcr4qEfniyMUfHvzz2AU6wM
	a3ARXlyQlPen610pa/Svyp2IQ589U3kwcbB4GXPIEmFMVAZzacCdCkjkt8F1cOda7eOF
	ZE7+SaAJlXi35K8cw4Wr+rhrQ1s/FUE8kMFNO9RxK8YqTO2CA0/X3pn2JOiaD39hxBL+
	LN6jg1KXzRiLt/3qro8VwCqp8WKpY+LoVNpgQ4R1IAQ2+PyT0liRnpcK141Q5Dp27FbD
	jrsA==
X-Received: by 10.204.242.68 with SMTP id lh4mr43885421bkb.19.1385901954930;
	Sun, 01 Dec 2013 04:45:54 -0800 (PST)
Received: from localhost.localdomain (46-116-178-164.bb.netvision.net.il.
	[46.116.178.164]) by mx.google.com with ESMTPSA id
	no2sm70831578bkb.15.2013.12.01.04.45.52 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 01 Dec 2013 04:45:53 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  1 Dec 2013 14:45:45 +0200
Message-Id: <1385901947-10316-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] ti-compat-wireless-wl18xx: build from ol_r8.a8.08
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
X-List-Received-Date: Sun, 01 Dec 2013 12:45:56 -0000

Add a new recipe fetching the Wilink8 drivers from TI-Openlink
based on release ol_r8.a8.08.
This recipe is used for building with kernels older then the
3.12 kernel where the drivers are now in-tree.
For 3.12 and newer, this recipe is not needed.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../ti-compat-wireless-wl18xx_r8.a8.08.bb          |   71 ++++++++++++++++++++
 1 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
new file mode 100755
index 0000000..9baf628
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
@@ -0,0 +1,71 @@
+# This is a TI specific version of the compat-wireless recipe using a
+# compat-wireless package created from the TI Systems Tested mac80211 releases.
+
+DESCRIPTION = "ti compat-wireless drivers for wl18xx"
+HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+RDEPENDS_${PN} = "wireless-tools"
+
+PROVIDES += "ti-compat-wireless-wl12xx"
+RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
+RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
+RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
+
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+PV = "r8.a8.08"
+inherit module
+
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+# Tags: ol_r8.a8.08
+SRCREV_wl18xx = "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
+SRCREV_compat = "5d80865281795f962e1400a95202bbd07dd763c0"
+SRCREV_compat-wireless = "23a0d62ea1a57327709a77f08d6265ec807a909f"
+
+SRCREV_FORMAT = "compat-wireless"
+
+S = "${WORKDIR}/compat-wireless"
+
+SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
+           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
+           git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
+"
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
+    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh network
+    ./scripts/driver-select wl18xx
+
+    # Delete the .git repository since it should no longer be needed.
+    #rm -rf ${S}/.git ${S}/.gitignore
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
+    # Remove hardcoded references to host depmod
+    sed -i "s#@/sbin/depmod -a## " Makefile
+    sed -i "s#@/sbin/depmod -ae## " Makefile
+
+    # Install modules
+    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+}
-- 
1.7.0.4


