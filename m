Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B811BC4321E
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10803.1648128330802050482
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DeTm8ea/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSgQ067424;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=UjR5VKbDMJyT9//MDsdWOtvIG+JqgerkE6PutVSImIY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DeTm8ea/LYkYMrG9cRRU2jzCSlqj2owM5DUADUOhxn1ev/dUix3Y0s1GRciebvAff
	 u8VyBs09qlP9hWmFSJkJkKqSD1lNYqHZs4alRMej+s6sONaen7CjChhDSYX1bc1c05
	 2vfNPvgm575j21OIm4iWMuBfhHbJeX5iKwYuTeBc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPS1C016928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPR0J008903;
	Thu, 24 Mar 2022 08:25:27 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 02/12] tisdk-tiny-image: Split common
 components into include file
Date: Thu, 24 Mar 2022 08:25:16 -0500
Message-ID: <20220324132526.26497-3-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220324132526.26497-1-nm@ti.com>
References: <20220324132526.26497-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13738

Lets split the common pieces for creating a tiny image into an include
file. This can then be used to incrementally build additional images
as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V5: None

V5: https://lore.kernel.org/all/20220322174808.16341-3-nm@ti.com/

 .../recipes-core/images/arago-tiny-image.inc          |  9 +++++++++
 .../recipes-core/images/tisdk-tiny-image.bb           | 11 ++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
new file mode 100644
index 000000000000..958dd8bb9399
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -0,0 +1,9 @@
+ARAGO_SYSVINIT = "1"
+
+require arago-image.inc
+
+IMAGE_FEATURES_remove = "splash"
+
+IMAGE_INSTALL = " \
+	packagegroup-arago-sysvinit-boot \
+"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 28da0b60cc35..5807e2321050 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,15 +1,12 @@
-ARAGO_SYSVINIT = "1"
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
-require arago-image.inc
+require arago-tiny-image.inc
 
-IMAGE_FEATURES_remove = "package-management splash"
+IMAGE_FEATURES_remove = "package-management"
 
 IMAGE_FSTYPES += "cpio cpio.xz"
 
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
-
-IMAGE_INSTALL = " \
-	packagegroup-arago-sysvinit-boot \
+IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
-- 
2.31.1


