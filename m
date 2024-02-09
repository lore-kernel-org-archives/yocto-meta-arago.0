Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219B6C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:56:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20182.1707505008024840382
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 10:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OOEE06Tq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419Iukxc130065;
	Fri, 9 Feb 2024 12:56:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707505006;
	bh=OToOtTFN8hs7mi+lB3XDWKtqXQCv0WD2lqVGwSLOXf0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OOEE06TqKFxHmhOkGtVyMyLXRTjDSz8HbKzXDKLp1HjNX77aAcK9FvAynE9CgM81i
	 rUtrqGrEwejF1cV0a26eHcse9kz9q9y8sFocb7SheN0wdjNIng95c262ao/Ig2+Mp0
	 dduMoIooE4y3SWWkZHRNFRdux3QlfxmETLRsNkUY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419Iukq6108035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 12:56:46 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 12:56:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 12:56:46 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419IugLg047828;
	Fri, 9 Feb 2024 12:56:46 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 3/4] meta-arago: images: update tisdk-default-image to include chromium
Date: Fri, 9 Feb 2024 12:56:34 -0600
Message-ID: <20240209185635.32675-4-detheridge@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15157

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


