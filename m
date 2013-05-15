Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 75DAE52A5D
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3sah5005351
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3saUg014387
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:36 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:36 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkO004084;
	Tue, 14 May 2013 22:54:35 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:21 -0500
Message-ID: <1368590069-6700-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/9] packagegroup-arago-tisdk-*: Add back removed packages
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
X-List-Received-Date: Wed, 15 May 2013 03:54:37 -0000
Content-Type: text/plain

* For am335x some packages won't build when a 3.8+ kernel is used.
* Therefore, some packages were removed to avoid any issues when a 3.8 kernel
  is being built.
* Since a 3.2 kernel is also supported add back these packages when the
  ARAGO_BRAND is set to amsdk which indicates that a 3.2 kernel will be
  used.
* Also only include certain packages when a 3.8+ kernel is being used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 ++-
 .../packagegroup-arago-tisdk-connectivity.bb       |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 1ca6ddd..398d6d6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -17,6 +17,7 @@ CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_am37x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
 CONNECTIVITY_RDEPENDS_am180x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
+CONNECTIVITY_RDEPENDS_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','${FIRMWARE_AND_DRIVERS_SRC}','',d)}"
 
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index c69569f..b257ba4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -80,6 +80,7 @@ CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
+    ${@base_contains('ARAGO_BRAND','amsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.7.0.4


