Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8A85D52A3B
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 21:57:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7TLvhvD025698
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 16:57:43 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7TLvhpt022574
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 16:57:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 16:57:43 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7TLvghT018433;	Fri, 29 Aug 2014 16:57:42 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7TLvXE7031426;	Sat, 30 Aug 2014 03:27:40 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Aug 2014 16:57:20 -0500
Message-ID: <1409349440-20871-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409349440-20871-1-git-send-email-fcooper@ti.com>
References: <1409349440-20871-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] packagegroup-arago-*: Conditionally include tslib
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
X-List-Received-Date: Fri, 29 Aug 2014 21:57:44 -0000
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
index 8d65cac..f756d90 100644
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
+    ${@base_conditional('DISTRO_FEATURES', 'weston', '', '${ARAGO_TSLIB}', d)}  \
     ${ARAGO_NCURSES} \
     ${ARAGO_FSTOOLS} \
     ${ARAGO_UTILS} \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 687de9e..f3882d7 100644
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
+    ${@base_conditional('DISTRO_FEATURES', 'weston', '', 'tslib-dev', d)}  \
     libusb-compat-dev \
     libusb1-dev \
     zlib-dev \
-- 
1.7.9.5


