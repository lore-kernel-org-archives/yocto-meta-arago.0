Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B9F6D52994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 15:50:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFnxnB001642
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521215399;
	bh=BVJJ2OqOQmXkYGRdlplAglKWQ4hlTFdKeYGK85RZmps=;
	h=From:To:Subject:Date;
	b=l9SM1X1RAti4kypjfYXmJ9e/yV+tsNO1wcnkeB+FpwURPGfo1KkrYsaYMyYzIeEiM
	uYZqXHl8/hbdrzq5aNzhoNbPqP3vm8pLs+Tg/P3avAusb/gy5/3vFPJ9nO5MxGJDUM
	CxUmA5PZQOX0L5hooNBlorHnTLPB1mYDs5bBGR7o=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFnxYp004997
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:49:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:49:59 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:49:59 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFnxhh030394
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:49:59 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 11:49:58 -0400
Message-ID: <1521215398-26773-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] edma3-lld-rtos: Updating to version 02.12.05.30C
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
X-List-Received-Date: Fri, 16 Mar 2018 15:50:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc  | 7 +++++++
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 1 +
 recipes-bsp/edma3-lld/edma3-lld_git.bbappend      | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld_git.bbappend

diff --git a/recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc b/recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc
new file mode 100644
index 0000000..15413f7
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc
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


