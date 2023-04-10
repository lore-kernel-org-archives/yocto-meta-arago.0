Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85E2C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 15:42:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.48776.1681141358297726087
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 08:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mnCzPjfW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AFgbEF115691;
	Mon, 10 Apr 2023 10:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681141357;
	bh=asp9bsCbLaRiZO8E2oFjPdfp2v9z6WWJmJ80IdhzRM8=;
	h=From:To:Subject:Date;
	b=mnCzPjfWSBvROwzYDepPE74bglft3xNkGdeEXuNL77Qv3dHYeDaJ84xRlhsJDUI+T
	 inVPxo+CKlSO5lo7cosXjy9edYxim7gG4JPZIt+eT4huw2u7B4sZPigA57okjYj9gp
	 2z3dQbG4GllpkMUKkF3AvfW+w0grUyvWLzVLXRQ4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AFgbg2006965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 10:42:37 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 10:42:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 10:42:37 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AFgaut127357;
	Mon, 10 Apr 2023 10:42:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pltfA-0002mY-PH; Mon, 10 Apr 2023 10:42:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone] ti-test: Re-enable ltp-ddt and input-utils
Date: Mon, 10 Apr 2023 10:42:36 -0500
Message-ID: <20230410154236.10652-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Apr 2023 15:42:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14298

ltp-ddt and input-utils were disabled to build issues.  Those appear to
be be resolved, so re-add them back into ti-test.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 73250ac8..0b6e1eed 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -50,9 +50,9 @@ ARAGO_TEST:append:armv7ve = " \
 "
 
 #    timestamping
-#    ltp-ddt
-#    input-utils 
 ARAGO_TI_TEST = " \
+    ltp-ddt \
+    input-utils \
     cpuloadgen \
     uvc-gadget \
     arm-benchmarks \
-- 
2.17.1


