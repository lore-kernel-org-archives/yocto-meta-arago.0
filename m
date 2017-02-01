Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 06D1C52A90
	for <meta-arago@arago-project.org>;
	Wed,  1 Feb 2017 19:48:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v11JmAix016221
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2017 13:48:10 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v11Jm5P1003684
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2017 13:48:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Feb 2017 13:48:05 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v11Jm5WY023416;	Wed, 1 Feb 2017 13:48:05 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Feb 2017 14:45:49 -0500
Message-ID: <1485978350-1239-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 1/2] packagegroup-*-graphics: complete gc320 integration
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
X-List-Received-Date: Wed, 01 Feb 2017 19:48:21 -0000
Content-Type: text/plain

* add to libs to devkit and driver sources to SDK

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb     | 6 +++++-
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb   | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index b987947..d2dce0d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,11 +1,15 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
 GRAPHICS_RDEPENDS = "ti-sgx-ddk-km-src"
 
+GRAPHICS_RDEPENDS_append_omap-a15 = "\
+    ti-gc320-driver-src \
+"
+
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 484baab..573601b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries on sdk target"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -9,6 +9,10 @@ GRAPHICS_RDEPENDS = "\
     ti-sgx-ddk-um-dev \
     "
 
+GRAPHICS_RDEPENDS_append_omap-a15 = "\
+    ti-gc320-libs-dev \
+"
+
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
 "
-- 
2.7.4


