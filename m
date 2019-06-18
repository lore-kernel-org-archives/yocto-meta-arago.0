Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B558A52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 22:17:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IMGctS001998
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 17:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560896198;
	bh=hkQ0tYkDpmuInRqveDoGmc28fNpODnuXWc1jj+K3je4=;
	h=From:To:CC:Subject:Date;
	b=nuFfvsEPfs9IymnTy8SnbOQvaTV0RV5n+0CB2Gu3PY/+mdqMPgePrt5x1kGWAHmQ0
	xIIk33v12YOvG9OWBPHqPJbrzhtzv1nQJB7KQy5DM/e37Mo9+z6LKub/E0RZHP9kKY
	pfpBMCqLsGIfgzxS4D8YOUcireANy2DL7q39fdNg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IMGcPH115013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 17:16:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 17:16:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 17:16:37 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IMGbQR023757;
	Tue, 18 Jun 2019 17:16:37 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Jun 2019 18:14:44 -0400
Message-ID: <20190618221444.23993-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] branding-processor-sdk.inc: add back am571x-idk-pru-excl-uio.dtb
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
X-List-Received-Date: Tue, 18 Jun 2019 22:17:20 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
Please commit this patch after the patch below gets in meta-ti:
http://patchwork.dal.design.ti.com/patch/47846/

 conf/distro/include/branding-processor-sdk.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 72635bf..a5fb1a4 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -57,9 +57,6 @@ KERNEL_DEVICETREE_append_am57xx-hs-evm = " ${AM57XX_KERNEL_DEVICETREE}"
 #KERNEL_DEVICETREE_append_am65xx-evm = " ti/k3-am654-idk-interposer.dtbo"
 #KERNEL_DEVICETREE_append_am65xx-hs-evm = " ti/k3-am654-idk-interposer.dtbo"
 
-# FIXME: temporarily remove broken device tree
-KERNEL_DEVICETREE_remove = "am571x-idk-pru-excl-uio.dtb"
-
 # Configure ROS to use python3
 ROS_USE_PYTHON3 = "yes"
 
-- 
2.17.1


