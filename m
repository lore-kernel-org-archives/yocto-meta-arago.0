Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5EA9D5298B
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:28:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDRo2C073625
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174870;
	bh=IiPTS90xsc7JBEj+cCIXpBR/5Y7Ai7oW+VVDZ2dn5G8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cgtvP+hUtlMVqUNH7eiDXn/qv9qu9j0J3ZfSSnZAMNVx1tMGCVG1AMDqLSbUv/09E
	g4UXOAIyq52lA9dzuKxqnIh2FS1qHDIH6ph2aJq6oNO8Rx/71gVJqwnyvKRDP+45PZ
	R7WvL7xtEibjstmACLDf8c2/AO+LIBROi6uGhiLw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDRoeT062781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:27:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:27:50 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDRl3P009221
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:50 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 09:27:41 -0400
Message-ID: <1553174865-28991-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 3/7] emac-lld-rtos:Superseeded by a more recent version
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
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
deleted file mode 100644
index f13818b..0000000
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.13D"
-EMAC_LLD_SRCREV = "a0ab5cf14d527b8033f53cb123ebef5b4b106be9"
-
-PV = "01.00.03.13D"
-PR = "r0"
-- 
1.9.1


