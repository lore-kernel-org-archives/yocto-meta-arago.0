Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id CD5FB52991
	for <meta-arago@arago-project.org>;
	Thu, 20 Dec 2018 20:58:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBKKvnjr038189
	for <meta-arago@arago-project.org>; Thu, 20 Dec 2018 14:57:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545339469;
	bh=02iD7uQ32FA64L+GifSIZC5fdL0zIt7/sucH2hVvdaI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=v9FucNQk0W8Z/LMf6ubUl6A+6JmlGV11nzzbnTXTT7dF4T1Y0ZKrE+OU4IpsyK/RG
	7SJLa/elhFFka/5XMUHAypdI2Q6YaS788VIuedS9ASuiNOXWjCRAAI9jKjWx4ZV4MG
	tXsbxJ2+NMP6Z9G7hsM56PEFq39j5vkk4osq9nes=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBKKvnS4099991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Dec 2018 14:57:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 20 Dec 2018 14:57:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 20 Dec 2018 14:57:49 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBKKvk6l010288
	for <meta-arago@arago-project.org>; Thu, 20 Dec 2018 14:57:48 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Dec 2018 15:57:44 -0500
Message-ID: <1545339464-27102-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545339464-27102-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545339464-27102-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] emac-lld-rtos: SRCREV update to 01.00.03.13D
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
X-List-Received-Date: Thu, 20 Dec 2018 20:58:01 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
index d0b20f0..f13818b 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
@@ -1,5 +1,5 @@
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.13C"
-EMAC_LLD_SRCREV = "e37ab39f3fa7ed7c9266e220e584c1097c32fcff"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.13D"
+EMAC_LLD_SRCREV = "a0ab5cf14d527b8033f53cb123ebef5b4b106be9"
 
-PV = "01.00.03.13C"
+PV = "01.00.03.13D"
 PR = "r0"
-- 
1.9.1


