Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109F8D73614
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 22:52:55 +0000 (UTC)
Received: from lelvem-ot05.ext.ti.com (lelvem-ot05.ext.ti.com [198.47.23.236])
 by mx.groups.io with SMTP id smtpd.web11.142834.1733007166126892868
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 30 Nov 2024 14:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XWn6xNRR;
 spf=pass (domain: ti.com, ip: 198.47.23.236, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot05.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AUMqiTl1115241
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 30 Nov 2024 16:52:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733007164;
	bh=qKD+Ue8zpp45QwlB0hBc2eXkKlwkpX+SZuc3Davv1Ps=;
	h=From:To:Subject:Date;
	b=XWn6xNRR/bC+Ni0lZdPasLPR8Z1YRoKUWdmADXj4Vd/8okq3xx9OrQJZR0e56lSgs
	 gJN8Z6Mar4pRpWzgFoN8TZcgqrUxC3CIN0B+Rca/4y6kAZzZCZ9/Koi4ywvSHSji+9
	 sKVo9W7X2o8ZnHDVijAVbU0K4Ne3nerTvWhB06ZI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AUMqi68060868;
	Sat, 30 Nov 2024 16:52:44 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 30
 Nov 2024 16:52:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 30 Nov 2024 16:52:44 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AUMqiSQ097528;
	Sat, 30 Nov 2024 16:52:44 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tHWKS-0003gF-1j; Sat, 30 Nov 2024 16:52:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/4] conf: layer.conf: Remove BB_DANGLINGAPPENDS_WARNONLY
Date: Sat, 30 Nov 2024 16:52:41 -0600
Message-ID: <20241130225244.12367-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 30 Nov 2024 22:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15633

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


