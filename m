Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 47D54529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:21:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKxwJ032061
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:59 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKxlO017497
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:59 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8CC001355;	Mon, 19 May 2014 14:20:58 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:20:05 -0500
Message-ID: <1400527207-17021-18-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 17/19] packagegroup-arago-tisdk-multimedia: Add accelerator firmwares
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
X-List-Received-Date: Mon, 19 May 2014 19:21:00 -0000
Content-Type: text/plain

* Add the firmware packages for the various accelerators found
  on omap-a15 devices

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bb         |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index d9828b8..e9fdbec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -29,11 +29,26 @@ MULTIMEDIA_append_am37x-evm = " \
     av-examples \
 "
 
+MULTIMEDIA_append_omap5-evm = " \
+    abefw \
+    "
+
 MULTIMEDIA_append_am3517-evm = " \
     av-examples \
 "
 
+ACCEL_FW = ""
+ACCEL_FW_append_omap-a15 = " \
+    ipumm-fw \
+    "
+ACCEL_FW_append_dra7xx-evm = " \
+    dspdce-fw \
+    vis \
+    "
+
+
 RDEPENDS_${PN} = "\
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
+    ${ACCEL_FW} \
 "
-- 
1.7.9.5


