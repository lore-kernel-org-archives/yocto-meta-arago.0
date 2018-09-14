Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D21B052093
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 21:07:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EL7nKl115859
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536959269;
	bh=jWEn8G+hhLG0SONEiDCT4IH7QOXfNy4TImOhRe/r++M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QSyBgfEtjPjepyeg+qUt5AC+JuQSWOL3BfiU4+ux3H2Of7QzmudRC27lr540o4xkh
	pWcj/n0L2WjzBW35MPvB693fkU8Yo1MDbfoVzVxknHWKSUKSvb4/A9JnZuT0myU5sH
	XqHtg0Pzxw28/Usx2nf14dnoBswn0RHRH8PuCSNw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EL7nDY007407
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 16:07:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 16:07:49 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EL7mCb016015
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Sep 2018 17:07:44 -0400
Message-ID: <1536959265-3351-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
References: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 1/2] matrix-gui: qt5-demos: break qt5 demos package into individual ones
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
X-List-Received-Date: Fri, 14 Sep 2018 21:07:59 -0000
Content-Type: text/plain

- bump SRCREV of matrix-gui-v2-apps to pickup webkit-browser demo
- break qt5 demos package into individual one for each demo to to be
  selected based on certain conditions.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc     |  4 ++--
 .../recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 3620e85..a5da492 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "1fab50f6ceac640bf946e8716a68b1c827256489"
+SRCREV = "28aa0adb7733f103e07d82123924c5a6d1a9bfeb"
 BRANCH = "master"
-INC_PR = "r57"
+INC_PR = "r58"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
index 2dfeba3..cdc9824 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -10,6 +10,25 @@ inherit allarch
 S = "${WORKDIR}/git/qt5_apps"
 
 # Make sure qt5 submenu and app images has been installed
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
+QT5_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-qt5"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+PACKAGES = "matrix-qt5-demo-animated \
+            matrix-qt5-demo-browser \
+            matrix-qt5-demo-calculator \
+            matrix-qt5-demo-deform \
+            matrix-qt5-demo-webkit-browser \
+"
+
+RDEPENDS_matrix-qt5-demo-animated = "${QT5_RDEPENDS}"
+RDEPENDS_matrix-qt5-demo-browser = "${QT5_RDEPENDS}"
+RDEPENDS_matrix-qt5-demo-calculator = "${QT5_RDEPENDS}"
+RDEPENDS_matrix-qt5-demo-deform = "${QT5_RDEPENDS}"
+RDEPENDS_matrix-qt5-demo-webkit-browser = "${QT5_RDEPENDS}"
+
+# Split the matrix files by qt5 demos
+FILES_matrix-qt5-demo-animated = "${MATRIX_APP_DIR}/qt5_animated_tiles/*"
+FILES_matrix-qt5-demo-browser = "${MATRIX_APP_DIR}/qt5_browser/*"
+FILES_matrix-qt5-demo-calculator = "${MATRIX_APP_DIR}/qt5_calculator/*"
+FILES_matrix-qt5-demo-deform = "${MATRIX_APP_DIR}/qt5_deform/*"
+FILES_matrix-qt5-demo-webkit-browser = "${MATRIX_APP_DIR}/qt5_webkit_browser/*"
-- 
1.9.1


