Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A2A6852998
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 15:51:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPFp7Gp010915
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:07 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFp7Pt025985
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:07 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 09:51:07 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFouk0009147;
	Mon, 25 Nov 2013 09:51:06 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2013 10:53:59 -0600
Message-ID: <1385398442-24668-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385398442-24668-1-git-send-email-fcooper@ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/7] packagegroup-arago-tisdk-qt-sdk-host: Make packagegroup generic
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
X-List-Received-Date: Mon, 25 Nov 2013 15:51:08 -0000
Content-Type: text/plain

* Update package group so that it applies to both Qt 4 and Qt 5.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-qt-sdk-host.bb        |   22 ++++++++++++++++++++
 .../packagegroup-arago-tisdk-qte-sdk-host.bb       |   16 --------------
 2 files changed, 22 insertions(+), 16 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt-sdk-host.bb
new file mode 100644
index 0000000..936f463
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt-sdk-host.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+QT4_DEMOS_SRC = "\
+     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
+"
+
+QT5_DEMOS_SRC = ""
+
+QT_DEMOS = "\
+    qt-tstat-src \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '${QT5_DEMOS_SRC}', '${QT4_DEMOS_SRC}', d)} \
+"
+
+RDEPENDS_${PN} = "\
+    ${QT_DEMOS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
deleted file mode 100644
index 4cb85fe..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
-LICENSE = "MIT"
-PR = "r3"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-QT_DEMOS = "\
-    qt-tstat-src \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
-"
-
-RDEPENDS_${PN} = "\
-    ${QT_DEMOS} \
-"
-- 
1.7.0.4


