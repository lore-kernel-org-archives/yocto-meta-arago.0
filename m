Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BEDC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 08:51:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3403.1705049473101065043
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 00:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uDbQBTrg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40C8pC1j096505
	for <meta-arago@lists.yoctoproject.org>; Fri, 12 Jan 2024 02:51:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705049472;
	bh=iFDnN23EA3a5U4HAgjV+J9zVjdYolWefM4BdJ0RaEYU=;
	h=From:To:CC:Subject:Date;
	b=uDbQBTrgf5v4ayPOEM1Hz3zvVsaJHTiFuLzCzwioBj3IJ+G6tmXHsu6fim17GZShV
	 bjGS+cj7O/6BU4MPIyF9CBwCss3IPgyqoTXLoIVN+3CIMq5JOeNXnyLpOXA7aAp1fV
	 YJlpzS5xfXhw+OCS0pVihc6j1cnhc4IK7JoYrxBY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40C8pC6j082770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 12 Jan 2024 02:51:12 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Jan 2024 02:51:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Jan 2024 02:51:12 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40C8pA8W100992;
	Fri, 12 Jan 2024 02:51:10 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <r-ravikumar@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins: j722s: Add DMABuf Import patches
Date: Fri, 12 Jan 2024 14:20:50 +0530
Message-ID: <20240112085050.433484-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Jan 2024 08:51:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15071

From: Rahul T R <r-ravikumar@ti.com>

J722S has same cnm codec, So add the patches required to
get DMABuf Import working

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
index e14a3c93..6661b735 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
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


