Return-Path: <nikhil.nd@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7879C52A23
	for <meta-arago@arago-project.org>;
	Wed, 28 Jan 2015 06:31:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0S6Vm7M010453
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 00:31:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0S6VlbV011403
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 00:31:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 28 Jan 2015 00:31:46 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0S6VjbC000538;
	Wed, 28 Jan 2015 00:31:46 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Jan 2015 12:01:40 +0530
Message-ID: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: karthik.ramanan@ti.com
Subject: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests packages
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
X-List-Received-Date: Wed, 28 Jan 2015 06:31:49 -0000
Content-Type: text/plain

The vpdma-fw and vpe-tests are independent packages now.
Adding them both in the packagegroup.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 6af1321..83ba20e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -44,7 +44,8 @@ ARAGO_TI_TEST_append_omap-a15 = " \
     "
 
 ARAGO_TI_TEST_append_dra7xx = " \
-    vpe-vpdma \
+    vpdma-fw \
+    vpe-tests \
     "
 
 RDEPENDS_${PN} = "\
-- 
1.7.9.5


