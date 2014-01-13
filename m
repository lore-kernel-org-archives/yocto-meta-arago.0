Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 76A1A529AD
	for <meta-arago@arago-project.org>;
	Mon, 13 Jan 2014 22:15:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0DMF3CN018871
	for <meta-arago@arago-project.org>; Mon, 13 Jan 2014 16:15:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMF31p016632
	for <meta-arago@arago-project.org>; Mon, 13 Jan 2014 16:15:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 Jan 2014 16:15:02 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMExVR029026;
	Mon, 13 Jan 2014 16:15:01 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Jan 2014 17:35:21 -0600
Message-ID: <1389656121-31458-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-test: Add vpe-vpdma package
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
X-List-Received-Date: Mon, 13 Jan 2014 22:15:04 -0000
Content-Type: text/plain

* This includes the VPE test program into the file system

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index b6f2896..b7fa806 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 inherit packagegroup
 
@@ -30,6 +30,10 @@ ARAGO_TI_TEST_append_omap-a15 = " \
     libdrm-tests \
     "
 
+ARAGO_TI_TEST_append_dra7xx-evm = " \
+    vpe-vpdma \
+    "
+
 RDEPENDS_${PN} = "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
-- 
1.7.0.4


