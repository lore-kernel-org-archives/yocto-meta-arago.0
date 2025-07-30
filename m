Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDE3C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 18:53:13 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.43542.1753901593168860785
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 11:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QDn0yYsx;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56UIr9Dq3310436;
	Wed, 30 Jul 2025 13:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753901589;
	bh=QZc39DC4TLXDnYGw2uidOuFFw9NpsxfpEpaqCGk56Vk=;
	h=From:To:CC:Subject:Date;
	b=QDn0yYsxSHyFjdGOrRq6qokOmMG9aFIpXLawMXicqHcmrgH4g4DYjrT5Qivivuv4d
	 kV1dln9t9yDjx5oQd33ZB/XDre0fzuyYIbpMncNXmsgMqEUNbP3ce0+hFkV6Xzb6Qt
	 CYXdyVuDOsz45K/sTWlljMlxR9proKsLpnWbuyuQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56UIr9LJ3392647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 13:53:09 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 13:53:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 13:53:08 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56UIr8js1702202;
	Wed, 30 Jul 2025 13:53:08 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        migsal3222 <migsal3222@ctag.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-extras: arm-compute-library: Switch to archived-releases branch
Date: Wed, 30 Jul 2025 13:53:08 -0500
Message-ID: <20250730185308.1889817-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Jul 2025 18:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16344

From: Miguel Salvatierra Veleiro <miguel.salvatierra3222@ctag.com>

The tag v24.12 from github.com/ARM-software/ComputeLibrary.git is now in
archived-releases branch. Switch to this branch.

Signed-off-by: Miguel Salvatierra Veleiro <miguel.salvatierra3222@ctag.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../arm-compute-library/arm-compute-library_24.12.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
index f4129a75..db376433 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=35f8944fae972976691f3483b0ac9dba"
 
 SRC_URI = " \
-    git://github.com/ARM-software/ComputeLibrary.git;branch=main;protocol=https \
+    git://github.com/ARM-software/ComputeLibrary.git;branch=archived-releases;protocol=https \
     file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
     file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch \
     file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch \
-- 
2.39.2


