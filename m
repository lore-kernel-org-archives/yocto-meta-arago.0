Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7BDA6520C0
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 20:48:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GKluw0123368
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 15:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563310076;
	bh=fc5vUXL+DwKGuA0nljdf04GWv0qrFKPOP/uJUWtQBJU=;
	h=From:To:CC:Subject:Date;
	b=yOP5ANbwBeQCYOAizxmEbinytlq5v0y61YY1RDYhLVd9mF9y3AuTPV28E2MCnGMpt
	n1BmcGdCwN/rrJvBC8Y+5CxzqRapFiaA9mWNp2aDdv3TOUy3JMl1wby4cjy833pI+R
	8vSox9EcCPO9elug6Q/z5vwhFzWWR6RH+fMPmuPY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GKluXF025342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 15:47:56 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 15:47:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 15:47:55 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GKltig038870;
	Tue, 16 Jul 2019 15:47:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jul 2019 20:34:51 +0000
Message-ID: <20190716203451.28246-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-sci-fw: update imggen commit with MSMC cache size change
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
X-List-Received-Date: Tue, 16 Jul 2019 20:48:45 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
index 99dc5b9b..09784bd6 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
@@ -16,7 +16,7 @@ export TI_SECURE_DEV_PKG
 
 SRCREV = "ca194f3c597b3ebba9ceb032f13f1a4e7ffa5653"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "9fb15bf62e95787cd6505ca4ac9f982ea6de0623"
+SRCREV_imggen = "ef6f0b61dbd32ddbef62fbe7a7e70241221a0461"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1


