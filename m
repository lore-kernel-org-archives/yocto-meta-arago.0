Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED48EC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:39:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.578.1714513153049567345
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 14:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EJjOIUwr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ULdCTD103579;
	Tue, 30 Apr 2024 16:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714513152;
	bh=fSMllx+ClVdtSAc9bX3B1M81gbOl86STX2AjtWsbg8c=;
	h=From:To:CC:Subject:Date;
	b=EJjOIUwre381SBWKIkvpbI7C+BPldPOKNnxzU6c+LpTLskbMkOWKgQ2lNb6TdRQOD
	 iLVrD8VaxmdkmmKo/BLRA4CXYHHgSriO1WfWu6GPDgY5Uk3fuMeR5/vE2a/4LDNChL
	 R7TerNMtIyohnup/J5xkFdKLc+mzDqSLH4N1aLr8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ULdCQh009681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 16:39:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 16:39:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 16:39:11 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ULdBac085074;
	Tue, 30 Apr 2024 16:39:11 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] branding-ltsprep: enable newer pvr drivers
Date: Tue, 30 Apr 2024 16:39:10 -0500
Message-ID: <20240430213910.3697337-1-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Apr 2024 21:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15317

From: Randolph Sapp <rs@ti.com>

The newer drivers require a dt binding change for platforms that is only
present in the ltsprep kernel. Enable them with the new kernel here.

Also pull in the newer pvr-mesa package here as well. It's not strictly
required for this driver version but it is recommended. It still needs
some attention with regards to SGX so it will not be enabled by default
right now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 1298bda1..4853f3c6 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -3,6 +3,9 @@ PREFERRED_VERSION_linux-ti-staging = "6.6%"
 PREFERRED_VERSION_linux-ti-staging-rt = "6.6%"
 PREFERRED_VERSION_linux-ti-staging-systest = "6.6%"
 PREFERRED_VERSION_u-boot-ti-staging = "2024.04%"
+PREFERRED_VERSION_ti-img-rogue-umlibs = "24.1.6554834"
+PREFERRED_VERSION_ti-img-rogue-driver = "24.1.6554834"
+PREFERRED_VERSION_mesa-pvr = "23.2.1"
 
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
 MACHINE_FEATURES:remove = "mmip"
-- 
2.44.0


