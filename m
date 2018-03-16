Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9C96A52986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:36:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGZCMB006597
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521218112;
	bh=4QK67/fRT8r/Ijzz96eqjthdY00/FWfEyrZhCllszfQ=;
	h=From:To:Subject:Date;
	b=Ci7fk2X6yS3K4UDFTXVWB3WVMsWozbsLJ/m8nhZXir3LMcMr/M9h58WyJf4ZeRn7z
	6QRukpfr4GNWtNu1Fcss0A79c+QsQiwA5L3Qqs/Mo2b2IIbKtIki3o3RcNAsXfDB79
	fmzTe+u9wtayPaIiB4XJzjZPqmqG2B2PQ87Y3zrA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGZCd0009194
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:35:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:35:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:35:11 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGZBeS025065
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:35:11 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:35:09 -0400
Message-ID: <1521218109-28032-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] edma3-lld-rtos: Updating to version 02.12.05.30C
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
X-List-Received-Date: Fri, 16 Mar 2018 16:36:06 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 -Corrected the name of the .inc file


 recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc  | 7 +++++++
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 1 +
 recipes-bsp/edma3-lld/edma3-lld_git.bbappend      | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld_git.bbappend

diff --git a/recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc b/recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc
new file mode 100644
index 0000000..15413f7
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc
@@ -0,0 +1,7 @@
+# Below commit ID corresponds to version 2.12.05.30C
+EDMA3_LLD_SRCREV = "a52b8f2a4bd4ca584bbd5bebba30563add353c5a"
+
+PV = "2.12.05.30C"
+INC_PR = "r0"
+
+
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
new file mode 100644
index 0000000..5f7a9f3
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
new file mode 100644
index 0000000..5f7a9f3
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc
-- 
1.9.1


