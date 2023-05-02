Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD472C77B75
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:27:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3143.1683062852011240679
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 May 2023 14:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z6Pj3DMt;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342LROxn074682;
	Tue, 2 May 2023 16:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683062844;
	bh=mN7USO4XOPT5CgNZsfXjaJjN3kAtaCedBfMp6c4PvJs=;
	h=From:To:CC:Subject:Date;
	b=Z6Pj3DMtRKPVTK+vBmVJgw+ULB6MbhXNhCN+I/A8mzPaTh9hcv+F8nFAszhKGFYYW
	 4NCJI22SSPVmraQ6W9xu59v14jVRiSNR9TVwk5iJFaaj9eXhmydwqnm66/glPkd92/
	 ZNpC+/7o66V4X6ngxiJQlq6qHkSeO0c9rPKwR5Dk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342LROJg068112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 16:27:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 16:27:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 16:27:23 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342LRNSd014630;
	Tue, 2 May 2023 16:27:23 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] branding-ltsprep: add the gpu back in
Date: Tue, 2 May 2023 16:25:47 -0500
Message-ID: <20230502212547.1754704-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 May 2023 21:27:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14390

From: Randolph Sapp <rs@ti.com>

The required kernel and recipe changes are present. The GPU swrast
override can now be safely removed.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Please let me know if you would like to keep the GPU disabled for "next"
and "mainline" brands or if I can go ahead and enable it for those as
well. At this point everything should build and run fine, but I don't
know if there are ideals behind these tags that I'll be disrupting.

 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index ee8761f9..6136561e 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -4,11 +4,6 @@ PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
 PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
 PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
 
-# GPU support requires out-of-tree SGX and RGX drivers not available in until
-# LTS prep is complete.  fall back to software rendering
-MACHINE_FEATURES:remove = "gpu"
-PREFERRED_PROVIDER_virtual/gpudriver = ""
-
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
-- 
2.40.0


