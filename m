Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DEDC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:48:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.33458.1701874105295061049
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HUl7jVV3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6EmOkk112859;
	Wed, 6 Dec 2023 08:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701874104;
	bh=4IRqgZxpTOtPv8Vili/I+TausXvmWF0gTiZoUYFQAkA=;
	h=From:To:CC:Subject:Date;
	b=HUl7jVV380fP6xLV1e5PE3dHZGrFtSHVK3GPAZKIlyiS9jWqt+mBXnGOkrqHNbi5V
	 5NLiCTlE1Lo9ukeaEyBFOve0FYEtsqlY/PrqyjpArZ73QwqPkPnbsOuSkdf2kG0N7n
	 HknIDr6JWZIrZYuNvD3L8/DE7uvIpqdQnGS5GDEU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6EmODv015744
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 08:48:24 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 08:48:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 08:48:23 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6EmMr7013001;
	Wed, 6 Dec 2023 08:48:23 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <k-bhargav@ti.com>, <devarsht@ti.com>, <a-limaye@ti.com>,
        <shyam.jagannathan@ti.com>, <r-ravikumar@ti.com>, <vijayp@ti.com>,
        <detheridge@ti.com>
Subject: [meta-arago] [kirkstone] [PATCH] receipes-multimedia: gstreamer: Add patches for AM62P
Date: Wed, 6 Dec 2023 20:18:22 +0530
Message-ID: <20231206144822.3194663-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:48:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15038

Add patches to prefer contiguous video format and supporting
dmabuf-import mode for video decoder.

This is to support use-cases involving video codec with other components
viz. GPU, Camera e.t.c.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
index a36c9760..e14a3c93 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -20,4 +20,8 @@ SRC_URI:append:am62axx = " \
     file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
 "
 
+SRC_URI:append:am62pxx = " \
+    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+"
 PR:append = ".arago0"
-- 
2.34.1


