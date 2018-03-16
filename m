Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 010DA52994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 15:30:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFTTfm027169
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521214169;
	bh=gjnnon59ywLiGP/uPa0sid8Ty87lmsi8viLNeprFE0A=;
	h=From:To:Subject:Date;
	b=clTz1hVRUlWBZobOJ49B9umTQtDJbx4XWx6wBvZ4M+dwfjrqWOjLZkVw2fEJEpV5X
	MYC1dsREoLrZy1ulKnBtxQO007m+DV6H8SOCIa3Ol6h1ZVr5E55l7FseX1cEe4+oaZ
	qXbtuJjeEr0MjFFdeqVGXupukaOAOY0rXmG34z8o=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFTTnT026373
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:29:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:29:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:29:28 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFTS0M030379
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:29:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 11:29:23 -0400
Message-ID: <1521214163-26118-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] board-rtos: Updating to version 01.00.10.00A
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
X-List-Received-Date: Fri, 16 Mar 2018 15:30:25 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
new file mode 100644
index 0000000..a7d7fbe
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -0,0 +1,9 @@
+# Below commit ID corresponds to "DEV.BOARD.01.00.10.00A"
+BOARD_SRCREV = "14636b1363383167abb8d2b8ed6297d0b1c64930"
+
+PV = "01.00.10.00A"
+PR = "r0"
+
+DEPENDS_append_dra7xx = " pm-lld-rtos \
+                          mmcsd-lld-rtos \
+"
-- 
1.9.1


