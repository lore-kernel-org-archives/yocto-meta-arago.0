Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA7BE64A8D
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:22:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.18951.1733232167458126505
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 05:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fC1L0Id6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3DMkhe1889239
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 07:22:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733232166;
	bh=qKD+Ue8zpp45QwlB0hBc2eXkKlwkpX+SZuc3Davv1Ps=;
	h=From:To:Subject:Date;
	b=fC1L0Id6t/WvhGHgiOXedLmRcBk44q1jEETNCrtQHVgClIgzxc5DG5oCWwTDRh2/o
	 bIDBWXJHjuuV/HN/r/lsDHLWqDr1VZ7O0E5z8TQ9sx3uc9rarqqiKrCb6XL1CF6jVM
	 Jc0cCOGlUQP7XWlfz6BIajWm95wKwITk5t+a6bwk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3DMk7Q073463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 07:22:46 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 07:22:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 07:22:46 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3DMk5J052897;
	Tue, 3 Dec 2024 07:22:46 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tISrV-0007jj-Th; Tue, 03 Dec 2024 07:22:45 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 1/4] conf: layer.conf: Remove BB_DANGLINGAPPENDS_WARNONLY
Date: Tue, 3 Dec 2024 07:22:42 -0600
Message-ID: <20241203132245.29696-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Dec 2024 13:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15636

Bitbake has dropped support for BB_DANGLINGAPPENDS_WARNONLY [1].

[1] https://git.openembedded.org/bitbake/commit/?id=fca9c9e3cb6f8e9f99bf51dc5e8a8d83f4c84c69

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 08684834..2342f702 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -34,8 +34,6 @@ BBFILES_DYNAMIC += " \
     selinux:${LAYERDIR}/dynamic-layers/selinux/recipes*/*/*.bbappend \
 "
 
-BB_DANGLINGAPPENDS_WARNONLY = "true"
-
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     weston-init->weston \
     weston-init->kbd \
-- 
2.17.1


