Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DDDC3527A
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:48:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.13256.1647971299623283046
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lot/E6Kb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAJf116243;
	Tue, 22 Mar 2022 12:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647971291;
	bh=yberVrm/iOQkEOR3VgzIDcoLckBssKtIY5PoQTnVlpA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lot/E6Kb9zt0c3m+kYbUx9k/WAMYNKTufmhT2Nu/K06+AcdobBYOEPe18BxYKYJUu
	 R2I8iKp5JgeIP/Jx1fumbvLs74IUoT6vSe4UqqSrRsmR6TbraSw94W/EuG+WMPTOFB
	 nFMku389MrCZwJ2kr1ylpgqndAMcadtRCqdC9waI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MHmA1O069002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 12:48:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 12:48:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 12:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAKK005406;
	Tue, 22 Mar 2022 12:48:10 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V5 02/12] tisdk-tiny-image: Split common
 components into include file
Date: Tue, 22 Mar 2022 12:47:58 -0500
Message-ID: <20220322174808.16341-3-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220322174808.16341-1-nm@ti.com>
References: <20220322174808.16341-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:48:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13706

Lets split the common pieces for creating a tiny image into an include
file. This can then be used to incrementally build additional images
as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V4:
* IMAGES_FEATURES_remove has been split up allowing for follow on images
  to control package-management differently.

V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-3-nm@ti.com/

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
index 28da0b60cc35..0500964695a8 100644
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


