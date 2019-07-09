Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A210B520E0
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2019 21:36:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69LZxPL097685
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2019 16:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562708159;
	bh=zYyLgr5oLsDqlewPHWRzvu7uXXHGXV2YMHEZefkNkws=;
	h=From:To:CC:Subject:Date;
	b=LLkK/WNmmjF9MP76RSXVDp4EyT8MM3jU7v6eiPEk5voZHLIHzYfMmqfXHcBkTGsDf
	g5tcv8Pqpv0QD6iwofmFLDMS/WUe1zwyditwX8pRsGNuobP/vUTHpRdzS3JUcoVRqa
	yMlKosx8jQxWt7V69ySvBf2381R1DissTyLPfII0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69LZxRs074686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2019 16:35:59 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 9 Jul 2019 16:35:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 9 Jul 2019 16:35:59 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69LZwCY090029;
	Tue, 9 Jul 2019 16:35:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jul 2019 21:23:08 +0000
Message-ID: <20190709212308.11721-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-sci-fw: update SYSFW to 2019.06a
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
X-List-Received-Date: Tue, 09 Jul 2019 21:36:47 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.06.bb => ti-sci-fw_2019.06a.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.06.bb => ti-sci-fw_2019.06a.bb} (96%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
similarity index 96%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
index b6570a4a..99dc5b9b 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
@@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "3930363562b35a5f3d495a61ea7e51739462b14a"
+SRCREV = "ca194f3c597b3ebba9ceb032f13f1a4e7ffa5653"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "b78f394a997c919cff2733d1cf1d2f3b643ad02f"
+SRCREV_imggen = "9fb15bf62e95787cd6505ca4ac9f982ea6de0623"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1


