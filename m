Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6546C52994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 15:39:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFcM39031885
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521214702;
	bh=Sr4F+17FuITts703vQGbCPtpO5Zn0xv0vIWbyqNOi6U=;
	h=From:To:Subject:Date;
	b=AorEZDL4ENaAvhAgRL5yiw/A59u9mm+gq+XFnPqZbe9uFbGfk6PYzNzCXy2a0GXNN
	NjLdeNV8tM+HyhzS8bd+pWwdtnQPj5hDBoaZUF3lh8JIpuvabQAvQXEVM6aK15AFw4
	Yb7bWj2XJN4hOqIFFb9ZVaJOeF146tLHdQ1Vk8qc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFcMuA019967
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:38:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:38:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:38:21 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFcLDB010105
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:38:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 11:38:20 -0400
Message-ID: <1521214700-26461-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] common-csl-ip: Updating to version 03.03.00.10
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
X-List-Received-Date: Fri, 16 Mar 2018 15:39:16 -0000
Content-Type: text/plain

Also removing redundant definitions which are present in meta-ti

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc   | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 7 +++++--
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc
new file mode 100644
index 0000000..b43a671
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.10"
+CSL_SRCREV = "b252ed25443938ff59a6622aee2de7bc36304787"
+
+PV = "03.03.00.10"
+INC_PR = "r0"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
index 06132fb..47f275a 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -1,5 +1,8 @@
-PR_append = ".tisdk0"
+require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc
+
+PR_append = ".tisdk1"
 
 # opencl-monitor does not distinguish between am57xx-evm and dra7xx-evm and thus
 # requires the am57xx-evm CSL libraries for both devices.
-TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
+TI_PDK_LIMIT_SOCS_append_dra7xx = " am574x"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..22fa7d6
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc
-- 
1.9.1


