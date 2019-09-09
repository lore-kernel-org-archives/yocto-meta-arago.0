Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1ECBB529E4
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 14:07:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89E6c2o032262
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568037998;
	bh=rJ0jMnZRQWu0L6WTpOF3rdzRDRNMduCJ4eYhWCsqDQk=;
	h=From:To:CC:Subject:Date;
	b=dw4oQ+CXLTPWj8K6aY74MkmO1w+f04dwM2IDDXEPJbCfyKJWah//mGXEQoXVyVTGy
	TvTD600QINGZKYJizbi9t/eDBTt0t1ZmBh9t1Stsww2iCj92syzHsMdAiUmnCODtU0
	Si9aU/y/lA1ARoGZvBnSZIbWxyRzH2VZNjoCUo7I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89E6cV3074325
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:06:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 09:06:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 09:06:37 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89E6bZb109756;
	Mon, 9 Sep 2019 09:06:37 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Sep 2019 10:05:50 -0400
Message-ID: <20190909140550.11227-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] packagegroup-arago-tisdk-addons: package tensorflow-lite-examples
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
X-List-Received-Date: Mon, 09 Sep 2019 14:07:44 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bbappend           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index c7f654d..c02f092 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,9 +1,9 @@
-PR_append = "-tisdk56"
+PR_append = "-tisdk57"
 
-EXTRA_PACKAGES_append_ti33x = " opencv tensorflow-lite"
-EXTRA_PACKAGES_append_ti43x = " opencv tensorflow-lite"
-EXTRA_PACKAGES_append_omap-a15 = " opencv tensorflow-lite"
-EXTRA_PACKAGES_append_am65xx = " tensorflow-lite"
+EXTRA_PACKAGES_append_ti33x = " opencv tensorflow-lite-examples"
+EXTRA_PACKAGES_append_ti43x = " opencv tensorflow-lite-examples"
+EXTRA_PACKAGES_append_omap-a15 = " opencv tensorflow-lite-examples"
+EXTRA_PACKAGES_append_am65xx = " tensorflow-lite-examples"
 EXTRA_PACKAGES_append_keystone = " opencv"
 EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
-- 
2.17.1


