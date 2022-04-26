Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA09C43219
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:02:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2327.1651003375461162669
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zk+5RcPN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2skD007889;
	Tue, 26 Apr 2022 15:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651003374;
	bh=JxCmtwlrYf1bPZ/XGQccoCCzx+H0W49ldqk1bLMOzKM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zk+5RcPNQ15dSvcgYzrk6W9guk+D1Q59ad3jIClr5PUPJtIgykce3R5U/vTOLT2Ce
	 h4xnNHIewj6uGRoyeS/G/Tl22/JCr74zR+fpChefU/jilUUJJbGd16Y637HlpFFDDf
	 roT4l2cKowupDzsLJ0eHl9JmBD0FmaLj80WiPO6s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QK2sW5085931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 15:02:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 15:02:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 15:02:52 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2pgZ099348;
	Tue, 26 Apr 2022 15:02:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH 3/6] Remove image-prelink from
 sample USER_CLASSES
Date: Tue, 26 Apr 2022 15:02:48 -0500
Message-ID: <20220426200251.19417-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426200251.19417-1-afd@ti.com>
References: <20220426200251.19417-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13798

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


