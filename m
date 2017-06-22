Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 443E652079
	for <meta-arago@arago-project.org>;
	Thu, 22 Jun 2017 22:39:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MMdQbw018549
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 17:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498171166;
	bh=bakFl0/4W21Sg8S3Gbj4/RpUoN1fkiqmZucCRKIda64=;
	h=From:To:CC:Subject:Date;
	b=OH0W/Ai5nyqKGk9QD4jaOXPvzDV2ntw39S7hv55aKJ6OwHK7KNHbeQ8ZOs56DkVBm
	PoVhjRspUCUtHxVzfw6tgAeRDF99qxpVoATXa+kcTUfpRpN7NT1x6gghLjpsCuuQBP
	MymsKt+DhAHwa3eiF+5L29K9fSPnf1b3c5Wn3KEE=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MMdQWI002402
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 17:39:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:39:25 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5MMdQQM018315;	Thu, 22 Jun 2017 17:39:26 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jun 2017 18:39:18 -0400
Message-ID: <1498171160-26749-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] packagegroup-arago-tisdk-addons: add uio libs and utils for am3/am4
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
X-List-Received-Date: Thu, 22 Jun 2017 22:39:27 -0000
Content-Type: text/plain

* This addition includes uio-module-drv, uio-module-drv-test, and
  uio-test-pruss

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index c623b37..35bf11e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r60"
+PR = "r61"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -37,6 +37,8 @@ UTILS_append_ti33x = " mmc-utils \
                        canutils \
                        switch-config \
                        pru-icss \
+                       uio-module-drv-test \
+                       uio-test-pruss \
 "
 
 UTILS_append_ti43x = " mmc-utils \
@@ -44,6 +46,8 @@ UTILS_append_ti43x = " mmc-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
+                       uio-module-drv-test \
+                       uio-test-pruss \
 "
 
 UTILS_append_omap-a15 = " mmc-utils \
@@ -101,6 +105,14 @@ EXTRA_LIBS_append_keystone = " \
     uio-module-drv \
 "
 
+EXTRA_LIBS_append_ti43x = " \
+    uio-module-drv \
+"
+
+EXTRA_LIBS_append_ti33x = " \
+    uio-module-drv \
+"
+
 DEVTOOLS = " \
     packagegroup-core-buildessential \
     packagegroup-core-tools-debug \
-- 
1.9.1


