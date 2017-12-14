Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2E6065209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 16:56:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEGu8CQ027466
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 10:56:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513270568;
	bh=ErNukVDqP6v8CneDev8nDJOy2YjnIrdqnidTanL0zRw=;
	h=From:To:Subject:Date;
	b=f3so+qWSRjG0t5Rfi+xbV/3Tv2H6XLj3HQSW7SJdYrKCGj/z/M9EQm/cMXNoYWwcj
	Uy8v1AM3wkpfW77BHWqGDKoYfsMUjiIa5Gpasun5+3obB7nqi50YyuzEOzAp6owDGX
	VOdtYPrTST3R1r9pl/fx9uMza2gfM4Gm8hi89WZA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEGu2t9016219
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 10:56:03 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 14 Dec 2017 10:56:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 14 Dec 2017 10:56:03 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEGu2fV003021
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 10:56:03 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 11:55:59 -0500
Message-ID: <1513270559-30689-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] i2c-lld-rtos: Updating to version 1.0.0.9A
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
X-List-Received-Date: Thu, 14 Dec 2017 16:56:19 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
new file mode 100644
index 0000000..2f01fe3
--- /dev/null
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.09A"
+I2C_LLD_SRCREV = "1a0e371f1c992b3f28cb160c6e3ada33d382f6a9"
+
+PV = "01.00.00.09A"
+PR = "r0"
-- 
1.9.1


