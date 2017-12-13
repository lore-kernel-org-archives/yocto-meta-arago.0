Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7CFDC52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 14:28:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDESYJl023539
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 08:28:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513175314;
	bh=6GBehjkgNYg73w7AjntmarShy6+RNajSAn2bkPljXSM=;
	h=From:To:Subject:Date;
	b=hnhRb2oj+YkmlsW1hOxRyV9pd/9rrmJLafoXJeZSphe52Bis1kc4M3Y9R3fRBwpkp
	USkVJxi9SUWJiviJVcHoWlz9NNeuAEpizCG+UcKTSmJpAj6b61sHaz878riahv2jzz
	J5AMF3I2E3WGd+sYD2r7I4sSCZrPFyGpz2SVaRw0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDESYQL008126
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 08:28:34 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 08:28:34 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 08:28:34 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDESYMs005707
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 08:28:34 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 09:28:32 -0500
Message-ID: <1513175312-47245-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] starterware: Update to version 2.1.1.5
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
X-List-Received-Date: Wed, 13 Dec 2017 14:28:35 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/starterware/starterware-2.1.1.5.inc       | 8 ++++++++
 recipes-bsp/starterware/starterware-rtos_git.bbappend | 2 ++
 recipes-bsp/starterware/starterware_git.bbappend      | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 recipes-bsp/starterware/starterware-2.1.1.5.inc
 create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bbappend
 create mode 100644 recipes-bsp/starterware/starterware_git.bbappend

diff --git a/recipes-bsp/starterware/starterware-2.1.1.5.inc b/recipes-bsp/starterware/starterware-2.1.1.5.inc
new file mode 100644
index 0000000..ddfcf52
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-2.1.1.5.inc
@@ -0,0 +1,8 @@
+require recipes-bsp/starterware/starterware.inc
+
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.05"
+STARTERWARE_SRCREV = "58526af258ef9a10a9eec32d2a6e3a1c9e6f9e88"
+
+PV = "02.01.01.05"
+INC_PR = "r0"
+
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bbappend b/recipes-bsp/starterware/starterware-rtos_git.bbappend
new file mode 100644
index 0000000..e248e3f
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/starterware/starterware-2.1.1.5.inc
+
diff --git a/recipes-bsp/starterware/starterware_git.bbappend b/recipes-bsp/starterware/starterware_git.bbappend
new file mode 100644
index 0000000..e248e3f
--- /dev/null
+++ b/recipes-bsp/starterware/starterware_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/starterware/starterware-2.1.1.5.inc
+
-- 
1.9.1


