Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863DDC4829E
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:58:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.28350.1707242326856101021
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 09:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v87rqr1V;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 416Hwj5S119218;
	Tue, 6 Feb 2024 11:58:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707242325;
	bh=OToOtTFN8hs7mi+lB3XDWKtqXQCv0WD2lqVGwSLOXf0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=v87rqr1V16vgcLMq+Z5CUZL+opaKq2qqYWw6WvYksvm5PhSuyoCTDUPKl4+0WPwPa
	 5USJfK2RHqqJBJTN7XFcCoZlwHbkByZqT7cOjUYRtSm0qcVVEZ9ewYFd1Aaq5g1uRU
	 zSf2w9VQkvRsa+6Hy9/uEY/hzAZuZDjtjOcZnx+g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 416HwjXU039897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 11:58:45 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 11:58:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 11:58:45 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 416HwhcS064292;
	Tue, 6 Feb 2024 11:58:45 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCH  3/4] meta-arago: images: update tisdk-default-image to include chromium
Date: Tue, 6 Feb 2024 11:58:40 -0600
Message-ID: <20240206175841.32717-4-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240206175841.32717-1-detheridge@ti.com>
References: <20240206175841.32717-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Feb 2024 17:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15120

From: Darren Etheridge <detheridge@ti.com>

If the chromium-browser-layer is detected, then add
chromium-ozone-wayland into the default image.

If the layer is detected then append chromium-ozone-wayland to the
IMAGE_INSTALL variable.  This increases the build time and image size
which is why we make this conditional on the browser layer being
present.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bbappend           | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend
new file mode 100644
index 00000000..7224fe72
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend
@@ -0,0 +1,3 @@
+PR:append = ".chromium0"
+
+IMAGE_INSTALL:append = " chromium-ozone-wayland"
-- 
2.36.1


