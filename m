Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A774BC43219
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:48:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13481.1647971299600822291
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kOZuThjr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAHG116235;
	Tue, 22 Mar 2022 12:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647971290;
	bh=s1s58gZ4DEwrM+IYyIexTkSGV+Dsnhjr1AA/yhHlc+s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kOZuThjr49lArWXAyPGfo/9WV9empgHE0vEgxuFlugA1cUBJ+W+e80RPptYmERE4J
	 8DiY0xF1Yt4gCsfa//zgG99EyQv6UyET00X/fHgCJB8SEUWX5WN4QPIpL6b51Go0yb
	 KaBAQ+qIX1l8eSaIQEXV7RhVWCww6gPQClnaMtjo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MHmABA024988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 12:48:10 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 12:48:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 12:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAgn000490;
	Tue, 22 Mar 2022 12:48:10 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>, Denys
 Dmytriyenko <denys@konsulko.com>
Subject: [master/dunfell PATCH V5 01/12] Revert "tisdk-tiny-image: remove
 packagedata task breaking initramfs packaging"
Date: Tue, 22 Mar 2022 12:47:57 -0500
Message-ID: <20220322174808.16341-2-nm@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13700

This reverts commit a75e468a372d4f5c2c32a179d4d2219899b5190c.

Commit a75e468a372d ("tisdk-tiny-image: remove packagedata task
breaking initramfs packaging") as discussed in [1] is no longer
necessary as the offending patches have been reverted in dunfell.

[1] https://lists.yoctoproject.org/g/meta-arago/message/13624

Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V4: None

V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-2-nm@ti.com/

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


