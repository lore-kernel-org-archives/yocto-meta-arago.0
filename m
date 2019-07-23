Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9928B52980
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2019 19:52:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NJpmGE080667
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 14:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563911508;
	bh=/saVlRBd7EfRJDOdY2AseFo5ZPlnZEniz4LOybsYDWw=;
	h=From:To:CC:Subject:Date;
	b=bTKI5ThJIAEesGmwur4/R2uQvYIwap5r/cA+IT9LZtb0deiNvuJ2SzljAKkXgq34Q
	73wa2pLWaeD3djZA07GSpUHudZ1uO330JxAqn5M5grxC0Gao2M7V5vwl9CaOHjwJ//
	+sYrcHjMpBv4M5bxai3xjeZWpmnak1TbScIBI+n0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NJpme2094683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 14:51:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Jul 2019 14:51:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Jul 2019 14:51:47 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NJplIq106941;
	Tue, 23 Jul 2019 14:51:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Jul 2019 15:34:58 -0400
Message-ID: <1563910498-28514-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsaulnier@ti.com
Subject: [master/thud][PATCH] ti-tisdk-makefile: pru-icss: fix installation for am437x-evm
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2019 19:52:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
index 40e8bd2..6051566 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
@@ -54,8 +54,11 @@ pru-icss_install_am437x: pru-icss_install_common
 		$(DESTDIR)/lib/firmware/pru; \
 	for i in 0 1; \
 	do \
-		install -m 0644 ./examples/am437x/PRU_RPMsg_Echo_Interrupt$${i}/gen/PRU_RPMsg_Echo_Interrupt$${i}.out \
-			$(DESTDIR)/lib/firmware/pru; \
+		for j in 0 1; \
+		do \
+			install -m 0644 ./examples/am437x/PRU_RPMsg_Echo_Interrupt$${i}_$${j}/gen/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+		done; \
 	done
 
 pru-icss_install_am572x: pru-icss_install_common
-- 
2.7.4


