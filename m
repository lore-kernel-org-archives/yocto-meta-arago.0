Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 925E9529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 16:50:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LGoJwj015773
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521651019;
	bh=iHqpBJlLwVQ+B7ZRe9EwhsEMD5ywRFqWoTw2aSassq4=;
	h=From:To:Subject:Date;
	b=uIq8jN1/sY3uCfCVmF8JMGk92qmD1jRQo9tUvEJFYjQjtBe7gjqVbyHj2zPkc7p4k
	wI3ZyTldjqNLRnqH72eX3DU2qtXpDCUPBHXRd6qPunUIVR7wSdfbekA8+O9u+/mypA
	IIpFWU1KoVSmJb6WjGGRdRRbVxTwg/nvzzEgsyKw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGoJ1v025646
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:50:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 11:50:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 11:50:18 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGoI9J018929
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:50:18 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Mar 2018 12:50:15 -0400
Message-ID: <1521651015-37229-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] osal: SRCREV bump to version 1.0.0.10A
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
X-List-Received-Date: Wed, 21 Mar 2018 16:50:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-01.00.00.10.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/osal/osal-01.00.00.10.inc b/recipes-bsp/osal/osal-01.00.00.10.inc
index 56541ef..1364c7f 100644
--- a/recipes-bsp/osal/osal-01.00.00.10.inc
+++ b/recipes-bsp/osal/osal-01.00.00.10.inc
@@ -1,5 +1,5 @@
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.10"
-OSAL_SRCREV = "91e954dd18b8ee6480b9d655d9c1306aee9e7ac1"
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.10A"
+OSAL_SRCREV = "d26876bd625d14fc71a9dc79c09d03fab22631dd"
 
-PV = "01.00.00.10"
+PV = "01.00.00.10A"
 INC_PR = "r0"
-- 
1.9.1


