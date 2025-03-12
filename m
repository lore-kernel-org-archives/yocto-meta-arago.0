Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63E2C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:08:30 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.39715.1741792106277466871
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tOd/Jw+A;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8OhB1615072
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 10:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792104;
	bh=2a73bMKDGt62efNfVCtt0ZauvbA/owf67Ai6+UHtDa0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tOd/Jw+AYHvuKsOJuQwWhOFXJIVIOIDUqbpuQCm+NkQjoxHw0n1R7u0Hn9CpSUmuC
	 ujrg5NYHZAGVuXxT7+5J+TlcJ5/xw6NvLwpmFeaNxbdczAl/G72YXO4yKIZPGmUAGA
	 k0sbiX2RjcMrbiHIms/hTFbvY6+HnXdN0FpdexQw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8Ohg020202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:08:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:08:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF8O3e034665;
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNh2-0001jB-DY; Wed, 12 Mar 2025 10:08:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 3/6] arm-compute-library: Fix typo in comment
Date: Wed, 12 Mar 2025 10:08:21 -0500
Message-ID: <20250312150824.6579-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312150824.6579-1-reatmon@ti.com>
References: <20250312150824.6579-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 15:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arm-compute-library/arm-compute-library_24.12.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
index 383b02fb..f4129a75 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
@@ -18,7 +18,7 @@ SRCREV = "32bcced2af7feea6969dd1d22e58d0718dc488e3"
 
 S = "${WORKDIR}/git"
 
-# Only compatible with armv7, armv7ve, and aarch64
+# Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE:aarch64 = "(.*)"
 COMPATIBLE_MACHINE:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
-- 
2.17.1


