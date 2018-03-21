Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4A054529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 16:50:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LGoqNC021591
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521651052;
	bh=mcvuZsHDGwqxZ7hejaawgKMaPbyKneLDzgLhWhi8Hz0=;
	h=From:To:Subject:Date;
	b=t8Pny98C9Mc3/En6rhZxt38ze9RPWDrHPn60r5xlMu577pVC0EE27uLxen5TyeAf7
	0Ongtg2zvsfrfeRwRGXmmMaP/eVxibVbrxE5QlpMp2qFHhiavgYgSF6dI4keWMfCbv
	RDtRUSN9rhlNEmtLd7xA+9eYs+5IO3LKZ7+gWlpE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGopsC026209
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:50:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 11:50:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 11:50:51 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGopJW019384
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:50:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Mar 2018 12:50:50 -0400
Message-ID: <1521651050-37890-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] transport-rtos SRCREV bump to 01.00.00.11A
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
X-List-Received-Date: Wed, 21 Mar 2018 16:50:52 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/transport-01.00.00.11.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/transport-rtos/transport-01.00.00.11.inc b/recipes-bsp/transport-rtos/transport-01.00.00.11.inc
index 512a815..8e966a9 100644
--- a/recipes-bsp/transport-rtos/transport-01.00.00.11.inc
+++ b/recipes-bsp/transport-rtos/transport-01.00.00.11.inc
@@ -1,5 +1,5 @@
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.11"
-TRANSPORT_SRCREV = "7bd5f7ffb38a6021762f29d0652fe63c6114a86f"
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.11A"
+TRANSPORT_SRCREV = "472efde60b5ede35c0746c432001d8e3673a6bb9"
 
-PV = "01.00.00.11"
+PV = "01.00.00.11A"
 INC_PR = "r0"
-- 
1.9.1


