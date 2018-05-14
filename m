Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3CF5A52090
	for <meta-arago@arago-project.org>;
	Mon, 14 May 2018 15:59:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4EFxLo6029611
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 10:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526313561;
	bh=72ImHm4f05d78gNuAA87gfoIS7ecys4m69Y4IrLuMnQ=;
	h=From:To:Subject:Date;
	b=BmYM1Od9KKHN3rflwoSYaUHt2qX+ufldNpDgu6v7g5WxS6qNNvMDjM4hxJfjY6oeE
	qYzKnqAu6VOrV4skL+sh5pDIOiuDCbnWc0xqBvWLem0VnybfNlr/A7OvIncflv7tuZ
	GXTzb3g1VT7NZ0dfgg1XxaQx8JJ1lQmtk5S6XyF4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EFxL1w022374
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 10:59:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 14 May 2018 10:59:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 14 May 2018 10:59:20 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EFxK6S017495
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 10:59:20 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 May 2018 11:59:16 -0400
Message-ID: <1526313556-59383-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][meta-processor-sdk][PATCH] ti-tisdk-makefile: add am574x-idk-pps device tree
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
X-List-Received-Date: Mon, 14 May 2018 15:59:27 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index d6a7d3d..27a8b2b 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -67,6 +67,7 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am574x-idk-jailhouse.dtb \
     am571x-idk-pps.dtb \
     am572x-idk-pps.dtb \
+    am574x-idk-pps.dtb \
 "
 
 
-- 
1.9.1


