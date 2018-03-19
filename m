Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id AE0CD52970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 20:41:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JKeRRP019371
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521492027;
	bh=puxLjc5Qx7paNGYzrQ2G6eR4CGiSPotf/K9JolLxNiw=;
	h=From:To:Subject:Date;
	b=Kjjknwyrdka0UO7eTDcPvBSwld58c2Qj1l/IMbkDB9cgOys94kJ8ysKkOWyz6tiXJ
	tIyyrvBnlH1Mf8hH8EGmLni2d2V//SZpeBaJDp6Ape3hMqF1T2SeaMv7uFRB0zyuNB
	v3KkTb8tIF/f4D56xU3d+Kra4+waddmDLk/4WeVU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKeQQO028847
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:40:26 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 15:40:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 15:40:26 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKeQlU024750
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:40:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 16:40:12 -0400
Message-ID: <1521492012-26648-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] board-rtos: Updating to version 01.00.10.00A
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
X-List-Received-Date: Mon, 19 Mar 2018 20:41:26 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Adding INSANE_SKIP_${PN} = "arch"

 recipes-bsp/board-rtos/board-rtos_git.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
new file mode 100644
index 0000000..8c8b21e
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -0,0 +1,10 @@
+# Below commit ID corresponds to "DEV.BOARD.01.00.10.00A"
+BOARD_SRCREV = "14636b1363383167abb8d2b8ed6297d0b1c64930"
+
+PV = "01.00.10.00A"
+PR = "r0"
+
+DEPENDS_append_dra7xx = " pm-lld-rtos \
+                          mmcsd-lld-rtos \
+"
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


