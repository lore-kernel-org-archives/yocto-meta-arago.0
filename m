Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 44E5852093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 20:03:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDK3fMX004169
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:03:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513195421;
	bh=KL9stRxfEO/DGH0ywIrPK/t89aTTPFU5q2P2TSxGga0=;
	h=From:To:Subject:Date;
	b=pxIf8PzrYtuJbce6B3DqipVcQ5cmdZzsLmF1U8cnyo8xWYF5cwxDfCTNPtqXUxsRJ
	+VAhhQ06RZmfn2BqiIRlYknqA35I8GBFX/3o9ZnnUGcUL2li6WhDHkamMkVOFyMH0e
	Ag7qP86EE2GwDK4tw4ZkQwsuuxSumn+QpBxHl4C8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDK3flf007769
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:03:41 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 14:03:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 14:03:41 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDK3fCs018027
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:03:41 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 15:03:40 -0500
Message-ID: <1513195420-13997-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] mmcsd-lld-rtos: Update to version 1.0.0.10
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
X-List-Received-Date: Wed, 13 Dec 2017 20:03:42 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
new file mode 100644
index 0000000..b49c4fa
--- /dev/null
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
@@ -0,0 +1,6 @@
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.10"
+MMCSD_LLD_SRCREV = "9bb118bdc1ac46863f57a68d70f421734a4dcf25"
+
+PV = "01.00.00.10"
+PR = "r0"
+
-- 
1.9.1


