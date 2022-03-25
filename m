Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C462C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:46:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.627.1648233978144042664
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 11:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gxXZkHLJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PIkHaF104147;
	Fri, 25 Mar 2022 13:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648233977;
	bh=KPkPMnefSg1szX4Cwr3cN9QHvMCkMSS5w/EFKTXIugI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gxXZkHLJT+fJhjq4Toxb15k4pCqIa2uu/zS4a5bF9ZtFVqVRvGyWkHrI6cfxzOCTn
	 6YNnQqnrCuT4sNmPvg1mZKNhE4erCYCxCf/x/NQoOgCmZA1GrTPHbh5l8FHgDYMBqN
	 xiA2Rxou1DMi6ySMkB80hlGFoQuUEz1AvGkDvHSc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PIkHsO037988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 13:46:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 13:46:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 13:46:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PIkFGa031373;
	Fri, 25 Mar 2022 13:46:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/2] arago-prefs: only the j721e SoC is
 currently supported
Date: Fri, 25 Mar 2022 13:46:15 -0500
Message-ID: <20220325184615.17398-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325184615.17398-1-afd@ti.com>
References: <20220325184615.17398-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 25 Mar 2022 18:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13756

There are now three SoCs in the J7 family, but only the j721e variant
is currently supported. Be specific here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-prefs.inc              | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 9c4a533c..65ce2a96 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -14,12 +14,12 @@ PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
 
-# J7 has a Rogue GPU core
-PREFERRED_PROVIDER_virtual/egl:j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1:j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2:j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm:j7 = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver:j7 = "ti-img-rogue-driver"
+# J721e has a Rogue GPU core
+PREFERRED_PROVIDER_virtual/egl:j721e = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1:j721e = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2:j721e = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm:j721e = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver:j721e = "ti-img-rogue-driver"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
 
-- 
2.17.1


