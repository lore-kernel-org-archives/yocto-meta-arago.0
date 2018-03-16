Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id DF9A552986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:52:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGpciq023303
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521219098;
	bh=03owsbEloGO7q0J1HutH+Xq4+cyzdAGbCsF+Vf32XMI=;
	h=From:To:Subject:Date;
	b=sknpxWo52k2Bc3pMwjaaDqgd+/oEPy6HX/i0leo32kY5m6EY81KmlAFKcWgyjNNE3
	os5BBeLR2eCkWFH2YwusQTAEz/H/ptpp64K52a5mRMJxHG32MXrYniQ4E/IoiJlBgx
	0qdxjb4O3J5MTfoVSY7iYrHXm6E3LRAyrU7ndcPQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGpcsi032695
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:51:38 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:51:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:51:38 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGpbi2010191
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:51:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:51:21 -0400
Message-ID: <1521219081-29068-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] osal: Update to version 01.00.00.10
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
X-List-Received-Date: Fri, 16 Mar 2018 16:52:33 -0000
Content-Type: text/plain

---
 recipes-bsp/osal/osal-01.00.00.10.inc   | 5 +++++
 recipes-bsp/osal/osal-rtos_git.bbappend | 1 +
 recipes-bsp/osal/osal-test_git.bbappend | 1 +
 recipes-bsp/osal/osal_git.bbappend      | 1 +
 4 files changed, 8 insertions(+)
 create mode 100644 recipes-bsp/osal/osal-01.00.00.10.inc
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 create mode 100644 recipes-bsp/osal/osal_git.bbappend

diff --git a/recipes-bsp/osal/osal-01.00.00.10.inc b/recipes-bsp/osal/osal-01.00.00.10.inc
new file mode 100644
index 0000000..56541ef
--- /dev/null
+++ b/recipes-bsp/osal/osal-01.00.00.10.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.10"
+OSAL_SRCREV = "91e954dd18b8ee6480b9d655d9c1306aee9e7ac1"
+
+PV = "01.00.00.10"
+INC_PR = "r0"
diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
new file mode 100644
index 0000000..40ff49b
--- /dev/null
+++ b/recipes-bsp/osal/osal-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/osal/osal-01.00.00.10.inc
diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
new file mode 100644
index 0000000..40ff49b
--- /dev/null
+++ b/recipes-bsp/osal/osal-test_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/osal/osal-01.00.00.10.inc
diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
new file mode 100644
index 0000000..40ff49b
--- /dev/null
+++ b/recipes-bsp/osal/osal_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/osal/osal-01.00.00.10.inc
-- 
1.9.1


