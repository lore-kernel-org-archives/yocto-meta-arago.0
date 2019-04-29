Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DEB69529EF
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 14:57:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TEvIR6039945
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 09:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556549838;
	bh=KWFqIyf/nzIwKSCe0NnS8U2DN454elCiWEncR8val4U=;
	h=From:To:Subject:Date;
	b=eFIpxdzqGPkxwG/l/zKa83Nc3qRhrl/MknTd60EQA0/VILj9tUq5ZMl41G9Ww16LT
	3pq24mPgMGtF4A0RxfeAVLHBFoUP+9UukomLt3Ax1G3Y+L3cN7lkCgnca3scDL1lAk
	KRV0BV0iY6A/vbLrPs/6HsjHIP4ku2B87zZi21Kc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TEvI94121759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 09:57:18 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 09:57:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 09:57:18 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TEvIAq072819
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 09:57:18 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2019 10:57:13 -0400
Message-ID: <20190429145713.22889-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] Revert "libgbm: Hack gbm.pc.in: add -ldl at Libs"
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
X-List-Received-Date: Mon, 29 Apr 2019 14:57:45 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@UDA0850410>

This reverts commit a27c3dc4d6d80af7d11ae488c0f1eff3ee54aa56. The hack
is no longer needed for QT5.11.
---
 ...dd-ldl-at-Libs-to-pass-the-QT5-confi.patch | 28 -------------------
 recipes-graphics/gbm/libgbm_10.0.0.bbappend   |  7 -----
 2 files changed, 35 deletions(-)
 delete mode 100644 recipes-graphics/gbm/libgbm/0001-Hack-gbm.pc.in-add-ldl-at-Libs-to-pass-the-QT5-confi.patch
 delete mode 100644 recipes-graphics/gbm/libgbm_10.0.0.bbappend

diff --git a/recipes-graphics/gbm/libgbm/0001-Hack-gbm.pc.in-add-ldl-at-Libs-to-pass-the-QT5-confi.patch b/recipes-graphics/gbm/libgbm/0001-Hack-gbm.pc.in-add-ldl-at-Libs-to-pass-the-QT5-confi.patch
deleted file mode 100644
index 80474ad..0000000
--- a/recipes-graphics/gbm/libgbm/0001-Hack-gbm.pc.in-add-ldl-at-Libs-to-pass-the-QT5-confi.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 181e7b8d97acc10c3843b86af8fbc20523715912 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 1 Dec 2016 11:10:00 -0500
-Subject: [PATCH] Hack gbm.pc.in: add -ldl at Libs: to pass the QT5
- config.tests for eglfs_kms
-
-This is a temporary hack to avoid the link error at qtbase/config.tests/qpa/kms
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- gbm.pc.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gbm.pc.in b/gbm.pc.in
-index d7708c7..96b7e5b 100644
---- a/gbm.pc.in
-+++ b/gbm.pc.in
-@@ -7,6 +7,6 @@ Name: gbm
- Description: gbm library
- Requires.private: libudev
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lgbm
-+Libs: -L${libdir} -lgbm -ldl
- Libs.private: -ldl
- Cflags: -I${includedir}/gbm
--- 
-1.7.9.5
-
diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bbappend b/recipes-graphics/gbm/libgbm_10.0.0.bbappend
deleted file mode 100644
index 6f747cd..0000000
--- a/recipes-graphics/gbm/libgbm_10.0.0.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = ".tisdk0"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-	file://0001-Hack-gbm.pc.in-add-ldl-at-Libs-to-pass-the-QT5-confi.patch \
-"
-- 
2.17.1


