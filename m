Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BCEAA52A05
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2019 17:23:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72HN2G5045676
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 12:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564766582;
	bh=3+jH8X4IgVlzTs5LfE5D/krAKgULu2YKnM/U3ie06+U=;
	h=From:To:CC:Subject:Date;
	b=C7SncVgIL+gihDqsRGJ8BZZQHim5ecfwF4JMgqP/wI21jrXRjfKm33EkK63llIiHc
	vk+9iAuBPwSZzpuY/pPqAb7Li0G1vizKAX07OShKD0ndK97I/SZyVGKsymu2Ov7Brn
	gO60KTNJmlri2SW1HWHAYHsAohirMVu2LD+XCL8A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72HN1XS114733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 12:23:02 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 12:23:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 12:23:01 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72HN0SF041503;
	Fri, 2 Aug 2019 12:23:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 2 Aug 2019 13:06:20 -0400
Message-ID: <1564765580-28669-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2] arago-core-tisdk-image: migrate to "bundle" naming
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
X-List-Received-Date: Fri, 02 Aug 2019 17:24:01 -0000
Content-Type: text/plain

* Following meta-arago, migrate SDK to "bundle" moniker instead of
  "image".

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Also change "ARAGO_TISDK_IMAGE" string

 conf/distro/include/branding-processor-sdk.inc                          | 2 +-
 ...dk-image-sw-manifest.inc => arago-core-tisdk-bundle-sw-manifest.inc} | 0
 ...arago-core-tisdk-image.bbappend => arago-core-tisdk-bundle.bbappend} | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-core/images/{arago-core-tisdk-image-sw-manifest.inc => arago-core-tisdk-bundle-sw-manifest.inc} (100%)
 rename recipes-core/images/{arago-core-tisdk-image.bbappend => arago-core-tisdk-bundle.bbappend} (98%)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index e40fd93..dc48fff 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -1,4 +1,4 @@
-ARAGO_TISDK_IMAGE = "processor-sdk-linux${ARAGO_KERNEL_SUFFIX}-image"
+ARAGO_TISDK_IMAGE = "processor-sdk-linux${ARAGO_KERNEL_SUFFIX}-bundle"
 
 INHERIT += "recipe-data"
 
diff --git a/recipes-core/images/arago-core-tisdk-image-sw-manifest.inc b/recipes-core/images/arago-core-tisdk-bundle-sw-manifest.inc
similarity index 100%
rename from recipes-core/images/arago-core-tisdk-image-sw-manifest.inc
rename to recipes-core/images/arago-core-tisdk-bundle-sw-manifest.inc
diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-bundle.bbappend
similarity index 98%
rename from recipes-core/images/arago-core-tisdk-image.bbappend
rename to recipes-core/images/arago-core-tisdk-bundle.bbappend
index 4a966f8..bcc7285 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-bundle.bbappend
@@ -111,4 +111,4 @@ tisdk_image_build_append () {
     fi
 }
 
-require arago-core-tisdk-image-sw-manifest.inc
+require arago-core-tisdk-bundle-sw-manifest.inc
-- 
2.7.4


