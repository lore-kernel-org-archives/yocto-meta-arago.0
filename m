Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A9C27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 15:40:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25029.1717515625983481763
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 08:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kUOjH8Tl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454FeOCC094740;
	Tue, 4 Jun 2024 10:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717515624;
	bh=G1rtd0fhjTVM0gllkNYdA0GzXoXW/I1SZXxoRJcM1Zo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kUOjH8TlOJMbf7gp41bwFuaXVI2XvOzqziz1nMIrzbqQNzudeLqRRqsHpX2Kr64uB
	 Q09VlLCZCfCF6BAe5wcR/bwUzl4bI7mKN7rxou/ISxQiF9GMEFQSMhFYzyzKkLHFQA
	 XCOXnKpcifgzVz+w4serqHmAfde1WFaY0oV8tyKc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454FeOVf016982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 10:40:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 10:40:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 10:40:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454FeOqo063028;
	Tue, 4 Jun 2024 10:40:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEWGu-0003En-Eg; Tue, 04 Jun 2024 10:40:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] hevc-arm-decoder: Update to UNPACKDIR for files going into WORKDIR
Date: Tue, 4 Jun 2024 10:40:24 -0500
Message-ID: <20240604154024.12402-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240604154024.12402-1-reatmon@ti.com>
References: <20240604154024.12402-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 15:40:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15361

For recipes that have file:// in SRC_URI, the files are placed into
WORKDIR.  Moving forward [1], that directory will be UNPACKDIR and
eventually move to somewhere other than WORKDIR.  So update all
references to WORKDIR that are looking for these file to use UNPACKDIR
instead.

[1] https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
index 4d89818f..6420f693 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
@@ -38,7 +38,7 @@ do_install() {
     install -m 755 ${S}/Client/Build/ARM/Out/h265vdec_pp ${D}${bindir}
 
     install -d ${D}${datadir}/ti/examples/h265vdec
-    install -m 644 ${WORKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
+    install -m 644 ${UNPACKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
 
     install -d ${D}${docdir}/${PN}
     for doc in ${S}/Docs/*; do
-- 
2.17.1


