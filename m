Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0C3CD52998
	for <meta-arago@arago-project.org>;
	Mon, 12 Sep 2016 17:44:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8CHiX1e017145
	for <meta-arago@arago-project.org>; Mon, 12 Sep 2016 12:44:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8CHiWC5010583
	for <meta-arago@arago-project.org>; Mon, 12 Sep 2016 12:44:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 12:44:32 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8CHiWRb002979;	Mon, 12 Sep 2016 12:44:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Sep 2016 13:43:53 -0400
Message-ID: <1473702234-31756-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-tisdk-connectivity: fix package specification
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
X-List-Received-Date: Mon, 12 Sep 2016 17:44:34 -0000
Content-Type: text/plain

* The machine-specific packages should be appended to the common set.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 047610b..1bf84b7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r34"
+PR = "r35"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -51,7 +51,7 @@ CONNECTIVITY_RDEPENDS = " \
     iproute2-tc \
 "
 
-CONNECTIVITY_RDEPENDS_ti33x = "\
+CONNECTIVITY_RDEPENDS_append_ti33x = "\
     ${WLAN_COMMON} \
     ${DEMO_APPS} \
     ${BLUETOOTH_STACK} \
@@ -59,14 +59,14 @@ CONNECTIVITY_RDEPENDS_ti33x = "\
     bt-firmware \
 "
 
-CONNECTIVITY_RDEPENDS_ti43x = "\
+CONNECTIVITY_RDEPENDS_append_ti43x = "\
     ${WLAN_COMMON} \
     ${DEMO_APPS} \
     ${BLUETOOTH_STACK} \
     ${FIRMWARE_AND_DRIVERS} \
 "
 
-CONNECTIVITY_RDEPENDS_dra7xx = "\
+CONNECTIVITY_RDEPENDS_append_dra7xx = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${FIRMWARE_AND_DRIVERS} \
-- 
2.7.4


