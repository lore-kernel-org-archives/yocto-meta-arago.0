Return-Path: <a0490844@swubn01>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 678F252A32
	for <meta-arago@arago-project.org>;
	Thu,  3 Jun 2021 03:19:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1533KO8Z106483
	for <meta-arago@arago-project.org>; Wed, 2 Jun 2021 22:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622690424;
	bh=YPW2uy8RxgYOE3cY+F3Jz/YcvkC3tXaqcD9pqNJLlsM=;
	h=From:To:CC:Subject:Date;
	b=n/7ntDh/6oC0YSsOzEcmJnzP9PVUG3uDMTeU9g1ItLmAr6yW7PDJ1b/IbHXRYH5wg
	Uty0XJA0SxV/Xkg/Sk/Nhjk2EmQZQuT7J3BfjCqNuAwlFfdiVzjY+zTHm4eZClDyDt
	VTKqzHJKOo/bIbU3k2j4Lbu9qtQA4RRLwampwJi4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1533KO38022274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 2 Jun 2021 22:20:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 2 Jun 2021 22:20:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 2 Jun 2021 22:20:24 -0500
Received: from swubn01 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1533KNVJ057454;
	Wed, 2 Jun 2021 22:20:23 -0500
Received: from a0490844 by swubn01 with local (Exim 4.90_1)
	(envelope-from <a0490844@swubn01>)
	id 1loduA-00069W-Oo; Thu, 03 Jun 2021 08:50:22 +0530
From: Aparna M <a-m1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 3 Jun 2021 08:50:20 +0530
Message-ID: <20210603032020.23448-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-arago PATCH] tisdk-core-bundle: Install sysfw.itb in the prebuilt-images directory
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
X-List-Received-Date: Thu, 03 Jun 2021 03:19:46 -0000
Content-Type: text/plain

Install the sysfw.itb file in the prebuilt images directory of the
tisdk-core-bundle package.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 253bfbb6..d1bfdc55 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -14,6 +14,7 @@ DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " ti-fs-firmware-j721e-gp.bin"
+DEPLOY_IMAGES_NAME_append_am64xx-evm = " sysfw.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


