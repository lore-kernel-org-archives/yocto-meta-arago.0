Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0417052A5D
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 22:21:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIML34U038522
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545171663;
	bh=5kaExbLkRAwneb6Y67dAccTN0CGumKutfQmW7uLkAfo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QVlgBPH5fQ/xbSP08GEUMyMl/gi9HmxkcEnGlqKjA3UUCVRE2PlymZfdG0ZBPjamt
	8pY8Siav8IjwBiPKPCTY/SxiHUBLablmvQac0YG6e2Lg71irDy8ot1w4KgA+PP/wWC
	3+5xRjFwTpp+VOkAV2LKE8Akm2qhK4hjuf3hdryI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIML27U057116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:02 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:21:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:21:02 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIML1RB018057
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:02 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 17:20:55 -0500
Message-ID: <1545171658-17410-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 3/6] osal: SRCREV update to 01.00.00.13A
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
X-List-Received-Date: Tue, 18 Dec 2018 22:21:16 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-01_00_00_13A.inc  | 6 ++++++
 recipes-bsp/osal/osal-rtos_git.bbappend | 1 +
 recipes-bsp/osal/osal-test_git.bbappend | 1 +
 recipes-bsp/osal/osal_git.bbappend      | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 recipes-bsp/osal/osal-01_00_00_13A.inc
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 create mode 100644 recipes-bsp/osal/osal_git.bbappend

diff --git a/recipes-bsp/osal/osal-01_00_00_13A.inc b/recipes-bsp/osal/osal-01_00_00_13A.inc
new file mode 100644
index 0000000..420efdd
--- /dev/null
+++ b/recipes-bsp/osal/osal-01_00_00_13A.inc
@@ -0,0 +1,6 @@
+PV = "01.00.00.13A"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.13A"
+OSAL_SRCREV = "0615fea1ac9a2639445362f2da628802011a8824"
+
diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
new file mode 100644
index 0000000..3c21f6d
--- /dev/null
+++ b/recipes-bsp/osal/osal-rtos_git.bbappend
@@ -0,0 +1 @@
+require osal-01_00_00_13A.inc
diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
new file mode 100644
index 0000000..3c21f6d
--- /dev/null
+++ b/recipes-bsp/osal/osal-test_git.bbappend
@@ -0,0 +1 @@
+require osal-01_00_00_13A.inc
diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
new file mode 100644
index 0000000..3c21f6d
--- /dev/null
+++ b/recipes-bsp/osal/osal_git.bbappend
@@ -0,0 +1 @@
+require osal-01_00_00_13A.inc
-- 
1.9.1


