Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFAFC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 18:19:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.51366.1679509184775595632
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 11:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fHZ4XCQa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32MIJd6R007555;
	Wed, 22 Mar 2023 13:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679509179;
	bh=Vtvx9dkKncduR7rr7WWBspW8UGXk9+8NVaENRVelQII=;
	h=From:To:CC:Subject:Date;
	b=fHZ4XCQaBN8prCs1HH/++/5+MyQqF5UlOBJc+CvUQ8PTQKm66VLAXeKRnVgOQWfnQ
	 d/D2YnoRzpm5RzK9fFpcie8x+7hVyP/ttmjcKs9jbpTYRMK6DepAfojJAZUCv2Iovw
	 4oA+Z+7kzdbgthqNL9RBDaIwJkxdihc381nfypiY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32MIJdGZ003430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Mar 2023 13:19:39 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 22
 Mar 2023 13:19:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 22 Mar 2023 13:19:39 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32MIJcjB021801;
	Wed, 22 Mar 2023 13:19:38 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <g-gupta@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH] tisdk-core-bundle: deploy: Update sysfw binary name
Date: Wed, 22 Mar 2023 23:49:31 +0530
Message-ID: <20230322181931.7982-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Mar 2023 18:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14271

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

The below commit on k3-image-gen adds SYSFW_SUFFIX to sysfw itb binaries.
So add gp/hs while deploying those binaries.
Ref: https://git.ti.com/cgit/k3-image-gen/k3-image-gen/commit/?h=next&id=74f579f706ea53ee83e96a619295b2f3e8cf49c1

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index aa3c3b5b..7180219e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -19,7 +19,7 @@ DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.unsigned"
 DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
+DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x-gp-evm.itb sysfw-am65x_sr2-gp-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


