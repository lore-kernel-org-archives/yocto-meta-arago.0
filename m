Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C9E0B52079
	for <meta-arago@arago-project.org>;
	Thu, 22 Jun 2017 22:39:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MMdZQn032497
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 17:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498171175;
	bh=u30kg9atnodJXKGSU11mnnmxOqea5aNEoQANkbom2og=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CXwksCTiB6EGBq2jqXyFlojsn5++ysNyTRu+RaMTPKo4vOJM0HSYjYQBHUNR0RYeG
	v+4kYRQ30IshI/P4LR+2pdHnh7w/sTNBtS+dmmnXkjFQcrgo6UEDilNrq7jZGbtk4/
	lRBA5Nv8LVnYhg7hId0MgtCtKw9aVCoLgH1YKK8Q=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MMdUgC002445
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 17:39:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:39:29 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5MMdQQN018315;	Thu, 22 Jun 2017 17:39:30 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jun 2017 18:39:19 -0400
Message-ID: <1498171160-26749-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1498171160-26749-1-git-send-email-h-gou@ti.com>
References: <1498171160-26749-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-arago-tisdk-addons-sdk-host: add uio-module-drv-src for am3/am4/am5
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
X-List-Received-Date: Thu, 22 Jun 2017 22:39:46 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index ab3be3d..7c8b000 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r29"
+PR = "r30"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -37,6 +37,7 @@ EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " \
     cmem-mod-src \
     pru-icss-src \
+    uio-module-drv-src \
 "
 
 EXTRA_LIBS_append_dra7xx = " \
@@ -44,6 +45,14 @@ EXTRA_LIBS_append_dra7xx = " \
     gdbserverproxy-module-drv-src \
 "
 
+EXTRA_LIBS_append_ti33x = " \
+    uio-module-drv-src \
+"
+
+EXTRA_LIBS_append_ti43x = " \
+    uio-module-drv-src \
+"
+
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr-mod-src
 EXTRA_LIBS_append_keystone = " \
-- 
1.9.1


