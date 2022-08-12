Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C306C25B06
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 02:29:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.6291.1660271342965903460
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 19:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MvchpYOt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27C2T00t061858;
	Thu, 11 Aug 2022 21:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660271340;
	bh=TNwEtKdZok1FgcEC2+s0MpgoQZVB/XNxf84RDPGf1eg=;
	h=From:To:Subject:Date;
	b=MvchpYOtnyfwL2wi9ZVbvMvOiEYRKV4nKcDvTMTpwI9MxIGjyVSamp1ANaCNCWc8C
	 1ncFCjeBF9Z34fGVfBlvCma0l+HgsEae9K7bzudUy8zMgbKqUfAQdJpY88wnhwwZPt
	 9Qq2dYA35aAvJThLMgCgws2f1un1SZhhOnB7faB4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27C2T0RD098131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Aug 2022 21:29:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 21:28:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 21:28:59 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27C2SxKF031331;
	Thu, 11 Aug 2022 21:28:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oMKPz-0005Kr-KC; Thu, 11 Aug 2022 21:28:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] tisdk-core-bundle: Remove .bin
 files from being deployed
Date: Thu, 11 Aug 2022 21:28:59 -0500
Message-ID: <20220812022859.20224-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Aug 2022 02:29:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13977

Remove the .bin files from being deployed as they are not needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 9ebcbb0e..6df454fc 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -19,8 +19,7 @@ DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
-DEPLOY_IMAGES_NAME_append_j7-evm = " ti-fs-firmware-j721e-gp.bin"
+DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


