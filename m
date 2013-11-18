Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 11FA352972
	for <meta-arago@arago-project.org>;
	Mon, 18 Nov 2013 16:49:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAIGnjL2000946
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 10:49:45 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIGnj3a029477
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 10:49:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 18 Nov 2013 10:49:44 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIGnf5d002491;
	Mon, 18 Nov 2013 10:49:43 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Nov 2013 11:50:29 -0600
Message-ID: <1384797030-20419-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] cpuloadgen: Add utility to create variable cpu load
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
X-List-Received-Date: Mon, 18 Nov 2013 16:49:47 -0000
Content-Type: text/plain

* Add a utility that allows creating variable cpu load which is
  useful for testing.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-devtools/cpuloadgen/cpuloadgen_git.bb  |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb

diff --git a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
new file mode 100644
index 0000000..a44083a
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Utility to generate specified CPU Load"
+HOMEPAGE = "https://github.com/ptitiano/cpuloadgen"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6c2eb46c569d0cd7884089fea6b4f31"
+
+PV = "0.93"
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV ?= "301d69899d6f4d84f143e0ed86957eea416a27a6"
+
+SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}${bindir}
+    oe_runmake DESTDIR=${D}${bindir} install
+}
-- 
1.7.0.4


