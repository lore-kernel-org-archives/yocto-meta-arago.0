Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B3B9052A59
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 12:05:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DC5I48031952
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:05:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DC5Htd018119
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:05:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 07:05:16 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DC5GaC015455;
	Fri, 13 Mar 2015 07:05:16 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YWOL6-0007Q0-IX;
	Fri, 13 Mar 2015 08:05:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2015 08:05:12 -0400
Message-ID: <1426248313-28486-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-console: Change condition for including tslib packages.
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
X-List-Received-Date: Fri, 13 Mar 2015 12:05:18 -0000
Content-Type: text/plain

* Include if wayland is not a DISTRO_FEATURE.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index a7b9f33..e67a9d6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -67,7 +67,7 @@ ARAGO_SDK_PREREQ = "\
 
 ARAGO_CONSOLE = "\
     ${@base_contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_EXTRA}', '',d)} \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', '${ARAGO_TSLIB}', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '', '${ARAGO_TSLIB}', d)} \
     ${ARAGO_NCURSES} \
     ${ARAGO_FSTOOLS} \
     ${ARAGO_UTILS} \
-- 
1.7.9.5


