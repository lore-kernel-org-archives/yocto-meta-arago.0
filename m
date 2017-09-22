Return-Path: <i-pang@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7096152A67
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 20:00:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MK0mWP015923
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 15:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506110448;
	bh=emsCXHIhskBhW6of54Uz71M+IfyyyniCW/IoqKc1Nzs=;
	h=From:To:Subject:Date;
	b=CqqqJ8W50hG4hWkd3ReuaIL2eBrdLR0LFaY9n1g75RsYuAEbSYc6WmRCneViMLc//
	1gC/3QiEaeIX7KUC5P1FgJVU6lRfwu/X8Oq19LlTrC6JImANmcGRcyfCe3rfAtTB8U
	Emo7yIC+zaMoVLcl+NNCCDEmaEFjerbzvFzmDNuQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MK0md5025747
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 15:00:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 15:00:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 15:00:47 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MK0laD020264
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 15:00:47 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 15:00:47 -0500
Message-ID: <1506110447-30676-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] edma3-lld: updated to version 2.12.5.29
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
X-List-Received-Date: Fri, 22 Sep 2017 20:00:49 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc        | 4 ----
 recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc        | 4 ++++
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 2 +-
 recipes-bsp/edma3-lld/edma3-lld_git.bbappend      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc

diff --git a/recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc b/recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc
deleted file mode 100644
index 5a57119..0000000
--- a/recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_04_28A"
-EDMA3_LLD_SRCREV = "8a8ed96465b6625cc3446a65fecebd9c510f4342"
-
-PV = "2.12.04.28"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc b/recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc
new file mode 100644
index 0000000..57a8c02
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc
@@ -0,0 +1,4 @@
+# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_05_29"
+EDMA3_LLD_SRCREV = "2e6011af7e4045c3c26c01f8ace7427a7a3dec10"
+
+PV = "2.12.05.29"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
index 26b6f4c..1534652 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
@@ -1 +1 @@
-require edma3-lld-2.12.4.inc
+require edma3-lld-2.12.5.inc
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
index 26b6f4c..1534652 100644
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
@@ -1 +1 @@
-require edma3-lld-2.12.4.inc
+require edma3-lld-2.12.5.inc
-- 
1.9.1


