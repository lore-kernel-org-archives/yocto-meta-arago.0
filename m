Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9E57252990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:19:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFJ0Te004181
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505920740;
	bh=sZgxnQ88FrRyorEipSDrmYvNAgJZidneFP7BVkH7naQ=;
	h=From:To:CC:Subject:Date;
	b=IRXibzuaGBJBWE1qdeZiNSRFqfsLevWV2XhrEIwFRgA5omcppX5L4njINpj0w6l9b
	5oXVSUazSO5JftGO61tpa081/VCTfxlQ5SBxkxpJQecW3L0HD3JSa6NFJo5u1NtSgD
	DhBaqIK8s8hsQ3FInsMscBKbNdJKCXIpqIfxHvno=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFJ0oZ004814
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:19:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:19:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:19:00 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFIxLk030488;
	Wed, 20 Sep 2017 10:19:00 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 11:18:55 -0400
Message-ID: <1505920735-9548-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] packagegroup-arago-*-addons: add icss-emac-lld for k2g-evm
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
X-List-Received-Date: Wed, 20 Sep 2017 15:19:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 3 ++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend            | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
index e477295..038d122 100644
--- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk6"
+PR_append = ".tisdk7"
 
 TEST_ADDONS_TI_append_keystone = " \
     mmap-lld-test \
@@ -29,3 +29,4 @@ TEST_ADDONS_TI_append_ti43x  = " \
 
 TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
+TEST_ADDONS_TI_append_k2g-evm  = " icss-emac-lld-test"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 14e4930..aeabbc0 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk25"
+PR_append = "-tisdk26"
 
 UTILS_append_ti33x = " \
     opencv-dev \
@@ -39,6 +39,11 @@ EXTRA_LIBS_append_k2e-evm = " \
     netapi-staticdev \
 "
 
+EXTRA_LIBS_append_k2g-evm = " \
+    icss-emac-lld-dev \
+    icss-emac-lld-staticdev \
+"
+
 EXTRA_LIBS_append_am57xx-evm = " \
     osal-dev \
     osal-staticdev \
-- 
1.9.1


