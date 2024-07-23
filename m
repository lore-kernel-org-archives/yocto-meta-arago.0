Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40043C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 20:48:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5959.1721767725371631331
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jul 2024 13:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FsOLSF3D;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: t-lannynd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46NKmiv5026110
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 15:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721767724;
	bh=bo3pSHLwt1nTmahZzOsn2nHxLJCF2kdB70tL4refEAQ=;
	h=From:To:CC:Subject:Date;
	b=FsOLSF3DA3UC8cOdGsqmn5aYb7duQxuUA6lln4+S464nUuaFDlvvC9R6KBtaKvntU
	 7RUu174vbpFUCGPK+5JUaRO1Dd1RqadFc5LZg7t3j6iJ+JQRtuoTUrEAeLvglaDzCB
	 0eJhjijYCeW8ryk5u/J8mViU+Yxcq0n8Ro4x9+pA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46NKmitU010035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 15:48:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jul 2024 15:48:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jul 2024 15:48:44 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46NKmixo129208;
	Tue, 23 Jul 2024 15:48:44 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Thorsten Lannynd <t-lannynd@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] Add ffmpeg package
Date: Tue, 23 Jul 2024 15:47:25 -0500
Message-ID: <20240723204724.161377-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 20:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15466

Add ffmpeg package

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 6571d484..2085ad09 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -8,6 +8,7 @@ inherit packagegroup
 
 MULTIMEDIA = " \
     amsdk-av-files \
+    ffmpeg \
     libcamera \
     libcamera-gst \
 "
-- 
2.34.1


