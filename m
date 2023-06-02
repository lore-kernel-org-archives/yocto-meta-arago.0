Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0A6C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 18:27:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3128.1685730437858708622
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ueyyjJxo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 352IRGpk062647;
	Fri, 2 Jun 2023 13:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685730436;
	bh=dmQCgn4KOS1zJr/1jj4fhF0rcXjP8VhUP1Blcvtqqj0=;
	h=From:To:Subject:Date;
	b=ueyyjJxoNRLb8BY9A8nf2vrdyv1Vvy3Eta/15x26JDWc061/kqbIUhyzpnAJUW0xP
	 uOw9wMQlAriLiW+b+PqlYiIOfrG1EP/yIMoBN6DHPQ12/VQD5cZuP4E/3NsljBXBlt
	 zxTC/bY85nwo0ziSCiE7lHKMjjXU1s24RwRuxwm4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 352IRGYh001583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jun 2023 13:27:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 13:27:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Jun 2023 13:27:16 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 352IRGAd097525;
	Fri, 2 Jun 2023 13:27:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q59Ua-0000cZ-2r; Fri, 02 Jun 2023 13:27:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] clacc: Fix TARGET name
Date: Fri, 2 Jun 2023 13:27:16 -0500
Message-ID: <20230602182716.2344-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Jun 2023 18:27:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14491

The last update that fixed the syntax of changing _ to : was a little
too aggressive and changed the TARGET values incorrectly.  Not sure why
it took this long to see this pop up.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
index 4d78e7b7..f56d65cc 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
@@ -9,9 +9,9 @@ RDEPENDS:${PN} += "clocl"
 
 S = "${WORKDIR}/git/host"
 
-TARGET:class-target = "clacc:arm"
-TARGET:class-native = "clacc:x86"
-TARGET:class-nativesdk = "clacc:x86"
+TARGET:class-target = "clacc_arm"
+TARGET:class-native = "clacc_x86"
+TARGET:class-nativesdk = "clacc_x86"
 
 export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
 export X86_HOST_ROOT = "${STAGING_DIR_HOST}"
-- 
2.17.1


