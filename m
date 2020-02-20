Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4D413529FC
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG9rE129862
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226169;
	bh=AnR8LV3GSLqtIwhELQACYLEMD0J9lBql+khoEUHD3pU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pnDZVgWQokDMNQprlHDJiqL37vwxbS5KulawCNDP+kkCxuA/8xEmDnrw/jTFBELFB
	jAZSBn3l9At/CPtDsB2KlW7FGyvhYx3gU4huix+69YdLIwDCjKA3CBIrNrR6QcaNL3
	7/2Fr2Yw5jwQ8d/8EDeeZ6KOaaQ9ULhGaKcBGSEg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJG9t5084150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:09 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:09 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pg017983;
	Thu, 20 Feb 2020 13:16:09 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:54 +0000
Message-ID: <20200220185458.26926-5-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 5/9] arago-test-image: drop unused image recipe
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:10 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-test-image.bb   | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
deleted file mode 100644
index 11421126..00000000
--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# Arago System Test image
-# gives you test applications
-LICENSE = "MIT"
-
-require arago-image.inc
-
-IMAGE_FSTYPES = "tar.xz"
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-base \
-    packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-test \
-    packagegroup-arago-test-addons \
-    "
-
-export IMAGE_BASENAME = "arago-test-image"
-- 
2.17.1


