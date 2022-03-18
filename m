Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE77C4167B
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.13583.1647628849670383156
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qor0w8um;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelvG101174;
	Fri, 18 Mar 2022 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628847;
	bh=FwHQ2vf+iCh1IVvY31Vd8+054cZf2dG5UGrsbhVs/wg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qor0w8um16eTY6dAcvYy6YbqVcBpOy2F0XXZz6RFzfORdDRMtXQOxpaKZj24rq2t6
	 D00E26rtInrlrfXU92VOKk/HwxHnlZX4GmpSJdGy0eZI3W0ySRMcMzX21iO9qVIj3m
	 CDYtjByvEPksJIpHwEvWJUMQXCj0pSIAuImIZkhg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIeliP024199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:40:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:40:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:40:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIekUv006928;
	Fri, 18 Mar 2022 13:40:46 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V3 03/12] tisdk-tiny-image: Add some usability
 notes
Date: Fri, 18 Mar 2022 13:40:36 -0500
Message-ID: <20220318184045.11246-4-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318184045.11246-1-nm@ti.com>
References: <20220318184045.11246-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 18:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13662

Lets clarify the usage of tiny image as something meant as a building
block and not something that folks can directly use.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v2: summary and description

V2: https://lore.kernel.org/all/20220318143735.17642-4-nm@ti.com/
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
2.17.1


