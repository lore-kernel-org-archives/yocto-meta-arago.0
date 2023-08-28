Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CB6C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 22:14:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4684.1693260865079774808
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 15:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TFbU15o2;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SMEN1o009622;
	Mon, 28 Aug 2023 17:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693260863;
	bh=9X8jSHGJdcP08QgghePEp3sNAZYvDP9cwY2TqGuPdh4=;
	h=From:To:Subject:Date;
	b=TFbU15o2hPRFasfOnARJTcgws9Uv9J17qWHDbWZE1UEb3K2vgpRNXHcrtvl7x7m9j
	 RFNiLWhBKhd0SsH9QLOC0cMWnbXLJFjpzNymCpN/zjIyAzPyUiKqgXkRT2s0BX0WnG
	 uhBwle5n6+8i5RaT5Hgu3+SF02KPBrIy/v0d6EVo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SMENNO015078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 17:14:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 17:14:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 17:14:23 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SMENUv030653;
	Mon, 28 Aug 2023 17:14:23 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qakV5-0005sw-GS; Mon, 28 Aug 2023 17:14:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] flatbuffers: Add protocol and branch to SRC_URI
Date: Mon, 28 Aug 2023 17:14:23 -0500
Message-ID: <20230828221423.22410-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 22:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14875

Add missing protocol and branch to the SRC_URI to remove new warning
messages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
index 92363915..7f7b8b99 100644
--- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
+++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
 
 SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
 
-SRC_URI = "git://github.com/google/flatbuffers.git"
+SRC_URI = "git://github.com/google/flatbuffers.git;protocol=https;branch=master"
 
 # Make sure C++11 is used, required for example for GCC 4.9
 CXXFLAGS += "-std=c++11"
-- 
2.17.1


