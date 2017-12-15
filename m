Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D50C5529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 20:47:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFKlfaC014521
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:47:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513370861;
	bh=Z0bLNbbBO46DIwVEitPBb6jTysIGgXU4GynxvDp1A98=;
	h=From:To:Subject:Date;
	b=HXPDMR+z5iviz1RxwiYfzD8qZtkLQmjGd41KXPKt3yCkiUoPPRYAA55MsaoPeQ/+C
	KqoLv92aYmTk6rn1XesOFyAJ6UA6Zfo8PXmqJf1dsL5QGcnslOZePU31ljiVh5ChbB
	Cqi2EkpSjsi3tKYGZq+JpVIXSaZUpd8X4k03w42E=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKlfbJ000666
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:47:41 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 14:47:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 14:47:40 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKleVJ012998
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:47:40 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 15:47:32 -0500
Message-ID: <1513370852-18622-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] usb-lld-rtos: Update to version 1.0.0.12B & add omapl1 support
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
X-List-Received-Date: Fri, 15 Dec 2017 20:47:42 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Rename the patch to .bbappend
 v1 - Initial draft

 recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend b/recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend
new file mode 100644
index 0000000..0407e06
--- /dev/null
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend
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


