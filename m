Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC4FC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:18:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.75304.1722536288259901321
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 11:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gQLd6ybw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: t-lannynd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471II7KL065377
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722536287;
	bh=XcX97SoWJAqXnM/d8ijOk9SfENf9DPHe0BFm6J0c7BM=;
	h=From:To:Subject:Date;
	b=gQLd6ybwxbR/i6Fk+dFi++rzQKEVZjrkLitfu6jtUrmsxY9MDaWi7AJ+PBk2CRG3d
	 Tt553UI8mbxqiXF08izTxsxyLNYi2/K6m5Jlpgpkb3pXSNK2UyH4Pvm8BiPCVgW+4L
	 OkRZ0KlVvmpT9rd9/MCVERg3a/j+exYI8yfRRsGU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471II74f053223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:18:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 13:18:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 13:18:07 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471II7cB067318
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:18:07 -0500
From: <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v3] packagegroup-arago-tisdk-multimedia: Add mpv package
Date: Thu, 1 Aug 2024 13:18:07 -0500
Message-ID: <20240801181807.13201-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Aug 2024 18:18:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15476

From: Thorsten Lannynd <t-lannynd@ti.com>

Add mpv package to allow for video playback and streaming of online videos

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v3: Add version number to patch

v2: Update commit message

 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 6571d484..1ed1b8ab 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -10,6 +10,7 @@ MULTIMEDIA = " \
     amsdk-av-files \
     libcamera \
     libcamera-gst \
+    mpv \
 "
 
 MULTIMEDIA:omapl138 = ""
-- 
2.34.1


