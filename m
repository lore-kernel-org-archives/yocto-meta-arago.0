Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 374AD5209D
	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 20:26:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7MKQdAM005537
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7MKQdP7013284
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 Aug 2016 15:26:39 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7MKQato027787	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 15:26:39 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Aug 2016 16:19:08 -0400
Message-ID: <1471897150-34179-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
References: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] packagegroup-arago-tisdk-matrix: add touch demos
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
X-List-Received-Date: Mon, 22 Aug 2016 20:26:41 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 4027889..4fcc504 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r59"
+PR = "r60"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -30,8 +30,13 @@ MATRIX_COMMON_APPS = "              \
 #    matrix-gui-thermostat-demo
 MATRIX_QT_APPS = " \
     matrix-gui-qt5-demos \
+"
+
+MATRIX_TOUCH_APPS = " \
+    matrix-gui-touch-demos \
 "
 
+
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_SGX_DEMOS = " \
@@ -117,6 +122,7 @@ RDEPENDS_${PN} = "        \
     ${MATRIX_GUI}         \
     ${MATRIX_COMMON_APPS} \
     ${MATRIX_QT_APPS}     \
+    ${MATRIX_TOUCH_APPS}  \
     ${MATRIX_APPS}        \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCL_APPS}",'',d)} \
-- 
1.9.1


