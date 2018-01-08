Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A11EB52A08
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXvFW025166
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454437;
	bh=rOF2aLV0UODL9yZnpoFsJBea9a5X2BFTDP7elltVfGw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oI3ox1J9e0iaIQ1kPcnm5xOH0h8tAsUYCDzQOrizx2qgrjp1rfD0EB22cmaWKkiMg
	xzgH+JzSBATYmwsV1lFoRFWMg7q3fqfTfjyGdfaj10DD1PrbIUI2cvJ2i5iq4muOVQ
	c8xesSSOXFO89wFPS0GoUZcsxaLrSXEVWI/pEvPo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXv3a025909
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:57 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:57 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:57 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrhF019194;
	Mon, 8 Jan 2018 17:33:56 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:38 -0500
Message-ID: <1515454420-19972-11-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 10/12] spi-lld-rtos: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
deleted file mode 100644
index fb0c7ca..0000000
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.09"
-SPI_LLD_SRCREV = "85ae103a18df777512a8485a4ed7f84189ee0ff6"
-
-PV = "01.00.00.09"
-PR = "r0"
-- 
1.9.1


