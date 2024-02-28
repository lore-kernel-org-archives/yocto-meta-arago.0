Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354ECC54798
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 02:14:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4286.1709086445739955085
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 18:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UVpr9f+I;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41S2E4cL054575;
	Tue, 27 Feb 2024 20:14:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709086444;
	bh=8P+kJmHfbabN9qllpu1HKVK0laLwd5znQbsSlwxrRoI=;
	h=From:To:Subject:Date;
	b=UVpr9f+IlSO9OL/mWnFt4hE2QkE4fxmKMOMiAqGhqkhmsqCk63Mfhb2l2ujszZ2rt
	 a5G7qSVmYjwgTB6W5rnHfubiy1gOGVJLF1s2ckCGK86wR23eHTWnH4olRPPnAhjb/x
	 fcK0tvrTV0k8ll5U8xa5vwuNQpgdQh29GyBVbixM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41S2E41p031910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Feb 2024 20:14:04 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Feb 2024 20:14:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Feb 2024 20:14:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41S2E4GB029042;
	Tue, 27 Feb 2024 20:14:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rf9SN-0001Kr-Vk; Tue, 27 Feb 2024 20:14:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] branding-ltsprep: Disable graphics for SGX platforms
Date: Tue, 27 Feb 2024 20:14:03 -0600
Message-ID: <20240228021403.5094-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Feb 2024 02:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15212

We are not ready to update the older SGX drivers to work with the 6.6
kernel.  Disable the graphics on these platforms for the ltsprep builds
until we are ready to fix them.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../conf/distro/include/branding-ltsprep.inc              | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 59eb116e..1298bda1 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -10,3 +10,11 @@ MACHINE_FEATURES:remove = "mmip"
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
+
+PREFERRED_PROVIDER_virtual/gpudriver:am335x-evm = ""
+PREFERRED_PROVIDER_virtual/gpudriver:am335x-hs-evm = ""
+PREFERRED_PROVIDER_virtual/gpudriver:am437x-evm = ""
+PREFERRED_PROVIDER_virtual/gpudriver:am437x-hs-evm = ""
+PREFERRED_PROVIDER_virtual/gpudriver:am57xx-evm = ""
+PREFERRED_PROVIDER_virtual/gpudriver:am57xx-hs-evm = ""
+PREFERRED_PROVIDER_virtual/gpudriver:am65xx-evm = ""
-- 
2.17.1


