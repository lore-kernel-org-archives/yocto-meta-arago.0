Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AE7E2529D9
	for <meta-arago@arago-project.org>;
	Thu, 26 Feb 2015 23:35:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QNZNw8002464
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 17:35:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QNZLi6012487
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 17:35:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 17:35:21 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1QNZJmV012338;	Thu, 26 Feb 2015 17:35:20 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Feb 2015 18:35:17 -0500
Message-ID: <1424993717-21323-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH] packagegroup-arago-test-addons: Add keystone specific test packages and other test packages
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
X-List-Received-Date: Thu, 26 Feb 2015 23:35:25 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-test-addons.bb              |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 925f157..f577c76 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -7,9 +7,43 @@ inherit packagegroup
 
 TEST_ADDONS = " \
     bridge-utils \
+    linuxptp \
+    openntpd \
+    strongswan \
+    gdb \
     "
 
 TEST_ADDONS_TI = " \
+    cmem-test \
+    "
+TEST_ADDONS_TI_append_keystone = " \
+    qmss-lld-test \
+    pa-lld-test \
+    cppi-lld-test \
+    hyplnk-lld-test \
+    edma3-lld-test \
+    mmap-lld-test \
+    rm-lld \
+    rm-lld-test \
+    sa-lld \
+    sa-lld-test \
+    traceframework-test \
+    multiprocmgr-test \
+    hplib-test \
+    hyplnk-lld-test \
+    nwal-lld \
+    nwal-lld-test \
+    udma-test \
+    mpm-transport-test \
+    "
+
+TEST_ADDONS_TI_append_k2hk-evm = " \
+    srio-lld-test \
+    "
+
+TEST_ADDONS_TI_append_k2l-evm = " \
+    dfe-lld-test \
+    iqn2-lld-test \
     "
 
 RDEPENDS_${PN} = "\
-- 
1.7.9.5


