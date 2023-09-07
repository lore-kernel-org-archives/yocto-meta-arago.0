Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57A0EC8754
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:53:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21626.1694112795971027137
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 11:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EkYDnDte;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 387IrEv5095940;
	Thu, 7 Sep 2023 13:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694112794;
	bh=+lRJ9vNiJTM93+rTMqTFqWyrdUJJPkoyuIFBooDq3Qc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EkYDnDteXUqq9sTYWtnl8v0cV1/YFQJgo6Zl30Z+mBUazIAb3bCecnm7gA5IkAC5C
	 9s3yyCszjKhV0NH+jiCYaUIyvtyEmMmw+58dwzUwwLmvqZSQjxOSy51wBXvN0xceHH
	 NmRolwqboLgu+jnZ35D/9mDBvqz0vu/jukpeaQ7s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 387IrERq043520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Sep 2023 13:53:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Sep 2023 13:53:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Sep 2023 13:53:13 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 387IrDJl067582;
	Thu, 7 Sep 2023 13:53:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qeK7t-0004Ml-GP; Thu, 07 Sep 2023 13:53:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v4 4/4] ti-test: Add lsof and dosfstools
Date: Thu, 7 Sep 2023 13:53:12 -0500
Message-ID: <20230907185312.16718-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230907185312.16718-1-reatmon@ti.com>
References: <20230907185312.16718-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Sep 2023 18:53:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14893

Testing with poky shows that we were missing some needed utilities
that our internal tests were calling.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 44f4f75d..04ec033b 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -11,6 +11,7 @@ TI_TEST_BASE = "\
     bridge-utils \
     cryptodev-tests \
     dma-heap-tests \
+    dosfstools \
     evtest \
     fio \
     git \
@@ -20,6 +21,7 @@ TI_TEST_BASE = "\
     libdrm-tests \
     linuxptp \
     lmbench \
+    lsof \
     memtester \
     mstpd \
     mtd-utils-ubifs-tests \
-- 
2.17.1


