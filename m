Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ED1A252A0E
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2019 17:00:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72H00pU078841
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 12:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564765200;
	bh=CSYpNnYrSL3Q1wqHxRYX781VQxyVVP/XwYIU+sq4Oog=;
	h=From:To:CC:Subject:Date;
	b=IJ8BWVoLj9sN81fejSVdYZcXgKlDM+6Umc+gWEQT71MnHfsQIomOMZ1ODsnHnnrnB
	kUzVRpkgnGQwJU2Nsms7FQLHQzYPXbMRhZSmmKSnQS4omKSnYUg2MXccQJ80CYw/LX
	q8cu5R5jwBOm5baWZHeGulBQSjSoDn3VRfGgL4j0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72H00Oe072565
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 12:00:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 12:00:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 12:00:00 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72GxxjK002826;
	Fri, 2 Aug 2019 12:00:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 2 Aug 2019 12:43:21 -0400
Message-ID: <1564764201-26413-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] arago-core-tisdk-image: migrate to "bundle" naming
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
X-List-Received-Date: Fri, 02 Aug 2019 17:00:56 -0000
Content-Type: text/plain

* Following meta-arago, migrate SDK to "bundle" moniker instead of
  "image".

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...dk-image-sw-manifest.inc => arago-core-tisdk-bundle-sw-manifest.inc} | 0
 ...arago-core-tisdk-image.bbappend => arago-core-tisdk-bundle.bbappend} | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename recipes-core/images/{arago-core-tisdk-image-sw-manifest.inc => arago-core-tisdk-bundle-sw-manifest.inc} (100%)
 rename recipes-core/images/{arago-core-tisdk-image.bbappend => arago-core-tisdk-bundle.bbappend} (98%)

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


