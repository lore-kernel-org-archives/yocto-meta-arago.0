Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C9FF452079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 14:14:21 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q16EEJMl012889
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2012 08:14:20 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EEIXh004025
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2012 19:44:18 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 6 Feb 2012 19:44:18 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EEFvt006687;
	Mon, 6 Feb 2012 19:44:17 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Feb 2012 08:14:09 -0600
Message-ID: <1328537652-22986-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/4] matrix-gui-browser: port from old arago overlay
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
X-List-Received-Date: Mon, 06 Feb 2012 14:14:22 -0000
Content-Type: text/plain

* This package adds a simple web browser GUI application with
  no decorations used to display matrix on the local display.
* Ported from old arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
new file mode 100644
index 0000000..2574ace
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Simple Qt web display using webkit"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
+SECTION = "multimedia"
+
+# Make sure that QT font libraries have been installed
+RDEPENDS += "qt4-embedded-fonts"
+
+PR = "r0"
+
+SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
+BRANCH ?= "master"
+
+SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit qt4e
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/matrix_browser ${D}/${bindir}
+}
-- 
1.7.0.4


