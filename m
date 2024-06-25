Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D885C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 21:03:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.8776.1719349400188471670
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 14:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IdJJEd7Q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45PL3HxF031386;
	Tue, 25 Jun 2024 16:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719349397;
	bh=WPxRRO3AGY6Tg4bFw+MspplojyNWPg/3J5Gl+my0Qqs=;
	h=From:To:CC:Subject:Date;
	b=IdJJEd7QwxPMsQwdTtcQ1LOUMZO8LHKmAo1qezXxxRjYgAJ/89z8gjlfPiJEd6+jq
	 J8mem3s+3Jw8JIcf69v5KWU718Lg5UYd2i2Pnlxpo2YVN0Ss3a+2yWJo9DM0UKsemi
	 9emC+/ZaFlcyQIpaHyUTZnmWI512IIFH6cvwoHWo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45PL3HVM079462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Jun 2024 16:03:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Jun 2024 16:03:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Jun 2024 16:03:17 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45PL3GaJ084567;
	Tue, 25 Jun 2024 16:03:16 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] weston: remove group and usermod lines
Date: Tue, 25 Jun 2024 16:02:49 -0500
Message-ID: <20240625210249.2064678-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Jun 2024 21:03:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15413

From: Randolph Sapp <rs@ti.com>

Remove these group and usermod additions as the associated patches have
been merged into oe-core as of commit:

3134fca12c6f74d2b99f79fb751bc5513c5b937a

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston_13.0.0.bbappend         | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend
index 80a768f2..ba3be91c 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend
@@ -5,9 +5,3 @@ PR:append = ".arago1"
 SRC_URI += " \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
-
-# required for weston user to interact with the render devices
-inherit extrausers
-EXTRA_USERS_PARAMS = " \
-        usermod -aG render weston; \
-"
-- 
2.45.1


