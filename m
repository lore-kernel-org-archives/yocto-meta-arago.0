Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3213C52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 21:57:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDLv5fu001227
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 15:57:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513202225;
	bh=FQvbN5YkmVHj9k1iBT7bXGMqtyZ0wB2FWUfbYCcZ5TQ=;
	h=From:To:Subject:Date;
	b=SycgDKka8Uko2hynIwowHU1tqdXMX8pw+2C4eurDTd3M79SmEdm1tYLVYISh2Dz5W
	dicexNg2qEszhpUM7r52E4J5xdzGzrH1ytiFOYWmy9JIhFxAC3dGohNA1xiuwhRKrJ
	8Q386zFkjwo0ESFdEgz1b3SGBf6tXc1ekvCM66mQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLv5Tr007294
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 15:57:05 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 15:57:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 15:57:03 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLv3QB029788
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 15:57:03 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 16:57:02 -0500
Message-ID: <1513202222-22795-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] uart-lld-rtos: Updating to revisoin 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 21:57:06 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
new file mode 100644
index 0000000..67249f5
--- /dev/null
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.09"
+UART_LLD_SRCREV = "f3670e497186b5ec5258d0e51fb1ebdaa3d60577"
+
+PV = "01.00.00.09"
+PR = "r0"
-- 
1.9.1


