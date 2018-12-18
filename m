Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E954B52ADE
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 22:21:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIML3XF038528
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545171663;
	bh=kzLoagEO9zdG7f70SIl59/c+/GZt7qSBCv9fu8+HdeI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=IiorQBiyWaRcoX91WZiHE83zaL4biNNTpOgiQPy3eKUN/7zOyp5k7AXNFgTDj2jjK
	QeYzDTuzZBjEw8oiVT63hmWDzaW1boer5kD9v3rGmLHaZhs4eNxdFYBPXzkEod36LM
	Q5OgCLayL42M3y1fgUs/mw4Zb4pCYMlc/SVmQ9AA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIML3Bh057426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:21:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:21:02 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIML1RD018057
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:02 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 17:20:57 -0500
Message-ID: <1545171658-17410-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 5/6] spi-lld-rtos: SRCREV update to 01.00.00.13A
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
X-List-Received-Date: Tue, 18 Dec 2018 22:21:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
new file mode 100644
index 0000000..4009250
--- /dev/null
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
@@ -0,0 +1,6 @@
+
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.13A"
+SPI_LLD_SRCREV = "2c6c4fe250383c8854be8fd58a6b599dbbe3fe8e"
+
+PV = "01.00.00.13A"
+PR = "r0"
-- 
1.9.1


