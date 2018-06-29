Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6BA0F529B2
	for <meta-arago@arago-project.org>;
	Fri, 29 Jun 2018 21:15:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5TLFj9i040759
	for <meta-arago@arago-project.org>; Fri, 29 Jun 2018 16:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530306945;
	bh=HE8iC5YYljLtZnDyrGXF+W1hE0R5ed9d6NP4iwqN18M=;
	h=From:To:CC:Subject:Date;
	b=fHwY5BVtCxdX1PTUFUqCG17h/IGLCV5NPaZsF8rWfIcDgXlQsOY75BHIDuXlP0GQx
	IMj55K/bOCgFZ71uGjzMs9Gh6MHFw4anxzz6GGZumFgLf6ucLDufZOPQ8g28Ky80Uo
	9OFPI01ynQD+5ITTKFCQNfUlCmueE6iDR3EypNWo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5TLFjau002541
	for <meta-arago@arago-project.org>; Fri, 29 Jun 2018 16:15:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 29 Jun 2018 16:15:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 29 Jun 2018 16:15:44 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5TLFimi001046;
	Fri, 29 Jun 2018 16:15:44 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jun 2018 17:15:41 -0400
Message-ID: <1530306941-18150-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [patch] matrix-gui-multimedia-demos: bump SRCREV
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
X-List-Received-Date: Fri, 29 Jun 2018 21:15:51 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
index 29c3b31..4ac2509 100644
--- a/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
@@ -1,6 +1,6 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
-SRCREV = "71c1049e7a73cc731766aa72fc7197a45003625d"
+SRCREV = "65fee8957447ae4e403ad324acf735d811b2c412"
 
 PACKAGES_append = " matrix-multimedia-demo-video-graphics"
 
-- 
1.9.1


