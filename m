Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id DC221529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 20:36:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFKadLe014064
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:36:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513370199;
	bh=xh2SEe2est0Ojvw4VKL8BSB9KRgUohcI0LvFIFeXwWg=;
	h=From:To:Subject:Date;
	b=FNuS/rT0xOgraBEPDqYmxFI+h52fviBq5+6yD+Lh/xN46p3ZBu/58YvLolDnrg6F3
	n3jnVtRQe1f4zA9eR08WoaIOLbpMFEbk1QuGYbLjeejDQxnKSGaFWvRyE5B2xe6lOG
	7rfkwI+rm2MA6B+sg99DytmY+A+U4xlcslDilR6I=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKacWI020700
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:36:39 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 14:36:38 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 14:36:38 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKac2x000819
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:36:38 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 15:36:36 -0500
Message-ID: <1513370196-15761-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] usb-lld-rtos: Update to version 1.0.0.12B & add omapl1 support
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
X-List-Received-Date: Fri, 15 Dec 2017 20:36:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bb

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
new file mode 100644
index 0000000..0407e06
--- /dev/null
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -0,0 +1,7 @@
+COMPATIBLE_MACHINE_append = "|omapl1"
+
+# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.12B"
+USB_LLD_SRCREV = "c055edbc2e6bf6aad95aa6e83e46a9ff03ee026b"
+
+PV = "01.00.00.12B"
+PR = "r0"
-- 
1.9.1


