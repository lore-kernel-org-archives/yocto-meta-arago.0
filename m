Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119CDC35FF1
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.11392.1741862432620084227
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jt7CNST8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeVXm1799191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862431;
	bh=aULoWQT2twUzvmImMWDnbfAMgNxSKguWg7pETGRvNfM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jt7CNST8EPLpUWTK9EqXkbcwWo5ZuF2XN+scTckpOr61vC3f2LftzbaaHVhKRgnx2
	 s58LR9tEYBFmM2HuHsN4Y+bJrUB/gujgoEH0UHTOPt/erLPxbzlwRi2lUSKliRxhHz
	 fQS/IRqAjhZgQ7vRzt6paAsjOTzJsLD3TOislSM8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeVpu056866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:31 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeUjn083638;
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzK-0003vN-Ks; Thu, 13 Mar 2025 05:40:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 10/13] libredblack: move and clean up
Date: Thu, 13 Mar 2025 05:40:26 -0500
Message-ID: <20250313104029.14977-11-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16026

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Clean unnecessary comments

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

libredblack cleanup

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo}/libredblack_git.bb                             | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libredblack => recipes-extended/sysrepo}/libredblack_git.bb (62%)

diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
similarity index 62%
rename from meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
index 412d08d8..80283c73 100644
--- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
@@ -10,12 +10,8 @@ SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
 
 S = "${WORKDIR}/git"
 
-# NOTE: if this software is not capable of being built in a separate build directory
-# from the source, you should replace autotools with autotools-brokensep in the
-# inherit line
 inherit python3native autotools
 
-# Specify any options you want to pass to the configure script using EXTRA_OECONF:
-EXTRA_OECONF = " --without-rbgen "
+EXTRA_OECONF = "--without-rbgen"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


