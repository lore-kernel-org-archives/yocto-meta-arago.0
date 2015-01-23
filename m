Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8EF5E52ABA
	for <meta-arago@arago-project.org>;
	Fri, 23 Jan 2015 03:37:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0N3btFE025916
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:55 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0N3bsnl023095
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 21:37:54 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0N3bmoF021861;	Thu, 22 Jan 2015 21:37:54 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 22:37:43 -0500
Message-ID: <1421984265-11173-5-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
References: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 5/7] matrix-gui: Add submenus for keystone2 apps
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
X-List-Received-Date: Fri, 23 Jan 2015 03:37:56 -0000
Content-Type: text/plain

- Adds demos and utility submenus

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../matrix/matrix-gui-submenus-ks2_2.0.bb          |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb
new file mode 100644
index 0000000..2e3ff43
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Submenu packages for Matrix GUI v2 for Keystone II"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
+
+require matrix-gui-apps-ks2-git.inc
+
+# This package does not use a subdirectory as ${S} so we need to
+# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+
+PR = "${INC_PR}.0"
+
+# These packages make submenus in matrix and are not architecture specific
+inherit allarch
+
+S = "${WORKDIR}/git"
+
+# List of submenus to build packages for
+SUBMENUS = "utilities_submenu demos_submenu"
+
+do_install(){
+    install -d ${D}${MATRIX_APP_DIR}
+
+    for x in ${SUBMENUS}
+    do
+        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
+    done
+}
+
+PACKAGES += "${PN}-utility ${PN}-demos"
+
+# Make sure app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-ks2-images"
+
+# Add the files for each submenu package
+FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
+FILES_${PN}-demos = "${MATRIX_APP_DIR}/demos_submenu/*"
-- 
1.7.9.5


