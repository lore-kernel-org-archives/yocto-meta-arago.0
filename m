Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AE78052A85
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 20:12:04 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0VKC275032566
	for <meta-arago@arago-project.org>; Tue, 31 Jan 2012 14:12:03 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKC2e4026014
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2012 01:42:02 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 1 Feb 2012 01:42:02 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKBvAW025974;
	Wed, 1 Feb 2012 01:42:01 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Jan 2012 14:11:52 -0600
Message-ID: <1328040714-29036-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1328040714-29036-1-git-send-email-Chase.Maupin@ti.com>
References: <1328040714-29036-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] refresh-screen: add package from old arago overlay
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
X-List-Received-Date: Tue, 31 Jan 2012 20:12:06 -0000
Content-Type: text/plain

* This package adds a utility to force a screen refresh after
  graphics applications are executed.  This is to prevent left
  over graphics artifacts from being displayed in matrix.
* Ported from old arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/refresh-screen_2.0.bb      |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
new file mode 100644
index 0000000..3a3ad5e
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Simple Application to force a screen refresh"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
+SECTION = "multimedia"
+PRIORITY = "optional"
+
+# Make sure that QT font libraries have been installed
+RDEPENDS += "qt4-embedded-fonts"
+
+PR = "r0"
+
+SRCREV = "ba27273f0d61dd71589db380f785f091b7ad3efe"
+BRANCH ?= "master"
+
+SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit qt4e
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
+}
-- 
1.7.0.4


