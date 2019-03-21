Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F169A52976
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:28:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDRosg111097
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174870;
	bh=QHY8XomXlfwCtre0zELFev1Z71CGQNS/CKogEJ0rYTo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GmhZKpe2ryxHXmQkZuGrf0024vEDzhC8B6QefYPUcUFrDanQMSILLWvx6oCzGfk+w
	7SXfI/F2lrKXtXE8l1s5HxiobbDAlvFtpEIMXfc//wUbaKxGoGA63p5gSzd/7Q/NZt
	681Q1LgSL7RwKMUKjJITF85lSu3rLOPo32kemItE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDRo0q076752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:27:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:27:50 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDRl3O009221
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:49 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 09:27:40 -0400
Message-ID: <1553174865-28991-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 2/7] common-csl-ip:Superseded by a higher version
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
X-List-Received-Date: Thu, 21 Mar 2019 13:28:03 -0000
Content-Type: text/plain

---
 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc  | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 -
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc
deleted file mode 100644
index 8cba4c5..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-PV = "03.03.00.13A"
-INC_PR = "r0"
-
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.13A"
-CSL_SRCREV = "6c52da764788e8611d763391f63616e085dae049"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
deleted file mode 100644
index e0fa4ae..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require common-csl-ip-03_03_00_13A.inc
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
deleted file mode 100644
index e0fa4ae..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require common-csl-ip-03_03_00_13A.inc
-- 
1.9.1


