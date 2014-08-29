Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9B07152A3B
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:58:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THwUuj023171
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:58:30 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THwUrA016807
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:58:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 12:58:30 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7THwTkS021568;	Fri, 29 Aug 2014 12:58:30 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7THwRp0011262;	Fri, 29 Aug 2014 23:28:28 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Aug 2014 12:58:25 -0500
Message-ID: <1409335105-18290-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] matrix-gui-qt5-demos: Add Qt5 Matrix demos
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
X-List-Received-Date: Fri, 29 Aug 2014 17:58:31 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-qt5-demos_2.0.bb             |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
new file mode 100644
index 0000000..0ed3707
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Qt5 demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/qt5_apps"
+
+do_install_prepend(){
+   install -d ${D}${bindir}
+   install -m 0755 ${S}/read_system_env.sh ${D}${bindir}/
+}
+
+
+# Make sure qt5 submenu and app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/* \
+                ${bindir}/read_system_env.sh"
-- 
1.7.9.5


