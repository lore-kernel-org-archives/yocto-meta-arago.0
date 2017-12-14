Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 29CB152990
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 20:34:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEKYcZZ014384
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 14:34:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513283678;
	bh=s7mexnQa2psiwit3UhDz10TjNTbEM0shmNzlJHC7heU=;
	h=From:To:Subject:Date;
	b=M/qkmkop+hFd/4WyaUSMnFEBbqE/jWnHzJMjvpecvTj3jzsbp183Bs2uBOJ40bzMs
	LN8G5dCH1kSJAmyDEfjKF/IXltyq/Vd95I4vbE+F/inkfqeyTJR7YQiNp/MZndDUhY
	ElSVSH2bVIc8DvXeocVOAK9FdRTTSLeEmUF/UNJ8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEKYc09021721
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 14:34:38 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 14:34:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 14:34:38 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEKYbSS020357
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 14:34:38 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 15:34:37 -0500
Message-ID: <1513283677-46194-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] sa-lld: Updating to version 3.0.0.19
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
X-List-Received-Date: Thu, 14 Dec 2017 20:34:40 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc      | 5 +++++
 recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend | 1 +
 recipes-bsp/sa-lld/sa-lld-test_git.bbappend | 1 +
 recipes-bsp/sa-lld/sa-lld_git.bbappend      | 1 +
 4 files changed, 8 insertions(+)
 create mode 100644 recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc
 create mode 100644 recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/sa-lld/sa-lld-test_git.bbappend
 create mode 100644 recipes-bsp/sa-lld/sa-lld_git.bbappend

diff --git a/recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc b/recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc
new file mode 100644
index 0000000..2520a07
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.SA_LLD.03.00.00.19"
+SA_LLD_SRCREV = "885e40c384b8986fe93928fcff84c6f0db5ea843"
+
+PV = "03.00.00.19"
+INC_PR = "r0"
diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend b/recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend
new file mode 100644
index 0000000..71dca5c
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bbappend b/recipes-bsp/sa-lld/sa-lld-test_git.bbappend
new file mode 100644
index 0000000..71dca5c
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bbappend b/recipes-bsp/sa-lld/sa-lld_git.bbappend
new file mode 100644
index 0000000..71dca5c
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/sa-lld/sa-lld-3.0.0.19.inc
-- 
1.9.1


