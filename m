Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 062A5529A3
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:46:23 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKkLjA020276
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:46:22 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKkJog017768
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:16:20 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:16:19 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKkGvU015719;
	Sat, 13 Apr 2013 02:16:18 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:46:13 -0500
Message-ID: <1365799574-23621-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] tisdk-connectivity: move ti-wifi-utils
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

* Move the ti-wifi-utils into the drivers and firmware section
  because these utilities depend on the drivers and firmware being
  in place.  Having them in the common section would break builds
  where those packages were not available.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index d936f83..d3b1f46 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -10,7 +10,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # These are the packages that all platforms use for WLAN support
 WLAN_COMMON = "\
     hostap-daemon \
-    ti-wifi-utils \
     wireless-tools \
     htop \
     netperf \
@@ -31,6 +30,7 @@ WLAN_COMMON = "\
 "
 
 FIRMWARE_AND_DRIVERS = "\
+    ti-wifi-utils \
     ti-compat-wireless-wl12xx \
     ti-compat-bluetooth \
     bt-firmware \
-- 
1.7.0.4


