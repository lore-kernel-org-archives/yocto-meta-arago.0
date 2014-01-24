Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5739C52A20
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 17:02:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OH2JjK005970
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 11:02:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OH2JXI019684
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 11:02:19 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 11:02:18 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OH2D8S005027;
	Fri, 24 Jan 2014 11:02:17 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jan 2014 12:26:29 -0600
Message-ID: <1390587989-27547-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390587989-27547-1-git-send-email-fcooper@ti.com>
References: <1390587989-27547-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] packagegroup-arago-tisdk-connectivity*: Adding back some Bluetooth packages
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
X-List-Received-Date: Fri, 24 Jan 2014 17:02:20 -0000
Content-Type: text/plain

* Some Bluetooth packages are still needed that were removed via the commit
  55a41593221c23729760c40de87ac14943c9eeb9

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...agegroup-arago-tisdk-connectivity-sdk-target.bb |   10 ++++++++--
 .../packagegroup-arago-tisdk-connectivity.bb       |   12 ++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index a7bcd56..540bc80 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,19 +1,25 @@
-DESCRIPTION = "Task to install wlan headers and libraries into the SDK"
+DESCRIPTION = "Task to install wireless headers and libraries into the SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+BLUETOOTH_STACK = "\
+    bluez4-dev \
+"
+
 CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_ti33x  = "\
     wpa-supplicant-wl18xx-dev \
+    ${BLUETOOTH_STACK} \
 "
 
 CONNECTIVITY_RDEPENDS_ti43x  = "\
     wpa-supplicant-wl18xx-dev \
+    ${BLUETOOTH_STACK} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 622e9e4..8e0be5b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "Task to install wlan packages into the target FS"
+DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r21"
+PR = "r22"
 
 inherit packagegroup
 
@@ -37,17 +37,25 @@ DEMO_APPS = "\
     wpa-gui-e \
 "
 
+BLUETOOTH_STACK = "\
+    bluez4 \
+    bluez4-agent \
+    bluez-hcidump \
+"
+
 CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
     ${DEMO_APPS} \
+    ${BLUETOOTH_STACK} \
     ${FIRMWARE_AND_DRIVERS} \
 "
 
 CONNECTIVITY_RDEPENDS_ti43x = "\
     ${WLAN_COMMON} \
     ${DEMO_APPS} \
+    ${BLUETOOTH_STACK} \
     ${FIRMWARE_AND_DRIVERS} \
 "
 
-- 
1.7.0.4


