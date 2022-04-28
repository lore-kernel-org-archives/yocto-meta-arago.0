Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EBCC433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 17:18:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.407.1651166334679059130
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 10:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Bdk84E1J;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SHIrsa108185;
	Thu, 28 Apr 2022 12:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651166333;
	bh=JxCmtwlrYf1bPZ/XGQccoCCzx+H0W49ldqk1bLMOzKM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Bdk84E1J9EoPTlJ0Mk9TcW2LC9BkTaV9GVC0h/Hm+PO0V2o4feghCc4Q7WUtMtdCv
	 2vLDjNQXxdM3lDhDPd49QUH2oOrZQyV+T89kIf6oWKrlqvSR30mCv3GXio1lOjyE8X
	 F5oRi8OKMfY0ngifYZXz3B+nVis+rmpWiC4INLgY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SHIr1B057535
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 12:18:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 12:18:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 12:18:53 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SHIp7A090758;
	Thu, 28 Apr 2022 12:18:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH v2 3/5] Remove image-prelink from
 sample USER_CLASSES
Date: Thu, 28 Apr 2022 12:18:49 -0500
Message-ID: <20220428171851.19270-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428171851.19270-1-afd@ti.com>
References: <20220428171851.19270-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 17:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13825

Prelinking hasn't worked on ARM in a while so this class was
removed in the latests core master. Remove it here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 sample-files/local-arago64-v2.conf.sample | 4 +---
 sample-files/local-poky-v2.conf.sample    | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v2.conf.sample
index 9549e8a..13585cb 100644
--- a/sample-files/local-arago64-v2.conf.sample
+++ b/sample-files/local-arago64-v2.conf.sample
@@ -112,11 +112,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable 
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
-# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-prelink"
+USER_CLASSES ?= "buildstats"
 
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
index 5cbe6ef..a958055 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -109,11 +109,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable 
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
-# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-prelink"
+USER_CLASSES ?= "buildstats"
 
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
-- 
2.17.1


