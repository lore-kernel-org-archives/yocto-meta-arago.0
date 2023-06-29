Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B7BEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 20:12:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7260.1688069564831421892
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 13:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gDiWD2gX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35TKCeBs119668;
	Thu, 29 Jun 2023 15:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688069560;
	bh=0LCsgEmkX+8+1ZY/13MeFGDZdBe9lRPab/etdoee46E=;
	h=From:To:Subject:Date;
	b=gDiWD2gXZzKNR28LGU9KUUKebWmSlcctONLmE86Cpz4tH/Esnuo4VlpwLrGJHZGvh
	 qdGAYIMVtYXItPhcwRM6rmx1gr2joAajw/uiGDSgtRZK03c4mlRUy5CJezaYxsQwao
	 gNSuuH1hb10eR+cj2QkBaNiaMv09J0Lw0PtLREsQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35TKCe1i014357
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Jun 2023 15:12:40 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 15:12:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Jun 2023 15:12:40 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35TKCeJM013300;
	Thu, 29 Jun 2023 15:12:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qEy0O-0005PM-4o; Thu, 29 Jun 2023 15:12:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] bootstrap-initrd: Change name of cpio file to match change in oe-core
Date: Thu, 29 Jun 2023 15:12:40 -0500
Message-ID: <20230629201240.20748-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 20:12:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14740

There was a recent commit on oe-core master [1] that changes how the
names of the images files are built up.  Since we effectively have the
name of the cpio file somewhat hardcoded in this recipe, we need to
update it to match what upstream is now producing.

[1] https://git.openembedded.org/openembedded-core/commit/?id=26d97acc71379ab6702fa54a23b6542a3f51779c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
index 92822dc3..121cba61 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -14,7 +14,7 @@ TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
 
 do_install() {
 	install -d ${D}/boot
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.cpio ${D}/boot/${TARGET}
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.rootfs.cpio ${D}/boot/${TARGET}
 }
 
 FILES:${PN} = "/boot"
-- 
2.17.1


