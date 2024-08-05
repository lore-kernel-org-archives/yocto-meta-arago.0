Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32507C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:48:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.11294.1722872903307484118
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Aug 2024 08:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I9uw0VRV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: t-lannynd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 475FmMZv086872
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Aug 2024 10:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722872902;
	bh=WyngrndEu/r9boXn55pNO0rr9ekjIN2LufS5z7uaHBo=;
	h=From:To:Subject:Date;
	b=I9uw0VRVoi9lwWEJ5Qjo043+mG0g2/7WK3cGEK4A1AkruvplrvPU9DR3kPcm02Ny6
	 8LGbosEsj/wNAZHu6Xj1xtHCjVj2/AZ8XG2p5MM+dUmC3bm5XV/KaE5SqI0IrYwdn+
	 cy91T5qhjJCod36naCsU/cpA4REY7/pjF3qtx/RQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 475FmM8A023368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Aug 2024 10:48:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Aug 2024 10:48:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Aug 2024 10:48:21 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 475FmMPa083684
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Aug 2024 10:48:22 -0500
From: <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v5] packagegroup-arago-tisdk-multimedia: Add mpv package
Date: Mon, 5 Aug 2024 10:48:22 -0500
Message-ID: <20240805154822.21854-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Aug 2024 15:48:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15499

From: Thorsten Lannynd <t-lannynd@ti.com>

Add mpv package to allow for video playback and streaming of online videos

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v5: Add file name to subject line

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


