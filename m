Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 010B25298F
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 14:14:21 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q16EEJtu015968
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2012 08:14:20 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EEJva004030
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2012 19:44:19 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 6 Feb 2012 19:44:19 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EEFvu006687;
	Mon, 6 Feb 2012 19:44:18 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Feb 2012 08:14:10 -0600
Message-ID: <1328537652-22986-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1328537652-22986-1-git-send-email-Chase.Maupin@ti.com>
References: <1328537652-22986-1-git-send-email-Chase.Maupin@ti.com>
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
X-List-Received-Date: Mon, 06 Feb 2012 14:14:22 -0000
Content-Type: text/plain

* This package adds a utility to force a screen refresh after
  graphics applications are executed.  This is to prevent left
  over graphics artifacts from being displayed in matrix.
* Ported from old arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...ix-gui-browser_2.0.bb => refresh-screen_2.0.bb} |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
 copy meta-arago-extras/recipes-core/matrix/{matrix-gui-browser_2.0.bb => refresh-screen_2.0.bb} (51%)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
similarity index 51%
copy from meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
copy to meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 2574ace..a63a30d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "Simple Qt web display using webkit"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
+DESCRIPTION = "Simple Application to force a screen refresh"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
 SECTION = "multimedia"
@@ -9,16 +9,16 @@ RDEPENDS += "qt4-embedded-fonts"
 
 PR = "r0"
 
-SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
+SRCREV = "ba27273f0d61dd71589db380f785f091b7ad3efe"
 BRANCH ?= "master"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
 inherit qt4e
 
 do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/matrix_browser ${D}/${bindir}
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
 }
-- 
1.7.0.4


