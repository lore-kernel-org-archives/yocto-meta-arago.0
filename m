Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3A62252093
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 21:27:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBELRO5N029420
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:27:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513286844;
	bh=hK7Swhzx/cbrC/x3JD+WG/fa98PmSvERvhG4af9OIQc=;
	h=From:To:Subject:Date;
	b=B1ct2QxK6YuNNsKMpGgnsfrYHcNlNmIgztO4pz9+XGItYIStW31hdFjOPezlrPXkv
	a4yCM1y/XRs5y63Rt3ruEomAIb0axFS0+niIxSFi1solcQxfPwWvwkElBNHTZliZ/M
	L5vn24Wet0kfJFxlIQo4pd/f41npswg1nboOzAOE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBELROmP027689
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:27:24 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 14 Dec 2017 15:27:23 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 14 Dec 2017 15:27:23 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBELRNAY019884
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:27:23 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 16:27:22 -0500
Message-ID: <1513286842-50485-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] pa-lld: Update to version 3.0.2.5
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
X-List-Received-Date: Thu, 14 Dec 2017 21:27:26 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc       | 5 +++++
 recipes-bsp/pa-lld/pa-lld-rtos_git.bbappend | 1 +
 recipes-bsp/pa-lld/pa-lld-test_git.bbappend | 2 ++
 recipes-bsp/pa-lld/pa-lld_git.bbappend      | 2 ++
 4 files changed, 10 insertions(+)
 create mode 100644 recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc
 create mode 100644 recipes-bsp/pa-lld/pa-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/pa-lld/pa-lld-test_git.bbappend
 create mode 100644 recipes-bsp/pa-lld/pa-lld_git.bbappend

diff --git a/recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc b/recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc
new file mode 100644
index 0000000..a71a6ac
--- /dev/null
+++ b/recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.PA_LLD.03.00.02.05"
+PA_LLD_SRCREV = "5f24617e71670f17ee9adf71d5b30dc8ff9e5ca3"
+
+PV = "03.00.02.05"
+INC_PR = "r0"
diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bbappend b/recipes-bsp/pa-lld/pa-lld-rtos_git.bbappend
new file mode 100644
index 0000000..066e960
--- /dev/null
+++ b/recipes-bsp/pa-lld/pa-lld-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bbappend b/recipes-bsp/pa-lld/pa-lld-test_git.bbappend
new file mode 100644
index 0000000..44ebba8
--- /dev/null
+++ b/recipes-bsp/pa-lld/pa-lld-test_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc
+
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bbappend b/recipes-bsp/pa-lld/pa-lld_git.bbappend
new file mode 100644
index 0000000..44ebba8
--- /dev/null
+++ b/recipes-bsp/pa-lld/pa-lld_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/pa-lld/pa-lld-3.0.2.5.inc
+
-- 
1.9.1


