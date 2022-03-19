Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD47CC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6590.1647693200526339042
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f+W5mZZR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHtD061160;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=fP7RJ6aK+JbhqyYS89d/uII6YiAGjtkzNm4lzqj40t4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f+W5mZZRDDYkjc3aU77bABbm6mwR6tLLA9WsvhxSvcNAA+fHY3+Sy8qexoiZadnGY
	 00kRzYxeCgf/nBgb04hW8jMrN106pN6RZn+8fvrgfXhT7jKLmF9aHhuchyUCB9JwBt
	 7sxwv3w/pdAcr21CU++BjFckG1Je0/9Coa7ThzOw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXHlK105945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXG6t105380;
	Sat, 19 Mar 2022 07:33:16 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 03/12] tisdk-tiny-image: Add some usability
 notes
Date: Sat, 19 Mar 2022 07:33:01 -0500
Message-ID: <20220319123310.8546-4-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13678

Lets clarify the usage of tiny image as something meant as a building
block and not something that folks can directly use.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-4-nm@ti.com/

 .../recipes-core/images/tisdk-tiny-image.bb            | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 85ae3728e86e..210bc32444f9 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,3 +1,13 @@
+SUMMARY = "Arago TI SDK super minimal base image for initramfs"
+
+DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
+ bare system, this image does not package the kernel in the\
+ standard /boot folder in rootfs. Instead, it provides a base\
+ rootfs allowing kernel to be deployed elsewhere\
+ (tftp/separate boot partition/jtag log etc..) and boot\
+ the image.\
+"
+
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
 require arago-tiny-image.inc
-- 
2.31.1


