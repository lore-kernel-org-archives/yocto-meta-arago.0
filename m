Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 879AA52975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 15:50:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26FngU0023465
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 09:49:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520351382;
	bh=DzE6MzYanjrRaQLDQloiUVaNmK43T0fjHzptwhVLq8s=;
	h=From:To:CC:Subject:Date;
	b=Tp5f6050j6hj8ABk+V5imgRbxPhH8/Ajs8BTB1Ew6LHaX1mHnu0Mz8iGqeDczEn3O
	RSoFvQI8hD/JykcwNW0gxTugpIGHTveD6zqxe8t2vtH4ZZMUWPIQ39Y6Yr6k0hsHCO
	rLnBRBw2rR3dVhNZ7YAWqods1pns3eu/xJ0kXKW8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26FngaZ027490
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 09:49:42 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 09:49:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 09:49:42 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26FnfOj020962;
	Tue, 6 Mar 2018 09:49:41 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Mar 2018 10:49:40 -0500
Message-ID: <1520351380-37366-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty/master][PATCH] ti-ipc-rtos: Fix parallel build issue
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
X-List-Received-Date: Tue, 06 Mar 2018 15:50:25 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
index 8274dd5..d31773d 100644
--- a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
@@ -1,7 +1,7 @@
-# Corresponds to tag: 3.47.01.00A
-SRCREV_ipc-examples = "7f23e9b0ae395461b0854881dcc174392355d854"
+# Corresponds to tag: 3.47.01.00B
+SRCREV_ipc-examples = "03ff856444b5bb9e60a907125a1f042b29b25d7b"
 
 # Corresponds to tag: 3.47.01.00A
 SRCREV_ipc-metadata = "72578cce9c9f9a932eb22b3397b46131efb12d69"
 
-PR = "${INC_PR}.r4"
+PR = "${INC_PR}.r5"
-- 
1.9.1


