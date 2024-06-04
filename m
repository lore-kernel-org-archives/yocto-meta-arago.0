Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6098C41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 15:40:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.24853.1717515625795135480
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 08:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gOx6ihn0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454FeOvr051477;
	Tue, 4 Jun 2024 10:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717515624;
	bh=PTqZCz8BVnKhv/G1t0+2Rb5YuZyCVjnXXhWgBUhMaxY=;
	h=From:To:Subject:Date;
	b=gOx6ihn0rh4JNGoc/HQSJSEwRsnO3TUaorDYUdYV7ZMUNKrG5gjn4hybXfGk4RWM3
	 y+HsjIO17JeyVJ7qLK9TKULcx0AO3ggO6MFkdGpAwJA45IgBe30tmFaaN40rcsRtMd
	 cAVw4iuyi2mFeoq29NIqWf1UgKIK3vgkttujASwM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454FeOkl016979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 10:40:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 10:40:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 10:40:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454FeOBV063025;
	Tue, 4 Jun 2024 10:40:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEWGu-0003Ek-At; Tue, 04 Jun 2024 10:40:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] hevc-arm-decoder: Update for gcc v14 support
Date: Tue, 4 Jun 2024 10:40:23 -0500
Message-ID: <20240604154024.12402-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 15:40:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15360

One of the changes in gcc v14 is making implicit-function-declaration an
error.  For some older software packages the easiest fix is to add
-fpermissive to the compile line.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
index 3bcd6c7f..4d89818f 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
@@ -24,7 +24,7 @@ do_configure() {
 
 do_compile() {
     cd ${S}/Client/Build/ARM
-    oe_runmake CC="${CC}" LINKER="${CC}"
+    oe_runmake CC="${CC} -fpermissive" LINKER="${CC}"
 }
 
 do_install() {
-- 
2.17.1


