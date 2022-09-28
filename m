Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202ACC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 20:44:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2950.1664397836632089757
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 13:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zIBV/8+c;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SKhss3115788;
	Wed, 28 Sep 2022 15:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664397834;
	bh=VDO2dPumjxgoLb7VCrORFVUGsLRpSdKE6thf28NMVhU=;
	h=From:To:Subject:Date;
	b=zIBV/8+cQvs9i5H5IgW61wycl9L3sOjZha/EMkFZRpPBBHNZ5vGCbM1hoUeRyTj/V
	 TeBpJKO0efSvw/DbzFxEAFVQpoCKpuZeue7Yt2tEyelsCbMwCnRSjWBkW5Dq7Im4BJ
	 yB0wLMUdQof6Lq5aXObzgaVPqV8M6KMx+zBEKfX0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SKhseq024438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Sep 2022 15:43:54 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 15:43:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 15:43:54 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SKhsxj022417;
	Wed, 28 Sep 2022 15:43:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1odduM-0006k4-As; Wed, 28 Sep 2022 15:43:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] oe-layer-setup.sh: restore number of
 threads to max
Date: Wed, 28 Sep 2022 15:43:54 -0500
Message-ID: <20220928204354.25876-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Sep 2022 20:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14046

We are no longer using VMs for building and so should not need
to reduce the number of threads down by 75%.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 oe-layertool-setup.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index e404290..1ea31c3 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -770,9 +770,8 @@ EOM
 
     # set the number of threads
     threads=`cat /proc/cpuinfo | grep -c processor`
-    tnum=`expr \( ${threads} + 1 \) \* 75 / 100`
-    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${tnum}\"/" $confdir/local.conf
-    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${tnum}\"/" $confdir/local.conf
+    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${threads}\"/" $confdir/local.conf
+    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${threads}\"/" $confdir/local.conf
 
     # Find if old DL_DIR was set
     if [ -e $confdir/local.conf.bak ]
-- 
2.17.1


