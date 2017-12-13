Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 21E6252093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 14:13:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDED84Z013946
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 08:13:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513174388;
	bh=j+2sYunq5irisv5sdjHHikexmHI9X75XFIT10uq9juU=;
	h=From:To:Subject:Date;
	b=DiTbkLezvD5flEPU8hqVJ4k4Uq2k9ZwYqArk/iRWh3pTncEqaTivma1JknyvA7pHk
	L+0TCCDtSMLzT9z74kwB4YEAnC33I17dK99UTv3HynCYjHSRA2ozOdte35RF/an3bo
	NO7xiDqSTWliWifUyrHxeWtr5/0LVhA7fkXsy20s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDED8sF015982
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 08:13:08 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 08:13:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 08:13:07 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDED7U9026085
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 08:13:08 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 09:13:03 -0500
Message-ID: <1513174383-46001-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] osal: Update to version 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 14:13:09 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

---
 recipes-bsp/osal/osal-1.0.0.9.inc       | 8 ++++++++
 recipes-bsp/osal/osal-rtos_git.bbappend | 2 ++
 recipes-bsp/osal/osal-test_git.bbappend | 2 ++
 recipes-bsp/osal/osal_git.bbappend      | 2 ++
 4 files changed, 14 insertions(+)
 create mode 100644 recipes-bsp/osal/osal-1.0.0.9.inc
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 create mode 100644 recipes-bsp/osal/osal_git.bbappend

diff --git a/recipes-bsp/osal/osal-1.0.0.9.inc b/recipes-bsp/osal/osal-1.0.0.9.inc
new file mode 100644
index 0000000..e05ac24
--- /dev/null
+++ b/recipes-bsp/osal/osal-1.0.0.9.inc
@@ -0,0 +1,8 @@
+require recipes-bsp/osal/osal.inc
+
+PV = "01.00.00.09"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.09"
+OSAL_SRCREV = "0bb1151f3622fb65f41f1d3dcffcee63fe9724de"
+
diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
new file mode 100644
index 0000000..dadb121
--- /dev/null
+++ b/recipes-bsp/osal/osal-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.9.inc
+
diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
new file mode 100644
index 0000000..dadb121
--- /dev/null
+++ b/recipes-bsp/osal/osal-test_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.9.inc
+
diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
new file mode 100644
index 0000000..dadb121
--- /dev/null
+++ b/recipes-bsp/osal/osal_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/osal/osal-1.0.0.9.inc
+
-- 
1.9.1


