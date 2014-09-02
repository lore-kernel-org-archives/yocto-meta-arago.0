Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3B916529CF
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 19:07:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82J7V37007276
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:31 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82J7VnV031192
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 14:07:31 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s82J7UDA003336;	Tue, 2 Sep 2014 14:07:31 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s82J7OcW001691;	Wed, 3 Sep 2014 00:37:29 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 14:07:20 -0500
Message-ID: <1409684841-19677-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409684841-19677-1-git-send-email-fcooper@ti.com>
References: <1409684841-19677-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] packagegroup-arago-*: Conditionally include tslib
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
X-List-Received-Date: Tue, 02 Sep 2014 19:07:32 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Weston handles input so no reason to include both Weston and tslib.
* Having both can possibly cause issues or even hide issues.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |    4 ++--
 .../packagegroup-arago-standalone-sdk-target.bb    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 8d65cac..8d322f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -67,7 +67,7 @@ ARAGO_SDK_PREREQ = "\
 
 ARAGO_CONSOLE = "\
     ${ARAGO_ALSA_EXTRA} \
-    ${ARAGO_TSLIB} \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', '${ARAGO_TSLIB}', d)} \
     ${ARAGO_NCURSES} \
     ${ARAGO_FSTOOLS} \
     ${ARAGO_UTILS} \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 687de9e..d4a5072 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r5"
+PR = "r6"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -25,7 +25,7 @@ RDEPENDS_${PN} = "\
     libopkg-dev \
     libpng-dev \
     readline-dev \
-    tslib-dev \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'tslib-dev', d)} \
     libusb-compat-dev \
     libusb1-dev \
     zlib-dev \
-- 
1.7.9.5


