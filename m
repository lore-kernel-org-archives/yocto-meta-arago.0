Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 739EF52A6B
	for <meta-arago@arago-project.org>;
	Fri,  7 Aug 2015 22:26:35 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSQ00I0QGZ1N270@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 07 Aug 2015 17:26:14 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=OLfXduodISX5ylVIfhMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 22186161B4F;	Fri,
	7 Aug 2015 18:25:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 07 Aug 2015 18:25:48 -0400
Message-id: <1438986348-18618-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [fido/master][PATCH] image, packagegroup: remove wireless-compat as it's gone now
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
X-List-Received-Date: Fri, 07 Aug 2015 22:26:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc  |  1 -
 ...ackagegroup-arago-tisdk-connectivity-sdk-host.bb | 21 ---------------------
 .../packagegroup-arago-tisdk-connectivity.bb        |  1 -
 3 files changed, 23 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index efd45e9..df6265d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -42,7 +42,6 @@ IMAGE_INSTALL_QT_keystone = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
-    packagegroup-arago-tisdk-connectivity-sdk-host \
     packagegroup-arago-tisdk-crypto-sdk-host \
     packagegroup-arago-tisdk-graphics-sdk-host \
     packagegroup-arago-tisdk-matrix-sdk-host \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
deleted file mode 100644
index 50fe2ba..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
-LICENSE = "MIT"
-PR = "r12"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-FIRMWARE_AND_DRIVERS_SRC = "\
-"
-#    ti-compat-wireless-wl18xx-src 
-
-CONNECTIVITY_RDEPENDS = ""
-
-CONNECTIVITY_RDEPENDS_ti33x = "${FIRMWARE_AND_DRIVERS_SRC}"
-
-CONNECTIVITY_RDEPENDS_ti43x = "${FIRMWARE_AND_DRIVERS_SRC}"
-
-RDEPENDS_${PN} = "\
-    ${CONNECTIVITY_RDEPENDS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index a50cae1..947ab34 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -34,7 +34,6 @@ WLAN_COMMON = "\
 FIRMWARE_AND_DRIVERS = "\
     wl18xx-firmware \
 "
-#    ti-compat-wireless-wl18xx 
 
 DEMO_APPS = "\
     ${@base_conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
-- 
2.2.0


