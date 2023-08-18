Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1031EE499B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 21:23:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1824.1692393831282260904
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 14:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YU2aUBbz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37ILNoUB083632;
	Fri, 18 Aug 2023 16:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692393830;
	bh=fJTi/qAuZY2r0qQ9zFMsW0sYhvFQnkgzHqWnbqvLgdQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YU2aUBbzETICrn8x+SeShz79fTyqoxrd/95vOk6QRHnmoVlpDEvB3jlZGdr0COs1k
	 tovVmw/ZUTQR9HDr5DCbvLZl8f0c7UINFvJb3xgT8uc2R3mJpI2vkExtu2uglfqhdU
	 EKJJRdN5RHcyUzHX9DknniNjYZfqwsqJoxUFnJRs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37ILNocX019906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Aug 2023 16:23:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Aug 2023 16:23:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Aug 2023 16:23:49 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37ILNn31003592;
	Fri, 18 Aug 2023 16:23:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qX6wf-0000Hs-Oc; Fri, 18 Aug 2023 16:23:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] stream: Add CC to the oe_runmake
Date: Fri, 18 Aug 2023 16:23:48 -0500
Message-ID: <20230818212349.1060-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230818212349.1060-1-reatmon@ti.com>
References: <20230818212349.1060-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Aug 2023 21:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14856

Fix compile issue by controlling which compiler is used.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index cdde9b20..bb4e91b0 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
@@ -16,8 +16,7 @@ S = "${WORKDIR}/git"
 PACKAGES =+ "${PN}-openmp"
 
 do_compile() {
-	# build the release version
-	oe_runmake
+	oe_runmake CC="${CC}"
 }
 
 do_install() {
-- 
2.17.1


