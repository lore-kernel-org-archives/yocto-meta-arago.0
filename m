Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7FFC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 16:29:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.9791.1657816190134059655
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Jul 2022 09:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aP8GIRX8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26EGTnvE012679;
	Thu, 14 Jul 2022 11:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657816189;
	bh=N8AJBoaJQD75G/00z5k0991KTFAqDguGBEc5N6AdHVI=;
	h=From:To:Subject:Date;
	b=aP8GIRX8RzhJZX0EvhPaVfbo6X7RhahDjnCl2JEvOUDa+DvvngOxyYnh5XvoJEY3M
	 5m52Wn814AHwjHpm3lxvoSGyjd+G14aJJVXwVTbgCgYt2FcZfjN3GBmk3B+mDneHAf
	 JBexHcriyvkfRawifLEVgBzUXN174j6teGTsaZTc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26EGTnWH000463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Jul 2022 11:29:49 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 14
 Jul 2022 11:29:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 14 Jul 2022 11:29:48 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26EGTmmK105758;
	Thu, 14 Jul 2022 11:29:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oC1im-00089T-HI; Thu, 14 Jul 2022 11:29:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] packagegroups: Mirror ti-test change
 from meta-ti
Date: Thu, 14 Jul 2022 11:29:48 -0500
Message-ID: <20220714162948.31295-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Jul 2022 16:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13949

A change in meta-ti locks the viddec-test and videnc-test to j7-evm
and j7-hs-evm, so we need to mirror that requirement in the
packagegroup.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 434ed559..53a8cd47 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -83,6 +83,14 @@ ARAGO_TI_TEST_append_k3 = " \
 
 ARAGO_TI_TEST_append_j7 = " \
     ufs-utils \
+"
+
+ARAGO_TI_TEST_append_j7-evm = " \
+    viddec-test-app \
+    videnc-test-app \
+"
+
+ARAGO_TI_TEST_append_j7-hs-evm = " \
     viddec-test-app \
     videnc-test-app \
 "
-- 
2.17.1


