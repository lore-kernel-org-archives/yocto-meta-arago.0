Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D6BD637C4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 21:06:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22431.1731531970216528504
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 13:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wxjbkqYN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL69NX044044;
	Wed, 13 Nov 2024 15:06:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731531969;
	bh=VrP99GQuAUv5JNqfjwSK7CIMu333twz0WUArT7dlLCE=;
	h=From:To:Subject:Date;
	b=wxjbkqYNFBCJEX5VyzLxJhIhKXIKIOiXXIbFHwM/gC1u2ExdxeFU+X8G6IjjbUVcI
	 IM00x3M/TD649AETzjMWFE8cu24zmqHIPh9F3eT8NyjrbHBK7g3Xh9RvyNe76dH5ET
	 UV4ZaOsLOQZUxljrY9cFz6KffkW9jVczk02wJhOs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ADL69Vc104573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Nov 2024 15:06:09 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 15:06:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 15:06:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL68wx115960;
	Wed, 13 Nov 2024 15:06:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tBKYy-0000lf-Hh; Wed, 13 Nov 2024 15:06:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 1/5] .gitignore: Fix paths
Date: Wed, 13 Nov 2024 15:06:04 -0600
Message-ID: <20241113210608.2907-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 21:06:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15603

We really want to ignore the paths in the .gitignore as if a build was
run in this directory.  So that means we should anchor the entries to
the top using /.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .gitignore | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index db9d2d8..5ccd768 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,7 +1,6 @@
-build
-conf
-sources
-downloads
-bitbake.lock
-pseudodone
+/build
+/sources
+/downloads
+/bitbake.lock
+/pseudodone
 *.dot
-- 
2.17.1


