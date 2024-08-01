Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D15C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 19:12:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.76686.1722539556247747596
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 12:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DcJ1p3sD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: t-lannynd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471JCZqe076190
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 14:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722539555;
	bh=to7Oj1Ez7zIqxhal/v3slscT3GEy86B3JWudH48ADLo=;
	h=From:To:Subject:Date;
	b=DcJ1p3sDedr80wS2K24A9Bj1AQFCfyDMVA3S9CqPCfw2wuFvlglbPu2XIHWfhikcl
	 vRohIF0kt02QBDT7x18iZVpmJpbdYH3/8d79CoDjl/jZ4r1Iuvf0BIDxIYT2JZXd6W
	 wtaaKpNeJTyRB2F9uB2AJsiIo7L9FUHVI0OwgvXg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471JCZT6046391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 14:12:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 14:12:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 14:12:35 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471JCZbO062717
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 14:12:35 -0500
From: <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v4] Add mpv package
Date: Thu, 1 Aug 2024 14:12:35 -0500
Message-ID: <20240801191235.13648-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Aug 2024 19:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15479

From: Thorsten Lannynd <t-lannynd@ti.com>

Add mpv package to allow for video playback and streaming of online videos

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v4: Redo patch on latest scarthgap changes

v3: Add version number to patch

v2: Update commit message

 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 2085ad09..c6e39aa1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -11,6 +11,7 @@ MULTIMEDIA = " \
     ffmpeg \
     libcamera \
     libcamera-gst \
+    mpv \
 "
 
 MULTIMEDIA:omapl138 = ""
-- 
2.34.1


