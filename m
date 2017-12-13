Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CCDB05209B
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 19:34:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDJYZn0024189
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 13:34:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513193675;
	bh=T6yoteYigjGq0yPM+FUJLX3Hu3wP3P+50nPv1LHk7Rg=;
	h=From:To:Subject:Date;
	b=dWti3KhtKH+o39+RvP9ZY7q7Y3+eUGvbW59T0t5ZrD3tWUidVR4iprHexVtBCxT/X
	SVn9l7Eq/5KkF4v3vyWnE2n16kUemarF4bRv/q41M3DlZv7UJbw2cWrM/Su+gG10Qm
	1PdpchUB1atb6v8Q9TScIBHewUJuoAVDc2cDvx3g=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDJYUfB001210
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 13:34:30 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 13:34:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 13:34:29 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDJYTRV012599
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 13:34:29 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 14:34:26 -0500
Message-ID: <1513193666-10626-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] osal: Update to version 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 19:34:46 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

---
 v2 - Removed the reference to osal.inc
 v1 - Initial draft

 recipes-bsp/osal/osal-1.0.0.9.inc       | 7 +++++++
 recipes-bsp/osal/osal-rtos_git.bbappend | 2 ++
 recipes-bsp/osal/osal-test_git.bbappend | 2 ++
 recipes-bsp/osal/osal_git.bbappend      | 2 ++
 4 files changed, 13 insertions(+)
 create mode 100644 recipes-bsp/osal/osal-1.0.0.9.inc
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 create mode 100644 recipes-bsp/osal/osal_git.bbappend

diff --git a/recipes-bsp/osal/osal-1.0.0.9.inc b/recipes-bsp/osal/osal-1.0.0.9.inc
new file mode 100644
index 0000000..f5c8118
--- /dev/null
+++ b/recipes-bsp/osal/osal-1.0.0.9.inc
@@ -0,0 +1,7 @@
+
+PV = "01.00.00.09"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.09"
+OSAL_SRCREV = "0bb1151f3622fb65f41f1d3dcffcee63fe9724de"
+
diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
new file mode 100644
index 0000000..dadb121
--- /dev/null
+++ b/recipes-bsp/osal/osal-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.9.inc
+
diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
new file mode 100644
index 0000000..dadb121
--- /dev/null
+++ b/recipes-bsp/osal/osal-test_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.9.inc
+
diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
new file mode 100644
index 0000000..dadb121
--- /dev/null
+++ b/recipes-bsp/osal/osal_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.9.inc
+
-- 
1.9.1


