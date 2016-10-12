Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 463895298A
	for <meta-arago@arago-project.org>;
	Wed, 12 Oct 2016 11:28:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CBSiZb001622
	for <meta-arago@arago-project.org>; Wed, 12 Oct 2016 06:28:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CBShMh016669
	for <meta-arago@arago-project.org>; Wed, 12 Oct 2016 06:28:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 06:28:43 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CBSg3N007459;	Wed, 12 Oct 2016 06:28:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Oct 2016 07:26:18 -0400
Message-ID: <1476271579-13081-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476271579-13081-1-git-send-email-j-stiffler@ti.com>
References: <1476271579-13081-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] matrix-gui-settings-demos: add weston-terminal shortcut
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
X-List-Received-Date: Wed, 12 Oct 2016 11:28:44 -0000
Content-Type: text/plain

* This new package adds a shortcut to weston-terminal in matrix under
  the "Settings" menu.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-settings-demos_2.0.bb   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
index 927c8f9..a84e5c1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
@@ -3,13 +3,23 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit allarch
 
 S = "${WORKDIR}/git/settings_apps"
 
+PACKAGES =+ "matrix-gui-weston-terminal-demo"
+
 # Make sure setting submenu and app images has been installed
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-settings am-sysinfo"
+SETTINGS_DEMOS_RDEPENDS = " \
+    matrix-gui-apps-images \
+    matrix-gui-submenus-settings \
+    am-sysinfo \
+"
+
+RDEPENDS_${PN} += "${SETTINGS_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-gui-weston-terminal-demo += "${SETTINGS_DEMOS_RDEPENDS}"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+FILES_matrix-gui-weston-terminal-demo = "${MATRIX_APP_DIR}/terminal"
-- 
2.7.4


