Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8DEC43219
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.6602.1647693201875376132
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uX41nxR3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXGZr061148;
	Sat, 19 Mar 2022 07:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=4jrljuQDP7SzZ/W2ZAGzmSibFilUQaEFeGma69VRXZY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uX41nxR3LSLSM8qn4h2W4SZetqRA1mR1aHgcrp5Xo5EVJpjrX3NOijMYEV1nc9ObB
	 xsPweda+9egl/WnVMrlZQsBiB9OgRy34naY2lUaKx05KEzt17Iv4/C7HPzwGFg4fuH
	 S8fZPy/claeZstJds49ARN7XP7oRkPMRsBv2F8Zs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXGCC105933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:16 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXGYj028913;
	Sat, 19 Mar 2022 07:33:16 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>, Denys
 Dmytriyenko <denys@konsulko.com>
Subject: [master/dunfell PATCH V4 01/12] Revert "tisdk-tiny-image: remove
 packagedata task breaking initramfs packaging"
Date: Sat, 19 Mar 2022 07:32:59 -0500
Message-ID: <20220319123310.8546-2-nm@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13685

This reverts commit a75e468a372d4f5c2c32a179d4d2219899b5190c.

Commit a75e468a372d ("tisdk-tiny-image: remove packagedata task
breaking initramfs packaging") as discussed in [1] is no longer
necessary as the offending patches have been reverted in dunfell.

[1] https://lists.yoctoproject.org/g/meta-arago/message/13624

Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-2-nm@ti.com/

 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index c0ef8f247ee7..28da0b60cc35 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -13,6 +13,4 @@ IMAGE_INSTALL = " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
-deltask do_packagedata
-
 export IMAGE_BASENAME = "tisdk-tiny-image"
-- 
2.31.1


