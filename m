Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6DE3052A60
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 21:04:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86L4GUW022442
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536267856;
	bh=/kkQc1pQr+HGZsGuakeb/XzixFDbFPqf8GeYj0sBDWM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zac8jSrdtivh50YczH5BQOsQFv7oglj/61QGgzDFOZvYLg3YK7ocvNHpJBsBNWjQw
	Qz+L/lKI+RPrsNuAjQHnaJ/QRy4lgxKUXuxjLUfRliwSiroag9Pq3d8MTBZ6w1fwGy
	wBSf/tm766tdA9k22yDbXaVpmcgXr68TQEAHj20I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4GHK005081
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 16:04:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 16:04:16 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4Ehj009473;
	Thu, 6 Sep 2018 16:04:15 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Sep 2018 17:04:11 -0400
Message-ID: <1536267851-5510-6-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536267851-5510-1-git-send-email-a0271529@ti.com>
References: <1536267851-5510-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 5/5] packagegroup-arago-tisdk-addons*: add pru-adc
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
X-List-Received-Date: Thu, 06 Sep 2018 21:04:26 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend   | 4 +++-
 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index cc49a0c..b490cb7 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk10"
+PR_append = ".tisdk11"
 
 EXTRA_LIBS_append_am57xx-evm = " \
     jailhouse-src \
@@ -15,3 +15,5 @@ UTILS_append_k2g = " \
 EXTRA_LIBS_append_dra7xx = " \
     tiovx-app-host-src \
 "
+
+UTILS_append_ti33x = " pru-adc-src"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index fd6177c..7114190 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk48"
+PR_append = "-tisdk49"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -7,7 +7,7 @@ EXTRA_PACKAGES_append_keystone = " opencv"
 EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
 
-EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps"
+EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps pru-adc"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples \
-- 
1.9.1


