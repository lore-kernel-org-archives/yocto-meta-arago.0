Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 00CAE52985
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 17:06:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEH6FaG029364
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 11:06:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513271175;
	bh=j5+/9dbR5H2H68ZrZ4mIjAPWFu/euwjwaNqM29lbD90=;
	h=From:To:Subject:Date;
	b=gqok1fxmDsg+e7UuWbCiUutxWEBAdySbPsudW7hkIcAM0FmeH4i0zCECWWxGWVQko
	AGT8I8ldkQZYJxDzKb2PllQj/7f1rNBf7z9pST+gkO7uniGVxCo+nlesZOolvrOnAX
	lJc5niKMmL9o24AgOnEmz7O+enssmuLbruRF8+1g=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEH6AoA025224
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 11:06:10 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 11:06:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 11:06:09 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEH69mZ017685
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 11:06:09 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 12:06:07 -0500
Message-ID: <1513271167-31591-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] spi-lld-rtos: Updating to version 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 17:06:26 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
new file mode 100644
index 0000000..fb0c7ca
--- /dev/null
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.09"
+SPI_LLD_SRCREV = "85ae103a18df777512a8485a4ed7f84189ee0ff6"
+
+PV = "01.00.00.09"
+PR = "r0"
-- 
1.9.1


