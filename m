Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id BD1BA52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 22:00:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDM0b0x013516
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:00:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513202437;
	bh=ThCgbvCWnmU+9kTnWOhmmoKRN5V2r8k1dEC//pXZYbk=;
	h=From:To:Subject:Date;
	b=h78XopPusgTNC5XiXWYCcNqDn5Uag1a+bSm94AFmuS9QJ9JoXelKyxHAyN9lSN6tf
	06Ypxm4sHCY9xhnRFMT8M0h2XlI+uiisfax2hvX0j5pnceOpGeinMl+F1VuyIIsvfw
	V+V7AL+UFOB45TohSCCCj1WgtItq4UyiIMAWAqJY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDM0WTd012995
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:00:32 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 16:00:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 16:00:31 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDM0VZs018545
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:00:31 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 17:00:15 -0500
Message-ID: <1513202415-23104-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] meta-processor-sdk: Updating to version 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 22:00:48 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
new file mode 100644
index 0000000..4566e2f
--- /dev/null
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
@@ -0,0 +1,7 @@
+
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.09"
+GPIO_LLD_SRCREV = "99a20a668f36217705d57f7cc2f7faf1a5533bbe"
+
+PV = "01.00.00.09"
+PR = "r0"
+
-- 
1.9.1


