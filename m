Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0624652981
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:46:23 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKkLOq025448
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:46:22 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKkLxn017773
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:16:21 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:16:21 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKkGvV015719;
	Sat, 13 Apr 2013 02:16:20 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:46:14 -0500
Message-ID: <1365799574-23621-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365799574-23621-1-git-send-email-Chase.Maupin@ti.com>
References: <1365799574-23621-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tisdk-connectivity: remove drivers and firmware for ti33x
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
X-List-Received-Date: Fri, 12 Apr 2013 20:46:24 -0000
Content-Type: text/plain

* Remove the drivers and firmware packages for ti33x until they
  have been updated to work with the latest v3.8 kernel.  This is
  in preparation to switch the default kernel to the v3.8 kernel.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 +--
 .../packagegroup-arago-tisdk-connectivity.bb       |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 0d9b242..1ca6ddd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -17,7 +17,6 @@ CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_am37x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
 CONNECTIVITY_RDEPENDS_am180x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
-CONNECTIVITY_RDEPENDS_ti33x = "${FIRMWARE_AND_DRIVERS_SRC}"
 
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index d3b1f46..3902611 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -77,7 +77,6 @@ CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
-    ${FIRMWARE_AND_DRIVERS} \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.7.0.4


