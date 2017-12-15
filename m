Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D3140529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 22:52:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFMqih3004754
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 16:52:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513378364;
	bh=VvHL/+jeCyc4DJkT5q7ZMCHlJWn/mvg7+umAp6ZVcHA=;
	h=From:To:Subject:Date;
	b=xervQInITjNzOOg9EevknYwTPMy46YuPaQQK5v0INvIR7zroQ1xCnn86jkGqBKkTE
	kCjPIETx3BAllUetF+0GOlfx9IOF+lwVm9Gq6hbLcmmgRbJ/ZSPaAztsKvcw9AALnG
	q8TuN3vut7NMoIjc1pm63b1HUihhClep6GU1rKDE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFMqdQO028636
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 16:52:39 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 16:52:39 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 16:52:39 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFMqcjH008202
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 16:52:38 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 17:52:37 -0500
Message-ID: <1513378357-443-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] emca-lld-rtos: Update to version 1.0.3.8A
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
X-List-Received-Date: Fri, 15 Dec 2017 22:52:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
index e123b65..fa4a70a 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
@@ -1,7 +1,7 @@
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.08"
-EMAC_LLD_SRCREV = "20b30c9dd37ae1f899e93b560dce41f804e43317"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.08A"
+EMAC_LLD_SRCREV = "20a21b3c25fcfebbc0450e88397a4be135ff703b"
 
-PV = "01.00.03.08"
+PV = "01.00.03.08A"
 PR = "r0"
 
 # Build with make instead of XDC
-- 
1.9.1


