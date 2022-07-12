Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA54C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 09:01:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6823.1657616459118633469
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 02:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cLJ/phvn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-adivi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26C90wSB067825
	for <meta-arago@lists.yoctoproject.org>; Tue, 12 Jul 2022 04:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657616458;
	bh=6IFmQWxzmPWix0vVauOQqZAkasqS287zPQRWpRQ08rI=;
	h=From:To:CC:Subject:Date;
	b=cLJ/phvn25MyFplR8qp6e5Dzgi+e5k6yUVJ97GM3u5y8FZOO0RkdVJySDkGfuHSK8
	 pJLOabj0el4JdzsxoEkraLGiR72UXCsKJ41rwVFycf/nqhn4blcsQjUqRka8PcgZyx
	 M8w87294mqoHWbcvBMe6jM4SF9b3a0eWmjeR6NZw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26C90w7I075588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 12 Jul 2022 04:00:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Jul 2022 04:00:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Jul 2022 04:00:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26C90v9J122303;
	Tue, 12 Jul 2022 04:00:57 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <khasim@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <dannenberg@ti.com>
Subject: [meta-arago][dunfell][PATCH] tisdk-default-image: Add docker support
Date: Tue, 12 Jul 2022 14:30:56 +0530
Message-ID: <20220712090056.24061-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 Jul 2022 09:01:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13947

Add docker support to tisdk-default-image

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index a84e752c..16772ee9 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -73,4 +73,5 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
+    docker \
 "
-- 
2.17.1


