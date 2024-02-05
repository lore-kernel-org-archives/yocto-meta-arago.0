Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86453C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 23:54:31 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10002.1707177268917808618
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 15:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z4Izg823;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415NsRxA063639;
	Mon, 5 Feb 2024 17:54:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707177267;
	bh=DepSO8Z4+f1vBBeDu2VaIIFuUg7lX0YE/i7zOYvW3IU=;
	h=From:To:CC:Subject:Date;
	b=Z4Izg823JTTe5gM5/tZfRSnh7QWocZzVKjO4f2ganUYxxQ+fYbwhaQIuEmhTy4Vfu
	 xZgFgKZpmqRjQZ6fov5vLg+suw28tUu1Wi8pZwjWh0ePlSgm+ud0VZTPyN4Z3xuqoj
	 og0hM3GAyppPsu70CuJQOsdKcId+W0+ppSFCRQms=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415NsRlp091112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 17:54:27 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 17:54:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 17:54:27 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415NsRc7122083;
	Mon, 5 Feb 2024 17:54:27 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] cairo: remove cairo append and include
Date: Mon, 5 Feb 2024 17:54:27 -0600
Message-ID: <20240205235427.2916168-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Feb 2024 23:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15114

From: Randolph Sapp <rs@ti.com>

Cairo versions greater than 1.17.8 dropped both the GL render backend
entirely, invalidating both the opengl and glesv2 PACKAGECONFIGS and
this override entirely.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
 2 files changed, 6 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
deleted file mode 100644
index 459d8d09..00000000
--- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
deleted file mode 100644
index b41f1a01..00000000
--- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# This is required since cairo expects the opengl distro feature to refer to
-# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
-
-PACKAGECONFIG:remove = "opengl"
-PACKAGECONFIG:append = " glesv2"
-- 
2.43.0


