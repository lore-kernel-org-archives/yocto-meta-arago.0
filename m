Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590D8C001DF
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 22:04:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.40697.1697753079469640472
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 15:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pdYJpaFL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JM4b5u059592;
	Thu, 19 Oct 2023 17:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697753077;
	bh=lb9OSzRvbMfyP3iwIi4kp6Z7iMwT8/6zacZFCIyNxbw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pdYJpaFLG+n4KX/nCLMRSgxoyichR/mXwcL/P4gF/kmJzMzWbo4J+Y338gdlIPB6p
	 uQFftRhQL3qS1I6xbm5JoBQzlCjluHKEJTFDM3PwLA0zcn8Iu+xhjhdQUzpZEtR0Wq
	 BMWXpEFAuFXzfjWM3mMOp02ZZYm3t+i3Z3V0fiOY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JM4buc010380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 17:04:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 17:04:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 17:04:37 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JM4b78086117;
	Thu, 19 Oct 2023 17:04:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qtb88-0007X1-Tm; Thu, 19 Oct 2023 17:04:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] packagegroup-arago-base: Add systemd-telnetd package
Date: Thu, 19 Oct 2023 17:04:36 -0500
Message-ID: <20231019220436.28260-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019220436.28260-1-reatmon@ti.com>
References: <20231019220436.28260-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 22:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14960

Add in the new systemd-telnetd package.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index d143f4f3..1971d45c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -17,6 +17,7 @@ ARAGO_BASE = "\
     mtd-utils-ubifs \
     curl \
     initscript-telnetd \
+    systemd-telnetd \
     ethtool \
     thermal-init \
     bash \
-- 
2.17.1


