Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634A9C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 20:50:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5999.1721767836457204648
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jul 2024 13:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p9lmWmvs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: t-lannynd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46NKoZ0Z076524
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 15:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721767835;
	bh=bo3pSHLwt1nTmahZzOsn2nHxLJCF2kdB70tL4refEAQ=;
	h=From:To:CC:Subject:Date;
	b=p9lmWmvsLZ919Yhj/f00fk6vsVY5yiA/1SFHdKGj52IMvFJyl34zGfXGdYV4USjUC
	 Cnb2wpjpwDnKWeGqdu0mc5wJltM8rruRU1oc+JGU6CAeyts2Maxb30BGvgMQ2y3Bx/
	 PovtjY1BMFov3JrCdnVroExNlYrKbShJ+2Xcq5zg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46NKoZAA025812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 15:50:35 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jul 2024 15:50:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jul 2024 15:50:35 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46NKoZEn113905;
	Tue, 23 Jul 2024 15:50:35 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Thorsten Lannynd <t-lannynd@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-tisdk-multimedia: Add ffmpeg package
Date: Tue, 23 Jul 2024 15:49:48 -0500
Message-ID: <20240723204947.161393-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 20:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15467

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


