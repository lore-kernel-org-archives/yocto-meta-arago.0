Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 300FA5209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 17:53:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEHr3M3003986
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 11:53:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513273983;
	bh=nAvrZiTKU6D2YhphEy79AoviGdZbj3bwpT45+MZET6A=;
	h=From:To:Subject:Date;
	b=tVtQ2fPGF/Ke8bcsXeyfMAM6gJ+ctvEmW50de1NcwDV9cRxWKllRUOdkjoW42DKHo
	3oxOlaSgeJBsMUkgiDMd3ixUW4cmZCT/OmuEQUOvTuLbZ3/CxpAGn78whx12iQVyEj
	+pFMf3X6VOYDuOhTtMZvf2SMZgkg/Krfw+0cynLY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEHqwL3026498
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 11:52:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 11:52:58 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 11:52:58 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEHqvsW007601
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 11:52:57 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 12:52:56 -0500
Message-ID: <1513273976-35275-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] edma3-lld: Updating to version 2.12.05.30B
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
X-List-Received-Date: Thu, 14 Dec 2017 17:53:14 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc   |  5 ++++
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 36 +++++++++++++++++++++++
 recipes-bsp/edma3-lld/edma3-lld_git.bbappend      |  2 ++
 3 files changed, 43 insertions(+)
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld_git.bbappend

diff --git a/recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc b/recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc
new file mode 100644
index 0000000..7f2ec29
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to version 2.12.05.30B
+EDMA3_LLD_SRCREV = "f0179381d5b18a1aea2c13ec29e9d45e419153d6"
+
+PV = "2.12.05.30B"
+INC_PR = "r0"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
new file mode 100644
index 0000000..0549f3d
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
@@ -0,0 +1,36 @@
+
+require recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc
+
+PLATFORMLIST_append_dra7xx-evm = " \
+        tda3xx-evm \
+"
+
+TARGETLIST_c66x = " \
+        66 \
+"
+
+PLATFORMLIST_c665x-evm = " \
+        c6657-evm \
+"
+
+PLATFORMLIST_c667x-evm = " \
+        c6678-evm \
+"
+
+PLATFORMLIST_omapl1 = " \
+        omapl137-evm \
+        omapl138-evm \
+"
+
+TARGETLIST_omapl1 = " \
+        arm9 \
+        674 \
+"
+
+EXTRA_OEMAKE_remove = "TARGET=66"
+
+do_configure_prepend () {
+    rm -rf ${S}/examples/edma3_driver/evmTCI6614
+    rm -rf ${S}/examples/edma3_driver/evmTCI6614BE
+}
+
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
new file mode 100644
index 0000000..be6c80f
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc
+
-- 
1.9.1


