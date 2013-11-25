Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D31D752998
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 15:51:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPFp5CI010909
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:05 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFp52p010162
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:05 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 09:51:04 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFoujx009147;
	Mon, 25 Nov 2013 09:51:03 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2013 10:53:58 -0600
Message-ID: <1385398442-24668-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385398442-24668-1-git-send-email-fcooper@ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/7] packagegroup-arago-tisdk-qt: Make packagegroup generic
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
X-List-Received-Date: Mon, 25 Nov 2013 15:51:06 -0000
Content-Type: text/plain

* Update packagegroup so it applies to Qt 5 users along with Qt 4 users.
* To reflect this change also rename recipe top reflect that its a generic qt
  packagegroup.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-qt.bb   |   27 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |   19 --------------
 2 files changed, 27 insertions(+), 19 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb
new file mode 100644
index 0000000..c981f9e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Task to add Qt embedded related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+QT4_DEMOS = "\
+    qt4-embedded-examples \
+    qt4-embedded-demos \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
+"
+
+QT5_DEMOS = "\
+    qtwebkit-examples-examples \
+"
+
+QT_DEMOS = "\
+    ${@base_conditional('QT_PROVIDER', 'qt5', '${QT5_DEMOS}', '${QT4_DEMOS}', d)} \
+    qt-tstat \
+"
+
+RDEPENDS_${PN} = "\
+    ${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5', 'packagegroup-arago-qte', d)} \
+    ${QT_DEMOS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
deleted file mode 100644
index 10187a6..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Task to add Qt embedded related packages"
-LICENSE = "MIT"
-PR = "r4"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-QT_DEMOS = "\
-    qt4-embedded-examples \
-    qt4-embedded-demos \
-    qt-tstat \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
-"
-
-RDEPENDS_${PN} = "\
-    packagegroup-arago-qte \
-    ${QT_DEMOS} \
-"
-- 
1.7.0.4


