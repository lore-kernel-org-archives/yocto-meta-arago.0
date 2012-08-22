Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5F4BC52A7A
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 13:37:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MDbLD5020165
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:37:21 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MDbKCm011189
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:37:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 08:37:20 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7MDbKsX014732;	Wed, 22 Aug 2012 08:37:20 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T4BJH-00018c-50; Wed, 22 Aug 2012 08:49:27 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2012 08:49:25 -0500
Message-ID: <1345643365-4336-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] av-examples: Port av-examples from Arago
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
X-List-Received-Date: Wed, 22 Aug 2012 13:37:23 -0000
Content-Type: text/plain

* Add av-examples from Arago
* Convert svn repository to git. Update makefiles to create
  needed directories since git doesn't allow empty directories
  to be stored.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../av-examples/av-examples_1.0.bb                 |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb

diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
new file mode 100644
index 0000000..1025f96
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Linux Audio Video Example Applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/av_examples/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM := "file://COPYING;md5=80ea1ff5788f65d5c5b3206d50d4bc6c"
+SECTION = "system"
+PRIORITY = "optional"
+
+PR = "r0"
+
+DEPENDS += "virtual/kernel"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"
+
+BRANCH ?= "master"
+SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
+
+SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SKIP which would otherwise lead to discrepancies between host and arago binaries
+INSANE_SKIP_${PN} = "True"
+
+do_compile() {
+	touch debug
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	make release LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${MACHINE}"
+}
+
+do_install() {
+	make DESTDIR=${D} install
+}
-- 
1.7.0.4


