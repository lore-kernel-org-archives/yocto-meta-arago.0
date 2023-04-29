Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F974C77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 14:44:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.47997.1682779487108663747
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 29 Apr 2023 07:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ViuD+9NW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33TEijm4036602;
	Sat, 29 Apr 2023 09:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682779485;
	bh=Ij7aqNMuDJEUkhytTWyi2Q0RvyP7tE9Qek5s1Ld4NX0=;
	h=From:To:Subject:Date;
	b=ViuD+9NWYhdN/9w/1poV1hNTu6aszadXpx6E0yF1/eRe2NK43kvVXFmZyMVNZKe5l
	 GxVjJfV850ck5oe4FQANVqOvfpeo0vH/einzWg0LxFcjEPwZC/bpBFzBv3nRNn1Bb0
	 kcY6Vk9TlbldXPbaoyFEKlunO5A4vF9L2u2LmUyU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33TEijnm012698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 29 Apr 2023 09:44:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 29
 Apr 2023 09:44:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 29 Apr 2023 09:44:45 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33TEijsO001812;
	Sat, 29 Apr 2023 09:44:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pslob-0000ex-3f; Sat, 29 Apr 2023 09:44:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] ti-test: Disable omapdrmtest
Date: Sat, 29 Apr 2023 09:44:45 -0500
Message-ID: <20230429144445.32401-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 29 Apr 2023 14:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14379

omapdrmtest will not build under kirkstone due to the version change of
ffmpeg to 5.0.1.  If we want to fix this, then someone will need to do
the work.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 0b6e1eed..31bdba7e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -66,7 +66,8 @@ ARAGO_TI_TEST:append:ti43x = " \
     omapconf \
 "
 
-NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
+#NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
+NOT_MAINLINE_MMIP_DEPS = ""
 
 ARAGO_TI_TEST:append:omap-a15 = " \
     omapconf \
-- 
2.17.1


