Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F1DC4829C
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:56:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.20650.1707505009284982284
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 10:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iiAepOCk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419Iumhv058208;
	Fri, 9 Feb 2024 12:56:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707505008;
	bh=qLFd/TdBAzqg5zbj0Xe337LKol8c+cCRhgMFy8oMcAQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iiAepOCkTQnqOh/nMtSLqm8lRHmXM2rsS01aqHvd0MIwOmhXwBve9j/ENto0MSo+n
	 QRu/0I98+tz02ES2auyACdN9BwWK6TxeytlQwgx0Jbr2QpMx5oVsgYWMfRuTgKjVlS
	 T29hW5PIq42maZbasSs4u79Vgge3Mx1cNX7LFuxA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419Iumu4107036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 12:56:48 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 12:56:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 12:56:47 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419IugLh047828;
	Fri, 9 Feb 2024 12:56:47 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 4/4] meta-arago: tisdk-default-image: remove old chromium logic
Date: Fri, 9 Feb 2024 12:56:35 -0600
Message-ID: <20240209185635.32675-5-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240209185635.32675-1-detheridge@ti.com>
References: <20240209185635.32675-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 18:56:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15158

From: Darren Etheridge <detheridge@ti.com>

The new dynamic meta-chromium-browser layer will do this same thing
and add chromium-ozone-wayland into the image if the layer is detected.
This is a hangover from dunfell and doesn't serve any purpose in
kirkstone so removing to uncomplicate things.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 7761ac34..9c3446f3 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -39,15 +39,6 @@ export IMAGE_BASENAME = "tisdk-default-image"
 # available on the HW.
 IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
 
-# Below is the delta in packages between old fuller and a new smaller default rootfs
-CHROMIUM = ""
-CHROMIUM:append:omap-a15 = "\
-    chromium-ozone-wayland \
-"
-CHROMIUM:append:k3 = "\
-    chromium-ozone-wayland \
-"
-
 EXTRABROWSERS = " \
     qtwebbrowser-examples \
     qtwebengine-qmlplugins \
@@ -56,7 +47,6 @@ EXTRABROWSERS = " \
 
 PYTHON2APPS = " \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
 "
 
 DEVTOOLS = " \
-- 
2.36.1


