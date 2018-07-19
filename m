Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 98C1A52A24
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2018 17:28:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHSqTu023032
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021332;
	bh=xw47wrFJ3nX6U65CK3cE9d105EKUuJ++zhvAT+D6um8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AIkijRSUybEfhUvINKFpMgrCWT5m/B3xyW2aq0k3KZoJ5aJZVR0Jo4vidDsdyl/O9
	0gtPCxL12Lmzm5aQM9t+a4p7CY2OjZkLflZT6O8bR/bY61sa/xcrrcnm2JCDvseUVL
	1Sb/xIisBxG7ER2Mx8PKmSeKfBab06r+IRv2knZM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSq4Z021846
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:28:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:28:52 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSpg7028108
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2018 13:28:47 -0400
Message-ID: <1532021329-48972-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 2/4] pm-lld-rtos: Removing after upstreaming to meta-ti
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
X-List-Received-Date: Thu, 19 Jul 2018 17:29:00 -0000
Content-Type: text/plain

---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
deleted file mode 100644
index 5fd59ef..0000000
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.04"
-PM_LLD_SRCREV = "1c0cae9b001137f68f34bf9168d7c3fa9036b1a6"
-
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05"
-PM_LLD_SRCREV_dra7xx-evm = "945d7ce376c9d9ab748312c48c36994ee7c03dc7"
-PM_LLD_SRCREV_am57xx-evm = "945d7ce376c9d9ab748312c48c36994ee7c03dc7"
-
-PV = "01.04.00.05"
-PR = "r0"
-- 
1.9.1


