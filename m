Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FBFC433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.6622.1647693200527048376
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x5pTP7hQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHuu061152;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=3hNruXaITMzmkI9Pct1YSmPC/d4GdJTYDDXSRl3eimQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x5pTP7hQq5rC94D8/SHB/01PCYqMf+Pq2xAFlklHZEf69EPRHbrcPWEyevQLJ0xwt
	 uopwFf/aq+HbAidJ8yZQjoUnmO9bGlKIaMgyboKgV/24ZPDKnklUDxtnL5TiKr9mml
	 Tv0tQjkdIWImKerfNKwDUdQgV4HTUeseT0XNL8p0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXHMl029028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXGk2016359;
	Sat, 19 Mar 2022 07:33:16 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 02/12] tisdk-tiny-image: Split common
 components into include file
Date: Sat, 19 Mar 2022 07:33:00 -0500
Message-ID: <20220319123310.8546-3-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220319123310.8546-1-nm@ti.com>
References: <20220319123310.8546-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13680

Lets split the common pieces for creating a tiny image into an include
file. This can then be used to incrementally build additional images
as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-3-nm@ti.com/

 .../{tisdk-tiny-image.bb => arago-tiny-image.inc}     |  7 -------
 .../recipes-core/images/tisdk-tiny-image.bb           | 11 +++--------
 2 files changed, 3 insertions(+), 15 deletions(-)
 copy meta-arago-distro/recipes-core/images/{tisdk-tiny-image.bb => arago-tiny-image.inc} (50%)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
similarity index 50%
copy from meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
copy to meta-arago-distro/recipes-core/images/arago-tiny-image.inc
index 28da0b60cc35..79c8f6075911 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -4,13 +4,6 @@ require arago-image.inc
 
 IMAGE_FEATURES_remove = "package-management splash"
 
-IMAGE_FSTYPES += "cpio cpio.xz"
-
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
-
 IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
-	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
-
-export IMAGE_BASENAME = "tisdk-tiny-image"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 28da0b60cc35..85ae3728e86e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,15 +1,10 @@
-ARAGO_SYSVINIT = "1"
-
-require arago-image.inc
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
-IMAGE_FEATURES_remove = "package-management splash"
+require arago-tiny-image.inc
 
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


