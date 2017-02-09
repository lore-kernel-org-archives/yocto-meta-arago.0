Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1F6CF52AC4
	for <meta-arago@arago-project.org>;
	Thu,  9 Feb 2017 18:35:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v19IZCPV032502
	for <meta-arago@arago-project.org>; Thu, 9 Feb 2017 12:35:12 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v19IZCoj011384
	for <meta-arago@arago-project.org>; Thu, 9 Feb 2017 12:35:12 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 12:35:12 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v19IZC7n022439	for <meta-arago@arago-project.org>;
	Thu, 9 Feb 2017 12:35:12 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Feb 2017 13:35:07 -0500
Message-ID: <1486665307-39968-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-qte-toolchain-target(krogoth/morty): add qtbase-staticdev
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
X-List-Received-Date: Thu, 09 Feb 2017 18:35:18 -0000
Content-Type: text/plain

add qtbase-staticdev so that the qtbase related static libraries lib*.a
, some of which are required for QT application using the custom QPA,
are included at the sysroot package under linux-devkit

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-qte-toolchain-target.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 1264e46..73bae9d 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r10"
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -54,6 +54,7 @@ QT5_DEV = " \
         qtsvg-mkspecs \
         qtxmlpatterns-mkspecs \
         qtbase-dev \
+        qtbase-staticdev \
         qtdeclarative-dev \
         qtscript-dev \
         qtwebkit-dev \
-- 
1.9.1


