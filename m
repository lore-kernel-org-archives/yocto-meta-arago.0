Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AD39252998
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 15:51:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPFpAdp024128
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:10 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFpAjU025994
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 09:51:09 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFouk1009147;
	Mon, 25 Nov 2013 09:51:08 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2013 10:54:00 -0600
Message-ID: <1385398442-24668-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385398442-24668-1-git-send-email-fcooper@ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/7] packagegroup-arago-qt5-toolchain-target: Only include qt3D when using SGX
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
X-List-Received-Date: Mon, 25 Nov 2013 15:51:10 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-qt5-toolchain-target.bb     |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
index 7e0d12c..28c7e3d 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
@@ -1,12 +1,16 @@
 DESCRIPTION = "Target packages for Qt5 SDK"
 LICENSE = "MIT"
 
-PR = "r1"
+PR = "r2"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+QT_SGX_SUPPORT = "\
+    qt3d-dev \
+"
+
 RDEPENDS_${PN} += " \
         packagegroup-arago-standalone-sdk-target \
         libsqlite3-dev \
@@ -24,7 +28,7 @@ RDEPENDS_${PN} += " \
         qtdeclarative-dev \
         qtscript-dev \
         qtwebkit-dev \
-        qt3d-dev \
+        ${@base_contains('MACHINE_FEATURES','sgx','qt3d-dev','',d)} \
         qtlocation-dev \
         qtsensors-dev \
         qtsvg-dev \
-- 
1.7.0.4


