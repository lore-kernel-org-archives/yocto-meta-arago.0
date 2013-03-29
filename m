Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6A9585297E
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 13:50:43 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TDod1g018180
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 08:50:40 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDocoF024199
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 19:20:39 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 19:20:38 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDoZ21006191;
	Fri, 29 Mar 2013 19:20:37 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Mar 2013 08:50:30 -0500
Message-ID: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/4] omapconf: add omapconf utility to assist testing and debug
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
X-List-Received-Date: Fri, 29 Mar 2013 13:50:45 -0000
Content-Type: text/plain

* The omapconf utility gives useful information about the
  state of the OMAP device and can be used in debug and testing.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-devtools/omapconf/omapconf_git.bb      |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb

diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
new file mode 100644
index 0000000..9fcd88d
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Diagnostic tool for TI OMAP processors"
+HOMEPAGE = "https://github.com/omapconf/omapconf"
+
+LICENSE = "GPLv2 BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
+
+PV = "1.66"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+BRANCH ?= "master"
+SRCREV = "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
+
+SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake CROSS_COMPILE=${TARGET_PREFIX} install
+}
+
+do_install () {
+    oe_runmake DESTDIR=${D}${bindir} install
+}
-- 
1.7.0.4


