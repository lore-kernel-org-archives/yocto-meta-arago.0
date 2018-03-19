Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 60BC852968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:37:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEacBN014219
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470198;
	bh=UEAyjU2I8iwFLh4CnIeZs8FEiMtPDMamqAmLMj/HIKo=;
	h=From:To:Subject:Date;
	b=DRkcByaEXGm30N0FZxQN4vIdMca/BlYR6yEAvvJxE1XLXMPCOR5PvIWbTtMAnL/3J
	DJpdID1ifZawO/n63GlfrvdDkmxuJFaiviHu/QkpiHA+R1J8YuKdJGIFqgAm3POFzk
	0kPny7rKDM709gYJRvD153/kmKKJ+Sh2kxn0OFIE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEacch013261
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:36:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:36:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:36:37 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEabYP003210
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:36:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:36:36 -0400
Message-ID: <1521470196-11133-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] pm-lld-rtos: Updating to version 01.04.00.04 & 01.08.00.17 for am57xx/dra7xx
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
X-List-Received-Date: Mon, 19 Mar 2018 14:37:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
new file mode 100644
index 0000000..b6d1b8d
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
@@ -0,0 +1,9 @@
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.04"
+PM_LLD_SRCREV = "1c0cae9b001137f68f34bf9168d7c3fa9036b1a6"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.17"
+PM_LLD_SRCREV_dra7xx-evm = "720f7df19f1b34cd72d8d3937baf5ff0011fd5dd"
+PM_LLD_SRCREV_am57xx-evm = "720f7df19f1b34cd72d8d3937baf5ff0011fd5dd"
+
+PV = "01.04.00.04"
+PR = "r0"
-- 
1.9.1


