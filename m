Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACE8C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:55:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.10890.1665510939047603161
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cE5qHioH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHtYR2065169;
	Tue, 11 Oct 2022 12:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665510934;
	bh=JVvhiaajCUe29dcqByNhL2CgCj1ciOMZIFsCaFm/X4U=;
	h=From:To:CC:Subject:Date;
	b=cE5qHioHJO52TPPXaIp2TF+4rFOajYrsOJzT0QXcY6wo3VYwzBkmq988R9YH7f5ho
	 Fyzcv9gsKNp/XufOxtPD4tmSwai2ejYbcdGmabszr3tjMO9x8PMooH2sb5WYLNZFcG
	 cWb6dYOjBjgu4CRtghNu2W3EcfISUh6vgNdfTWiI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHtYXK031515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:55:34 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:55:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:55:34 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHtXQL009964;
	Tue, 11 Oct 2022 12:55:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH]
  packagegroup-arago-tisdk-addons: Make ti-rtos-firmware available for k3
Date: Tue, 11 Oct 2022 12:55:33 -0500
Message-ID: <20221011175533.27039-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 17:55:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14076

The ti-rtos-firmware is common across all K3 devices, only the pru-icss
component is variable. Make the appending logic match.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5b6f05c9..d1b48b57 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -63,13 +63,10 @@ UTILS:append:k3 = " mmc-utils \
                     statcol \
 "
 
-UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
-UTILS:append:am62xx = " ti-rtos-firmware"
-#UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
-UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
-UTILS:append:j7 = " ti-rtos-firmware"
-UTILS:append:j721e-evm = " pru-icss"
-UTILS:append:j721e-hs-evm = " pru-icss"
+UTILS:append:k3 = " ti-rtos-firmware"
+UTILS:append:am64xx = " pru-icss"
+UTILS:append:am65xx = " pru-icss"
+UTILS:append:j721e = " pru-icss"
 
 UTILS:append:omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.37.3


