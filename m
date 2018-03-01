Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id A913652976
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:56:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21Ju021032022
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:56:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519934160;
	bh=5zzzrOIlRGEf/I9G5oBDrimFinAkdv/IovnRac43mx4=;
	h=From:To:CC:Subject:Date;
	b=HhD2iQnS3f41awq7CUR8X4v/nvZJhONe7lLUAgwd6ZM2XSzroryTTL5H0TgJkh5Dx
	WclLj56svwzZteTFEv9uSBcq97YczGFOFgJcy8vSwxCD+PJ3zGojDUG480mPrWDonk
	8A9dtXO/HpqX35PwH4sQ3vJdsfRgFwNV9+MBycAc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21Ju0Rd011866
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:56:00 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:56:00 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:56:00 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21Ju0rL025626;
	Thu, 1 Mar 2018 13:56:00 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 14:55:58 -0500
Message-ID: <1519934158-60521-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][master][PATCH] ti-ipc: Update corrected 3.47.01.00 GA version
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
X-List-Received-Date: Thu, 01 Mar 2018 19:56:36 -0000
Content-Type: text/plain

Minor update for documentation and build optimization
This is specifically a patch for morty.
Upstream meta-ti will have patches sent for rocko.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-3.47.01.00.inc              | 2 +-
 recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend | 2 +-
 recipes-ti/ipc/ti-ipc-examples_git.bbappend       | 2 +-
 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc         | 9 +++++++--
 recipes-ti/ipc/ti-ipc-rtos_git.bbappend           | 2 +-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
index 66bcda4..02abfa6 100644
--- a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
+++ b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
@@ -1,4 +1,4 @@
 PV = "3.47.01.00"
 
-#Corresponds to 3.47.01.00
+#Corresponds to 3.47.01.00A
 TI_IPC_SRCREV = "6a2595a4148fb12f259efc19164a9d33ad2ed294"
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
index 4adc0e6..c0eac74 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 require ti-ipc-3.47.01.00.inc
 
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bbappend b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
index 4adc0e6..c0eac74 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 require ti-ipc-3.47.01.00.inc
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
index ffe6ef9..8274dd5 100644
--- a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
@@ -1,2 +1,7 @@
-# Corresponds to tag: 3.47.01.00
-SRCREV_ipc-metadata = "f78329ff0b2c65469271dab59e232e6e0dc82dc7"
+# Corresponds to tag: 3.47.01.00A
+SRCREV_ipc-examples = "7f23e9b0ae395461b0854881dcc174392355d854"
+
+# Corresponds to tag: 3.47.01.00A
+SRCREV_ipc-metadata = "72578cce9c9f9a932eb22b3397b46131efb12d69"
+
+PR = "${INC_PR}.r4"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
index 4adc0e6..c0eac74 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 require ti-ipc-3.47.01.00.inc
 
-- 
1.9.1


