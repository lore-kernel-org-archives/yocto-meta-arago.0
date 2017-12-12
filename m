Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id EC2B05209B
	for <meta-arago@arago-project.org>;
	Tue, 12 Dec 2017 23:23:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBCNN6oj011144
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 17:23:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513120986;
	bh=Ccj/rY2zeOtkRtQJIoI9DeuWdnE1IxjmKa6ErEAVBFc=;
	h=From:To:Subject:Date;
	b=o8tZ3vKB8l7yCYPIqD/2Vq4uFNncAODQD6nAF8E5NSNHuI32vn+rTWcr3R6jSGaOv
	p2LU834t+3L8uzAjQPL3U1Z0O6DRHNH5n966QqR4uYmyTu6qDGunAwjgp6NIoB4JcV
	I4AjcT55aJyYCBYCfrHA0aOdYJ1khI01hQwNU6S8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCNN64w017695
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 17:23:06 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 12 Dec 2017 17:23:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 12 Dec 2017 17:23:06 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCNN51M005434
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 17:23:06 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Dec 2017 18:22:54 -0500
Message-ID: <1513120974-54884-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] common-csl-ip: Updating to version 3.0.0.9
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
X-List-Received-Date: Tue, 12 Dec 2017 23:23:18 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc       | 8 ++++++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc b/recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
new file mode 100644
index 0000000..c745413
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
@@ -0,0 +1,8 @@
+require recipes-bsp/common-csl-ip/common-csl-ip.inc
+
+PV = "03.03.00.09"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.09"
+CSL_SRCREV = "7a7ef0633d9e305072b79ac978738c48e46583cc"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..71c86e6
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1,5 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..1e42938
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
+
-- 
1.9.1


