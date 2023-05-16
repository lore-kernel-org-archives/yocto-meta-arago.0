Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51486C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 17:59:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.28986.1684259957185120346
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 10:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wA0BGEqH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GHxEB6083180;
	Tue, 16 May 2023 12:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684259954;
	bh=tMghMSQSiBPQ9zGKqdtycz5ibDNfQfK3d9EZYPDKYF8=;
	h=From:To:Subject:Date;
	b=wA0BGEqHTU5bQyHatXfRvPGc2uYQTqdRDnYur4RGbY6NYPxBrPYeaJZ1KulID+xld
	 Wd5TxwBvAaa2bRlCo2Mssex1t+4tc/DF7/NGC3RmleYSvsWFDkkCB+GvsVyOyV5lyl
	 k53P9kMN4ZuknXaG47sjvELZEgnSSM5wedE3WWDo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GHxE89028094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 12:59:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 12:59:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 12:59:13 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GHxDKP113703;
	Tue, 16 May 2023 12:59:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyyx7-00010d-HX; Tue, 16 May 2023 12:59:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] opencl: stop using "virtual/" in RPROVIDES and RDEPENDS
Date: Tue, 16 May 2023 12:59:13 -0500
Message-ID: <20230516175913.3829-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 17:59:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14414

Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.

That's confusing because "virtual/" has no special meaning in
RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).

Instead, using "virtual-" instead of "virtual/"
as already done in the glibc recipe.

This is inspired by a bug report on oe-core [1], and implemented in a
patch to that repo [2].

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14538
[2] https://git.openembedded.org/openembedded-core/commit/meta/recipes-bsp/grub/grub-bootconf_1.00.bb?id=93ac180d8c389f16964bce8bd5538d9389e970e6

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 7a3819c2..0bdbed7e 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -40,7 +40,7 @@ DEPENDS = " virtual/libgl \
 DEPENDS:append:dra7xx = " ti-ipc virtual/kernel"
 
 RDEPENDS:${PN}-runtime += "bash ${MONITORS}"
-RDEPENDS:${PN}-dev += "virtual/libgl-dev"
+RDEPENDS:${PN}-dev += "virtual-libgl-dev"
 RDEPENDS:${PN} += "${PN}-runtime clocl bash"
 
 # Use main package to pull in full support
-- 
2.17.1


