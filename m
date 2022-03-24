Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C12AC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10805.1648128331363050598
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ADqL0D0m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSpM011809;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=suMKQD3SpWLhjvSflzRERV37Ah0hoORX3WvbLfu322U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ADqL0D0mdeYl/k9Kn0tMNOAWxNFOPFrZlGS8T4dQuATu/iii3DE/rs7E+zNFuGpHh
	 rw3iHcynRxxG3EQPj0BNx5AwzHcYwLnOtozIzOVPURMqJhP1CbDCxpesR8fgBBAvmx
	 iJ3brLkS1F3FEfS1Z8cuL1XB23zr0eQdD/q10kCQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPSiF081303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPRhs114514;
	Thu, 24 Mar 2022 08:25:27 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>, Denys
 Dmytriyenko <denys@konsulko.com>
Subject: [master/dunfell PATCH V6 01/12] Revert "tisdk-tiny-image: remove
 packagedata task breaking initramfs packaging"
Date: Thu, 24 Mar 2022 08:25:15 -0500
Message-ID: <20220324132526.26497-2-nm@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13745

This reverts commit a75e468a372d4f5c2c32a179d4d2219899b5190c.

Commit a75e468a372d ("tisdk-tiny-image: remove packagedata task
breaking initramfs packaging") as discussed in [1] is no longer
necessary as the offending patches have been reverted in dunfell.

[1] https://lists.yoctoproject.org/g/meta-arago/message/13624

Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes since v5: None

V5: https://lore.kernel.org/all/20220322174808.16341-2-nm@ti.com/

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


