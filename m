Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75196C77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 19:23:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.103879.1682968970256347392
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 May 2023 12:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B6kPEZmj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 341JMnrH108947;
	Mon, 1 May 2023 14:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682968969;
	bh=cai8ITVQ8BrLeuzS0WLGlawIJr52Viv7fHyCvFNebro=;
	h=From:To:Subject:Date;
	b=B6kPEZmj6D6fyWFT4+vLxolCBHfqsjIJ0enyigyEobrgjIH/PZWCQRKvV1iTszqrF
	 wzqB/WVjZnCXR1LXvOSiPqQgnWAK86Of+g0VLDzBTDXYlQ9uT2jDbAgxfCQh+iilJ4
	 H7seSVvj8OzyrOxE3xQuaAJaL2eUuVg8hsGIv65g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 341JMm0E020072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 May 2023 14:22:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 May 2023 14:22:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 May 2023 14:22:48 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 341JMm4e021706;
	Mon, 1 May 2023 14:22:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ptZ6m-0002q0-JO; Mon, 01 May 2023 14:22:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] branding-ltsprep: Disable mmip
Date: Mon, 1 May 2023 14:22:48 -0500
Message-ID: <20230501192248.10869-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 May 2023 19:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14387

We were already disabling the MACHINE_FEATURES for mmip in
branding-core.  We just missed adding it to ltsprep as well.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index ee8761f9..0f0b6472 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -9,6 +9,9 @@ PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
 MACHINE_FEATURES:remove = "gpu"
 PREFERRED_PROVIDER_virtual/gpudriver = ""
 
+# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
+MACHINE_FEATURES:remove = "mmip"
+
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
-- 
2.17.1


