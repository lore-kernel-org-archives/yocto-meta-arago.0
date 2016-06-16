Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id A0B7E52990
	for <meta-arago@arago-project.org>;
	Thu, 16 Jun 2016 15:40:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5GFe7Qp003671
	for <meta-arago@arago-project.org>; Thu, 16 Jun 2016 10:40:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5GFe7DQ002063
	for <meta-arago@arago-project.org>; Thu, 16 Jun 2016 10:40:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Jun 2016 10:40:06 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5GFe4dK019812;	Thu, 16 Jun 2016 10:40:05 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jun 2016 21:10:02 +0530
Message-ID: <1466091602-19667-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth, master] packagegroup-arago-test: Remove vpe-tests
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
X-List-Received-Date: Thu, 16 Jun 2016 15:40:08 -0000
Content-Type: text/plain

NOTE: vpe-tests is obsolete.
The alternate (testvpe) is present in meta-arago as
part of the glsdk-example-apps

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb             | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index c701a9f..8ff0399 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -54,10 +54,6 @@ ARAGO_TI_TEST_append_omap-a15 = " \
     ti-ipc-test \
     "
 
-ARAGO_TI_TEST_append_dra7xx = " \
-    vpe-tests \
-    "
-
 ARAGO_TI_TEST_append_keystone = " \
     ti-ipc-test \
     "
-- 
1.9.1


