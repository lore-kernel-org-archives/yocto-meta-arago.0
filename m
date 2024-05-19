Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5ACC25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 13:36:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.38565.1716125806716512730
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 19 May 2024 06:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sVvGwGCB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44JDadcf116126;
	Sun, 19 May 2024 08:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716125799;
	bh=7kU5cmijiBYUgOy8v0y8UnJoxMDI2YixJwSmkpcTlJc=;
	h=From:To:CC:Subject:Date;
	b=sVvGwGCBKQr23eXE408JXz2SZcsss3dC2/pcrxY9N/K3PStDpZJIktd5gDtHRV8G1
	 7Om1JgfhLKIsXnYe1iWDNS2SREJP0+Pw2GSXvCA5gaj0wr5tkXZgfSVsp4zhI53eiU
	 uzCmSTRZ034Klx9KfYDpuHj97UItcpA6Dz3yxuIw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44JDadfD024193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 May 2024 08:36:39 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 19
 May 2024 08:36:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 19 May 2024 08:36:38 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44JDabxU080881;
	Sun, 19 May 2024 08:36:38 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>, Paresh <p-bhagat@ti.com>,
        Suhaas
	<s-joshi@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: packagegroups: Add python3-pip
Date: Sun, 19 May 2024 19:06:31 +0530
Message-ID: <20240519133631.1722288-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 19 May 2024 13:36:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15335

- python3-pip helps developers to test and deploy huge
numbers of python3 applications in short time.

- Also, we had a customer suggestion in past to package
python3-pip in tisdk-default-image [1]

[1]: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1194285/processor-sdk-am64x-need-help-on-network-manager-and-modem-manager

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8dbffa81..07ad6190 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -79,6 +79,7 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
     ccief-basic \
+    python3-pip \
 "
 
 EXTRA_PACKAGES:omapl138 = " \
-- 
2.34.1


