Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2188.1643826392935440591
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V126mWe5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQV5v045404;
	Wed, 2 Feb 2022 12:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826391;
	bh=lf2D3bjEJP72D+eNslTk5adpGIM9CQsr7/P9iIU99H0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=V126mWe5F82rw3wuMerHWysDzBro46fvLvtoJvBQULfBJi9q3V2b71rosZUj5+mO4
	 4DJ1kMdXLTd5UDn/2nfx/YaG1AvLOalnm0tqp4V3eTTJwpzMZiYNKJiAMkPbvYhbr0
	 nhIQzFJqPmd1KgiJ0am2lbsKJnqUiJHd1ZSvGI2o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQVYU122841
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:31 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVck117274;
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKt-0007YI-CQ; Wed, 02 Feb 2022 12:26:31 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 07/12] recipies-ti: ti-rtos-firmware: Fixup typo for rtos firmware
Date: Wed, 2 Feb 2022 12:26:25 -0600
Message-ID: <20220202182630.28943-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index d932acf1..44c1ad09 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -195,14 +195,14 @@ ALTERNATIVE_${PN}_j7200-hs-evm = "\
                     "
 
 ALTERNATIVE_${PN}_j721s2-evm = "\
-                    j7-mcu-r5f0_0-fw \
-                    j7-mcu-r5f0_1-fw \
-                    j7-main-r5f0_0-fw \
-                    j7-main-r5f0_1-fw \
-                    j7-main-r5f1_0-fw \
-                    j7-main-r5f1_1-fw \
-                    j7-c71_0-fw\
-                    j7-c71_1-fw\
+                    j721s2-mcu-r5f0_0-fw \
+                    j721s2-mcu-r5f0_1-fw \
+                    j721s2-main-r5f0_0-fw \
+                    j721s2-main-r5f0_1-fw \
+                    j721s2-main-r5f1_0-fw \
+                    j721s2-main-r5f1_1-fw \
+                    j721s2-c71_0-fw \
+                    j721s2-c71_1-fw \
                     "
 
 # Set up link names for the firmwares
-- 
2.17.1

