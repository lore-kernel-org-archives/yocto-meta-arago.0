Return-Path: <a0866189@uda0866189>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 17D68529A4
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 19:52:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KJpd5t114121
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561060299;
	bh=SK2DwVdiWwB8o/6M2SgOmfGYGpL6eVdUTxvdP54Wq6E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RLQ0X+sSsWZAEcQB86UUY1B+M77SnrX4ipCbT970fuyP7oLRvFDyLcZA0u+oPQjgI
	DugyZinvUHW2ZLA72lo/icHcb8QRxJzbRwDcWpUf50FpyhrO4witZb5RmmZXkWmdfj
	BEV6N3Y9bwDVaQGNKmOSmNM4tnfiRjDT1uv1VsWg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KJpdAS073121
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:51:39 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 14:51:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 14:51:38 -0500
Received: from uda0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KJpcno068885;
	Thu, 20 Jun 2019 14:51:38 -0500
Received: from a0866189 by uda0866189 with local (Exim 4.82)
	(envelope-from <a0866189@uda0866189>)
	id 1he35u-0004pA-Rz; Thu, 20 Jun 2019 14:51:38 -0500
From: <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 14:51:15 -0500
Message-ID: <1561060275-18482-2-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561060275-18482-1-git-send-email-angelabaker@ti.com>
References: <1561060275-18482-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-huang@ti.com, sunitan@ti.com
Subject: [thud][PATCH 2/2] packagegroup-arago-tisdk-multimedia: add ti-img-encode-decode for j7-evm
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
X-List-Received-Date: Thu, 20 Jun 2019 19:52:21 -0000
Content-Type: text/plain

From: Angela Stegmaier <angelabaker@ti.com>

The ti-img-encode-decode recipe adds the video decoder driver
module.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb             | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 361dc6c..6f6f1f7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -34,6 +34,11 @@ MULTIMEDIA_append_omap5-evm = " \
     abefw \
 "
 
+MULTIMEDIA_append_j7-evm = " \
+    ti-img-encode-decode \
+    vxd-dec-fw \
+"
+
 ACCEL_FW = ""
 
 ACCEL_FW_append_am57xx-evm = " \
-- 
1.9.1


