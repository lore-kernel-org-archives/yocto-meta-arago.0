Return-Path: <a0226073@ares-ubuntu2>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2D1BB52982
	for <meta-arago@arago-project.org>;
	Wed,  1 Jun 2016 20:24:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u51KOkaL019732
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 15:24:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51KOphs030500
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 15:24:51 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Jun 2016 15:24:50 -0500
Received: from ares-ubuntu2 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51KOmlZ013185;
	Wed, 1 Jun 2016 15:24:49 -0500
Received: from a0226073 by ares-ubuntu2 with local (Exim 4.82)	(envelope-from
	<a0226073@ares-ubuntu2>)	id 1b8Ch5-0007NP-6j;
	Wed, 01 Jun 2016 16:24:47 -0400
From: John Godbey <j-godbey@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Jun 2016 16:23:59 -0400
Message-ID: <1464812639-28320-1-git-send-email-j-godbey@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] posix-smp-demo: add version 1.0.0.1
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
X-List-Received-Date: Wed, 01 Jun 2016 20:24:59 -0000
Content-Type: text/plain

This patch provides the initial support for the posix-smp-demo
in the Linux SDK.  The .inc file remains separate to support
a later RTOS version of the same demo.

Signed-off-by: John Godbey <j-godbey@ti.com>
---
 .../posix-smp-demo/posix-smp-demo.inc                | 20 ++++++++++++++++++++
 .../posix-smp-demo/posix-smp-demo_git.bb             | 14 ++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo.inc
 create mode 100644 meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo_git.bb

diff --git a/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo.inc
new file mode 100644
index 0000000..33f5d73
--- /dev/null
+++ b/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo.inc
@@ -0,0 +1,20 @@
+SUMMARY = "This recipe creates a posix-smp-demo binaries."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://dhry.h;beginline=1;endline=377;md5=8f2fbe6e071d9ea4afeca73cfd656ec8"
+
+POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
+POSIX_SMP_GIT_PROTOCOL = "git"
+POSIX_SMP_GIT_BRANCH = "sbl_prep"
+
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.00.01"
+POSIX_SMP_SRCREV = "55d7fd4c60c9d513932a86df3df8dee0244208e0"
+
+BRANCH = "${POSIX_SMP_GIT_BRANCH}"
+SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${POSIX_SMP_SRCREV}"
+PV = "01.00.00.01"
+INC_PR = "r1"
+
+S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo_git.bb b/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo_git.bb
new file mode 100644
index 0000000..8e26005
--- /dev/null
+++ b/meta-arago-extras/recipes-demo-applications/posix-smp-demo/posix-smp-demo_git.bb
@@ -0,0 +1,14 @@
+require posix-smp-demo.inc
+
+PR = "${INC_PR}.0"
+
+EXTRA_OEMAKE = "-f Makefile_linux EGCC="${CC}""
+
+do_compile() {
+    oe_runmake posix-smp-demo-linux-armv7
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 posix-smp-demo-linux-armv7 ${D}${bindir}
+}
-- 
1.9.1


