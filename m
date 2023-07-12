Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F0BEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 20:40:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.810.1689194410314461452
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Jul 2023 13:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YTf60kH9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36CKe8I0117076;
	Wed, 12 Jul 2023 15:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689194408;
	bh=iFZqE5GAR2tnlW3qRmkJxWopFf3mI2gE6Gztt6McWr0=;
	h=From:To:Subject:Date;
	b=YTf60kH9TnOi3xYaCtO5p8gPtFX2q6I6Bte5bMZxtWA2zvCWEOlE85IEC0Mi686Iz
	 KhnCa2FOfj+Z5WCjbsdUXXzJyu0BUWoHlzAVkRhz1J2JnVgWRzday8evYOmy/UeyNS
	 lc5mjvAlKHml4Z1Y3Iz0f7AlAZ+7Ama4bvp74OJk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36CKe89M021074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jul 2023 15:40:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jul 2023 15:40:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Jul 2023 15:40:08 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36CKe8IB025562;
	Wed, 12 Jul 2023 15:40:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qJgd6-00020I-6f; Wed, 12 Jul 2023 15:40:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH]  packagegroup-arago-tisdk-addons: am62xx add pru-icss
Date: Wed, 12 Jul 2023 15:40:08 -0500
Message-ID: <20230712204008.7662-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Jul 2023 20:40:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14798

Add missing dependency for am62xx on pru-icss package.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6e4f9867..c678460d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -58,6 +58,7 @@ UTILS:append:k3 = " mmc-utils \
 
 UTILS:append:k3 = " ti-rtos-firmware"
 UTILS:append:am64xx = " pru-icss"
+UTILS:append:am62xx = " pru-icss"
 
 ARAGO_JAILHOUSE_ENABLE ?= "0"
 UTILS:append:am62xx = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
-- 
2.17.1


