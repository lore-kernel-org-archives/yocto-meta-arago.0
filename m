Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 7E79152986
	for <meta-arago@arago-project.org>;
	Fri, 23 Feb 2018 16:14:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1NGDscL031729
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 10:13:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519402434;
	bh=Uc/GijJAbo2UWBOjm6p8KrUUj8rWGlC4SqBJ4wY8RHI=;
	h=From:To:CC:Subject:Date;
	b=K1HDqU3W2vXYINsY/5nvtz8ipd+rtx1sQ0FNeuX+11yFFzb8w+yKj3PFtCcSiUpNP
	ahNxi4BGSmwYL4tmD+wfyDGGDvSHsY6WAXHW0Pe8GzuDzHGO90F5tzLSCDYhBLbgea
	B5hZrUQgNLOygfKVw0MR3oE82yzGRBFpGNkq/7uY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NGDseE026655
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 10:13:54 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 10:13:53 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 23 Feb 2018 10:13:54 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NGDr4i005985;
	Fri, 23 Feb 2018 10:13:53 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Feb 2018 11:13:51 -0500
Message-ID: <1519402431-3322-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] dual-camera-demo: bump SRCREV
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
X-List-Received-Date: Fri, 23 Feb 2018 16:14:22 -0000
Content-Type: text/plain

Support run-time selection of cmem vs. omapdrm memory

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bbappend

diff --git a/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bbappend b/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bbappend
new file mode 100644
index 0000000..0a0f7ad
--- /dev/null
+++ b/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+SRCREV = "3546c21b17fa5f54b6ac6259b56e9a6f23b4e8b1"
-- 
1.9.1


