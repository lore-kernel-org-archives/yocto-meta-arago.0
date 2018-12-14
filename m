Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C015B52A0B
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 19:35:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJZPM0126484
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 13:35:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544816125;
	bh=XWfD+eKnlfcVPT+SvWzLSN1i2YOsJJM/UMDvIN1FE3k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iPZ+OoqGcyRsxTrPuhQThK/o4zXhE8TBIidZpDHdU94FbbhnMIRyPyNhjUX+I11RL
	sHWCzOTH27yteEBD49cw/RgmPMMslNQO2+tDmdpljb5D3pm9g5cpDWYutQkHj0T0iJ
	ssJ2eenqSMISPKCld0gIMnhLNOgs33XfcrtQ8zok=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJZPd0023523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 13:35:25 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:35:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:35:25 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJZONu014701
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 13:35:24 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 14:35:22 -0500
Message-ID: <1544816122-11310-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544816122-11310-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544816122-11310-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] common-csl-ip: Superseeded after update to 03.03.00.13
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
X-List-Received-Date: Fri, 14 Dec 2018 19:35:37 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc  | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 -
 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend      | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
deleted file mode 100644
index 24bfd8a..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-PV = "03.03.00.12A"
-INC_PR = "r0"
-
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.12A"
-CSL_SRCREV = "852cfe681c766a2096007fee37358c0782194897"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
deleted file mode 100644
index f71f851..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require common-csl-ip-03_03_00_12A.inc
diff --git a/recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend
deleted file mode 100644
index f71f851..0000000
--- a/recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require common-csl-ip-03_03_00_12A.inc
-- 
1.9.1


