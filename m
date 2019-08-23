Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 357EE520DF
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 01:52:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7N1pJ46006110
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 20:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566525079;
	bh=GFz/tSoG67Rov4IwgrFCRpcnmej3ix9KnBBcg1mIBWY=;
	h=From:To:CC:Subject:Date;
	b=R3ezrbT/Y//XT/V14IVoEgpkUGqUb5NfoxH3Ki3Rzkqw9cTbtEDc/+YzCMTM0Gx1+
	ApHjk3LdbcNyp1yhNmeH5CCRJrknp8IhGyOJC5vmX+wU2u5bbAQjss5LB4vYqaJW++
	+doliGDMF+r+O1UQrQc+jkrQMT+L1gYf2scuJFoo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7N1pJSt007064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 20:51:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 20:51:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 20:51:18 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7N1pI9o016781;
	Thu, 22 Aug 2019 20:51:18 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2019 21:51:12 -0400
Message-ID: <20190823015112.17483-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] packagegroup-arago-tisdk-addons*: add tensorflow-lite
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
X-List-Received-Date: Fri, 23 Aug 2019 01:52:19 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend  | 6 +++++-
 .../packagegroup-arago-tisdk-addons.bbappend             | 9 +++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 08f20e4..72f58b1 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk31"
+PR_append = "-tisdk32"
 
 UTILS_append_ti33x = " \
     opencv-dev \
@@ -77,3 +77,7 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-sys-iface \
 "
 
+EXTRA_PACKAGES_append_ti33x = " tensorflow-lite-dev tensorflow-lite-staticdev"
+EXTRA_PACKAGES_append_ti43x = " tensorflow-lite-dev tensorflow-lite-staticdev"
+EXTRA_PACKAGES_append_omap-a15 = " tensorflow-lite-dev tensorflow-lite-staticdev"
+EXTRA_PACKAGES_append_am65xx = " tensorflow-lite-dev tensorflow-lite-staticdev"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index b4d9dc2..c7f654d 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,8 +1,9 @@
-PR_append = "-tisdk55"
+PR_append = "-tisdk56"
 
-EXTRA_PACKAGES_append_ti33x = " opencv"
-EXTRA_PACKAGES_append_ti43x = " opencv"
-EXTRA_PACKAGES_append_omap-a15 = " opencv"
+EXTRA_PACKAGES_append_ti33x = " opencv tensorflow-lite"
+EXTRA_PACKAGES_append_ti43x = " opencv tensorflow-lite"
+EXTRA_PACKAGES_append_omap-a15 = " opencv tensorflow-lite"
+EXTRA_PACKAGES_append_am65xx = " tensorflow-lite"
 EXTRA_PACKAGES_append_keystone = " opencv"
 EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
-- 
2.17.1


