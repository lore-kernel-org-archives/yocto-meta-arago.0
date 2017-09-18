Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 240BB52AF5
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:22:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILMCPD018473
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505769733;
	bh=FMJvCHNS9DztcAien7evFgtkxMxOoXFxXNo3AZG3D4U=;
	h=From:To:CC:Subject:Date;
	b=IdOvZh4Y8xyVkkXbWJ0z+u+Ja2ovBw8M7ev2Bhk+PFUX/2TMHuFv7DBQC8VPoThYx
	AuIsQhEd372X2zhs873nnVTuYaUlMQnRkyHGLAj0DQoZYe72qsAePmD5DnteG6qOkq
	FvmzABQEi8cTP0fUfrX+r4pNxSJfNOs4ozheTSl8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILMCHO012863
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:22:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 16:22:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 16:22:12 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILMCUR019822;
	Mon, 18 Sep 2017 16:22:12 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 17:22:11 -0400
Message-ID: <1505769731-12695-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk PATCH] Updating to osal version 1.0.0.8
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
X-List-Received-Date: Mon, 18 Sep 2017 21:22:13 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-1.0.0.8.inc       | 6 ++++++
 recipes-bsp/osal/osal-rtos_git.bbappend | 2 ++
 recipes-bsp/osal/osal-test_git.bbappend | 2 ++
 recipes-bsp/osal/osal_git.bbappend      | 2 ++
 4 files changed, 12 insertions(+)
 create mode 100644 recipes-bsp/osal/osal-1.0.0.8.inc
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 create mode 100644 recipes-bsp/osal/osal_git.bbappend

diff --git a/recipes-bsp/osal/osal-1.0.0.8.inc b/recipes-bsp/osal/osal-1.0.0.8.inc
new file mode 100644
index 0000000..b43e43c
--- /dev/null
+++ b/recipes-bsp/osal/osal-1.0.0.8.inc
@@ -0,0 +1,6 @@
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.08"
+OSAL_SRCREV = "ebd3acdbb4e7d6d0393efedd15ce479c5a79772d"
+
+PV = "01.00.00.08"
+INC_PR = "r0"
+
diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
new file mode 100644
index 0000000..e164619
--- /dev/null
+++ b/recipes-bsp/osal/osal-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.8.inc
+
diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
new file mode 100644
index 0000000..e164619
--- /dev/null
+++ b/recipes-bsp/osal/osal-test_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.8.inc
+
diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
new file mode 100644
index 0000000..e164619
--- /dev/null
+++ b/recipes-bsp/osal/osal_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.8.inc
+
-- 
1.9.1


