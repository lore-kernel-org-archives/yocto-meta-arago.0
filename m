Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BD7C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 08:52:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3416.1705049530681394693
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 00:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FXyrGuxz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40C8q9VD000969
	for <meta-arago@lists.yoctoproject.org>; Fri, 12 Jan 2024 02:52:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705049529;
	bh=d5pu6xXPPHW4LiawsKclsVUiaVapQ2jjdeoJgme9y84=;
	h=From:To:CC:Subject:Date;
	b=FXyrGuxzbY0eXenAZd/qAH43vlH14Q2xKSnyTWTjEesFDFkbIXXWe4dvcfcBVVauT
	 svsUN5cfw8zFXZ3uneuLTpu0x7xxOBQGiBgtGTsnd7XVQk+Wb0SjFd2/9It2AbHH1x
	 nfslwfyEDXMY+iCdn6jdQZaGSkaTgXzlgHOzEOeU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40C8q9KI053629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 12 Jan 2024 02:52:09 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Jan 2024 02:52:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Jan 2024 02:52:09 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40C8q7kR122973;
	Fri, 12 Jan 2024 02:52:08 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Rahul T R <r-ravikumar@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][kirkstone][PATCH] gstreamer1.0-plugins: j722s: Add DMABuf Import patches
Date: Fri, 12 Jan 2024 14:22:05 +0530
Message-ID: <20240112085205.433678-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Jan 2024 08:52:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15072

From: Rahul T R <r-ravikumar@ti.com>

J722S has same cnm codec, So add the patches required to
get DMABuf Import working

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
index e14a3c93..6661b735 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -15,6 +15,11 @@ SRC_URI:append:j784s4 = " \
     file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
 "
 
+SRC_URI:append:j722s = " \
+    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+"
+
 SRC_URI:append:am62axx = " \
     file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-- 
2.34.1


