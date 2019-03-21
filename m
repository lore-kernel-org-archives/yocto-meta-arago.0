Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 070F9529DA
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:28:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDRpSW073638
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174871;
	bh=P62P8Z9buqrbdtwKhkz5xk74GJCUMIk5ulg6TswjM4k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nqFQLHTMs6H9lopDNQOuwGeo9NMv/7RNZth+QPk03jR8K7nM3DzqF1OhzqXCqc1mg
	mmxhIJwvYxIP+WhSbUiYaJdgcTlLoWr8rJxSX4rmKhpk6LsA2f/PhsEX/OGDI6LFgj
	0UvCRBrYVVc5b8F7bCtHiNXkA7PtMmAQtnEacC2g=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDRpW6062801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:27:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:27:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDRl3R009221
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:50 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 09:27:43 -0400
Message-ID: <1553174865-28991-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 5/7] osal:Superseeded by a more recent version
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
X-List-Received-Date: Thu, 21 Mar 2019 13:28:06 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-01_00_00_13A.inc  | 6 ------
 recipes-bsp/osal/osal-rtos_git.bbappend | 1 -
 recipes-bsp/osal/osal-test_git.bbappend | 1 -
 recipes-bsp/osal/osal_git.bbappend      | 1 -
 4 files changed, 9 deletions(-)
 delete mode 100644 recipes-bsp/osal/osal-01_00_00_13A.inc
 delete mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal_git.bbappend

diff --git a/recipes-bsp/osal/osal-01_00_00_13A.inc b/recipes-bsp/osal/osal-01_00_00_13A.inc
deleted file mode 100644
index 420efdd..0000000
--- a/recipes-bsp/osal/osal-01_00_00_13A.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-PV = "01.00.00.13A"
-INC_PR = "r0"
-
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.13A"
-OSAL_SRCREV = "0615fea1ac9a2639445362f2da628802011a8824"
-
diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
deleted file mode 100644
index 3c21f6d..0000000
--- a/recipes-bsp/osal/osal-rtos_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require osal-01_00_00_13A.inc
diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-bsp/osal/osal-test_git.bbappend
deleted file mode 100644
index 3c21f6d..0000000
--- a/recipes-bsp/osal/osal-test_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require osal-01_00_00_13A.inc
diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-bsp/osal/osal_git.bbappend
deleted file mode 100644
index 3c21f6d..0000000
--- a/recipes-bsp/osal/osal_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require osal-01_00_00_13A.inc
-- 
1.9.1


