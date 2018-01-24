Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E863652988
	for <meta-arago@arago-project.org>;
	Wed, 24 Jan 2018 19:43:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0OJgtZj012621
	for <meta-arago@arago-project.org>; Wed, 24 Jan 2018 13:42:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516822975;
	bh=sv3F687iQEJnkaX0XYGJrCQYodXfDYZkZ0flpYYmWPs=;
	h=From:To:CC:Subject:Date;
	b=JgXNmtbDWuLpgEZJyAIqohAmXNb3PwPKiHs76/UpqF6BbNDz1EGtXY/mbDUcYUXt/
	mazTgkgNjzbHyEyDOukDCSWPS/iPcDNUUSUJ7CqoxAfO6S0FEHdsHB3efa3zYn+Hkd
	Sj9Tq+MIPe80scm1w1cc+pGgCBwf0xdXMRaJk3oM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0OJgtxC024117
	for <meta-arago@arago-project.org>; Wed, 24 Jan 2018 13:42:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 24 Jan 2018 13:42:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 24 Jan 2018 13:42:54 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0OJgssA024963;
	Wed, 24 Jan 2018 13:42:54 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Jan 2018 14:42:53 -0500
Message-ID: <1516822973-8380-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty/master][PATCH] ti-ipc: Update to new version 3.47.01.00
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
X-List-Received-Date: Wed, 24 Jan 2018 19:43:20 -0000
Content-Type: text/plain

This update is specifically for morty.
Upstream meta-ti/rocko will have patches for 3.47.01.00

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-3.47.01.00.inc              | 4 ++++
 recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend | 5 +++++
 recipes-ti/ipc/ti-ipc-examples_git.bbappend       | 5 +++++
 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc         | 2 ++
 recipes-ti/ipc/ti-ipc-rtos_git.bbappend           | 5 +++++
 recipes-ti/ipc/ti-ipc_git.bbappend                | 3 +++
 6 files changed, 24 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-ipc-3.47.01.00.inc
 create mode 100644 recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
 create mode 100644 recipes-ti/ipc/ti-ipc-examples_git.bbappend
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos_git.bbappend
 create mode 100644 recipes-ti/ipc/ti-ipc_git.bbappend

diff --git a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
new file mode 100644
index 0000000..66bcda4
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
@@ -0,0 +1,4 @@
+PV = "3.47.01.00"
+
+#Corresponds to 3.47.01.00
+TI_IPC_SRCREV = "6a2595a4148fb12f259efc19164a9d33ad2ed294"
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
new file mode 100644
index 0000000..4adc0e6
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+require ti-ipc-3.47.01.00.inc
+
+require ti-ipc-rtos-3.47.01.00.inc
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bbappend b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
new file mode 100644
index 0000000..4adc0e6
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+require ti-ipc-3.47.01.00.inc
+
+require ti-ipc-rtos-3.47.01.00.inc
diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
new file mode 100644
index 0000000..ffe6ef9
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
@@ -0,0 +1,2 @@
+# Corresponds to tag: 3.47.01.00
+SRCREV_ipc-metadata = "f78329ff0b2c65469271dab59e232e6e0dc82dc7"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
new file mode 100644
index 0000000..4adc0e6
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+require ti-ipc-3.47.01.00.inc
+
+require ti-ipc-rtos-3.47.01.00.inc
diff --git a/recipes-ti/ipc/ti-ipc_git.bbappend b/recipes-ti/ipc/ti-ipc_git.bbappend
new file mode 100644
index 0000000..96b3c2d
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+require ti-ipc-3.47.01.00.inc
-- 
1.9.1


