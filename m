Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 854FB52004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 14:32:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QEWt7A009169
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 08:32:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QEWtLR000433
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 08:32:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 08:32:55 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1QEWmdN026291	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 08:32:55 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Feb 2016 09:32:38 -0500
Message-ID: <1456497158-46802-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456497158-46802-1-git-send-email-e-ruei1@ti.com>
References: <1456497158-46802-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] matrix: enable corresponding 3D demos including kmscube for AM3
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
X-List-Received-Date: Fri, 26 Feb 2016 14:32:56 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 +++++++++-
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb             |  6 +++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 75866d2..11ff899 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r50"
+PR = "r51"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -57,6 +57,14 @@ MATRIX_SGX_DEMOS_ti43x = " \
     matrix-3d-demo-kmscube \
 "
 
+MATRIX_SGX_DEMOS_ti33x = " \
+    matrix-3d-demo-chameleon \
+    matrix-3d-demo-coverflow \
+    matrix-3d-demo-navigation \
+    matrix-3d-demo-exampleui \
+    matrix-3d-demo-kmscube \
+"
+
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_APPS = ""
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 710bb75..f9d3f30 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -37,6 +37,10 @@ PACKAGES_append_ti43x = " \
             matrix-3d-demo-kmscube \
 "
 
+PACKAGES_append_ti33x = " \
+            matrix-3d-demo-kmscube \
+"
+
 MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
 
 do_install_prepend() {
-- 
1.9.1


