Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EA3CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 18:16:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1761.1761157010177208229
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 11:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CfuwE8pL;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MIGnjH1479791
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 13:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761157009;
	bh=qydLOcMJN3FVyfKbOy71o0F/w3UiDVq1lYlVeJg/75w=;
	h=From:To:Subject:Date;
	b=CfuwE8pLV34ml8UHxhQDNcZNqA0mmHCTQfAj2/q8G4I3/4mN3aTmLZ0nv8r+OkdSD
	 /kQxTu3e2af7l+Bppx+DyfMBOvYAMNdp4XOIE67/lWP5tqYxibpuwdJ96vDwipJgtW
	 EtnerTTLPbZvpr0BeMQCPsOvh19KLuEkg40HHeVQ=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MIGnaC2118596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 13:16:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 13:16:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 13:16:49 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MIGnSk1628449;
	Wed, 22 Oct 2025 13:16:49 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH]  packagegroup-arago-standalone-sdk-target: Remove duplicate opkg-dev
Date: Wed, 22 Oct 2025 13:16:48 -0500
Message-ID: <20251022181648.2411290-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 18:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16699

From: Antonios Christidis <a-christidis@ti.com>

Remove duplicate opkg-dev.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroups/packagegroup-arago-standalone-sdk-target.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 88c022ee..baa2a4bc 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -30,6 +30,5 @@ RDEPENDS:${PN} = "\
     libusb1-dev \
     zlib-dev \
     ncurses-dev \
-    opkg-dev \
     util-linux-dev \
 "
-- 
2.34.1


