Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA24C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:22:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.27803.1681248164022938755
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eFWGQM2R;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLMgPo114320;
	Tue, 11 Apr 2023 16:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681248162;
	bh=pFRbIqyD5EgzaM+LkByDQWw6URraRVJopMsi/JkGw0A=;
	h=From:To:Subject:Date;
	b=eFWGQM2R97gdFhFN2a1CRDAZG0vcIqKLlVFZ+KTvHsp5a6cGnven+7WuuIe8j0wYR
	 /Nas5n2PfwGoYA3QN74go2SdLcjdZTl4mzyRfof112hRhZBLbkKRfK9LX3loYfOtYp
	 xmBvhnk+Yt77ZQJMN4dRmrsyfMHInVit2mC8tzSo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLMgaJ049826
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:22:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:22:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:22:42 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLMgw4059727;
	Tue, 11 Apr 2023 16:22:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pmLRq-0006zf-Em; Tue, 11 Apr 2023 16:22:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] tisdk-base-image: Remove old ubifs requirement for dra7xx
Date: Tue, 11 Apr 2023 16:22:42 -0500
Message-ID: <20230411212242.26843-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14309

All of the other platforms that require ubifs do so in the meta-ti conf
files.  This lone item was placed in meta-arago as a work around, likely
for testing back in 2017, and is no longer needed in our test flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 815dcff8..1a31c9c7 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -6,7 +6,6 @@ DESCRIPTION = "Arago SDK base image suitable for initramfs containing\
 require arago-image.inc
 
 IMAGE_FSTYPES += "cpio.xz"
-IMAGE_FSTYPES:append:dra7xx = " ubifs ubi"
 
 ARAGO_BASE_IMAGE_EXTRA_INSTALL ?= ""
 
-- 
2.17.1


