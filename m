Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1D72B5209B
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 16:50:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDGoSJR029540
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:50:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513183828;
	bh=3ObvMJV8DXRN89GOGk8kLb3ypW034F1zpGDR7fUUllk=;
	h=From:To:Subject:Date;
	b=OQSFXDLE6yl87iYimoCznWKCLUlvnrZti31+YggPeN9sekS9zYbsLg/9AS9gyIoym
	YIw0HxYKXpHjcYW/hrSH+aSMGCnlIne9i9nA584aIHbnojQGpcYkuFSh9jQQFvIMGW
	oYBCVy7vPw0KCDifSPiyexQYUDQR/J2sYXUNhevE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDGoNmr019144
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:50:23 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 10:50:23 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 10:50:23 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDGoMJB031939
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:50:23 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 11:50:20 -0500
Message-ID: <1513183820-64308-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] common-csl-ip: Updating to version 3.3.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 16:50:39 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Renamed inc to correct version, remove reference to common-csl-ip.inc
 v1 - Initial version

 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc       | 6 ++++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc b/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
new file mode 100644
index 0000000..e87cf57
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
@@ -0,0 +1,6 @@
+PV = "03.03.00.09"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.09"
+CSL_SRCREV = "7a7ef0633d9e305072b79ac978738c48e46583cc"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..43e3564
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1,5 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..ae2ca3e
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
+
-- 
1.9.1


