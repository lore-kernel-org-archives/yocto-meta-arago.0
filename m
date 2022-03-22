Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6876DC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:48:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13453.1647971299571655820
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AiI4O9CB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmB7U060097;
	Tue, 22 Mar 2022 12:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647971291;
	bh=4aBjTOxVlZ1yZUqUe3+e3yxjujD98ES5rwMPk9Vkfog=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AiI4O9CBy/OBLrw70Pb8VwYGs9Te8snGuHkiWGPDFJOSNs6RhDjyUeXzeT01o9zF9
	 Y4SeUS17T7/aOVKg35NBMEwlg8+a+y5d/2bGJzc3YKbZFapYxReYP2UFhORMor29Bn
	 9Tu7cj7Ax2hLVPSmYBUCgK6eCl4XXiPVKpJqTlD8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MHmB1Z003591
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 12:48:11 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 12:48:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 12:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAsT032018;
	Tue, 22 Mar 2022 12:48:10 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V5 06/12] tisdk-thinlinux-image: Reformat
 documentation
Date: Tue, 22 Mar 2022 12:48:02 -0500
Message-ID: <20220322174808.16341-7-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13703

Reformat the documentation to indicate the summary and description
in a standardized manner.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V4: None

V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-7-nm@ti.com/

 .../recipes-core/images/tisdk-thinlinux-image.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index aa732df6b509..dc073d72d063 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -1,5 +1,7 @@
-# Arago TI Thin Linux image
-# Minimal bootable image with container to start the next complex system up.
+SUMMARY = "Arago TI SDK Thin Linux image"
+
+DESCRIPTION = "Minimal bootable image with container to start the next\
+ complex system up."
 
 require arago-image.inc
 
-- 
2.31.1


