Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20C2C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:51:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.71957.1722527474312276179
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 08:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=l3qn3iKi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: t-lannynd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471FpDuj093311
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 10:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722527473;
	bh=vCZOdojqwlxEsVO9zzahgePyWHhYBMoXGmrvQw3Sejk=;
	h=From:To:Subject:Date;
	b=l3qn3iKiYawJaH25ht1Ka7AWIRX6GpTePfDlvqPywzuUFSuUX+zkg1M2yiW7tiz1N
	 cu3NisXkX0hGtNoQnbqCrv01iB2yJu/M5n5y+748fn5sSg/J2W84OztOaEqReiijpe
	 xHOlSN2jfBReRGJbGDqoWWHPg0IEGiLkxZmiDQQk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471FpDr1100090
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 10:51:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 10:51:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 10:51:13 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471FpD0j013999
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 10:51:13 -0500
From: <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-tisdk-multimedia: Add mpv package
Date: Thu, 1 Aug 2024 10:51:13 -0500
Message-ID: <20240801155113.12804-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Aug 2024 15:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15474

From: Thorsten Lannynd <t-lannynd@ti.com>

Add mpv package

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
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


