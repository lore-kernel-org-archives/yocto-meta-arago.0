Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 81F46529B5
	for <meta-arago@arago-project.org>;
	Wed, 17 Jun 2015 11:16:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5HBG063024098
	for <meta-arago@arago-project.org>; Wed, 17 Jun 2015 06:16:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5HBG0Cu004082
	for <meta-arago@arago-project.org>; Wed, 17 Jun 2015 06:16:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 06:16:00 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t5HBFx8N003085;	Wed, 17 Jun 2015 06:16:00 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Jun 2015 07:15:56 -0400
Message-ID: <1434539757-28779-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-toolchain-tisdk-target: Add updates for keystone target
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
X-List-Received-Date: Wed, 17 Jun 2015 11:16:03 -0000
Content-Type: text/plain

- Group TISDK toolchain base targets
- Add standalone sdk target for keystone

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-toolchain-tisdk-target.bb   |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 43623b6..d405cc9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -12,11 +12,17 @@ QT_TOOLCHAIN_TARGET = "\
 
 QT_TOOLCHAIN_TARGET_keystone = ""
 
-RDEPENDS_${PN} = "\
-    ${QT_TOOLCHAIN_TARGET} \
+TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-tisdk-multimedia-sdk-target \
     packagegroup-arago-tisdk-connectivity-sdk-target \
     packagegroup-arago-tisdk-crypto-sdk-target \
+"
+
+TISDK_TOOLCHAIN_BASE_TARGET_keystone = "packagegroup-arago-standalone-sdk-target"
+
+RDEPENDS_${PN} = "\
+    ${QT_TOOLCHAIN_TARGET} \
+    ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
-- 
1.7.9.5


