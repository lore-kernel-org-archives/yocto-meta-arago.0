Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C2FFC5298B
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:28:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDRqAX111110
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174872;
	bh=3oPICJe26QwQMz0UimA3GPvjsCjsC4a7aLfRl3/N5ZM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=X76vurIrX9KStexlG57V93+rU2uy9peJCWAOIobnd5KQzUcODjsg65w65k7s+fL8N
	M1q+MgYu6eDJav82AjVIbd7Cl8O5how/hN4DbxVS3yUhlLb9Pv3XNGHVatJsheVAlv
	Tqfu48rgKrcOJJ/5VnRXUjVWFR5mAOhqiDkTCZ9k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDRqaY059411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:27:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:27:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDRl3T009221
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 09:27:45 -0400
Message-ID: <1553174865-28991-8-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 7/7] udma-lld-rtos:Superseeded by a more recent version
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
X-List-Received-Date: Thu, 21 Mar 2019 13:28:07 -0000
Content-Type: text/plain

---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend b/recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend
deleted file mode 100644
index 973040c..0000000
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.01A"
-UDMA_LLD_SRCREV = "e03304e15bb7f1a86c77f1a9984361c822ab2b70"
-
-PV = "01.00.00.01A"
-PR = "r0"
-- 
1.9.1


