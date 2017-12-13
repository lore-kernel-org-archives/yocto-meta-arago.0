Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B23DC52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 15:05:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDF508E010176
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 09:05:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513177500;
	bh=A3ubx6xxSdCjIKPnpIhtUsB0yem9+fx+PPtpSctafb4=;
	h=From:To:Subject:Date;
	b=Sp6G9ES3WJL5oznaqfd5vaT7DXzfOb+EfhymY7E/9D1t5uYC6YgVDWSoFIROL8m0w
	K4bTFYuwo0Sje8PIZpaI2H5Zu1VSW6d99ggaT7hJZOGyluSrNehZCD9ndccpwKHaQ0
	t/jni4bzi2cPquWhoMjyr2VutKRGI8erGii4tLhs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDF4tKI001371
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 09:04:55 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 09:04:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 09:04:55 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDF4tcH024748
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 09:04:55 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 10:04:52 -0500
Message-ID: <1513177492-50671-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] fatfs-rtos:Update to version 1.0.0.8
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
X-List-Received-Date: Wed, 13 Dec 2017 15:05:11 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend
new file mode 100644
index 0000000..8fe219f
--- /dev/null
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend
@@ -0,0 +1,7 @@
+
+# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.08"
+FATFS_SRCREV = "374ae86c9b1f3a4ffbbb09c739e6e5d6709afd09"
+
+PV = "01.00.00.08"
+PR = "r0"
+
-- 
1.9.1


