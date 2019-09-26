Return-Path: <sam.nelson@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 96FAF52960
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 21:34:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QLWvpR058903
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 16:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569533577;
	bh=entIdO1aoOXizB+qV6vDj0t5dXbfT4Drx2rQMcZnDm8=;
	h=From:To:CC:Subject:Date;
	b=y6hD0SaJBFYhR2oO3QQ2YoUTLG16dYpkzyaaeCcx4SudrmC4AsRg30iJWX1fNF9oX
	2QgkjR2lKiHq9F1pftR6PUuBgfYaWo2U38+b4n8oDwmRX1owgnV7Mqj8R4IlWLdGBJ
	OCC2Q5VJcTGmIHzzzffgCjGrfozyRu7ucp9GcrHc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QLWvsk114300
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 16:32:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 16:32:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 16:32:49 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QLWuwQ099173;
	Thu, 26 Sep 2019 16:32:56 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Sep 2019 17:32:54 -0400
Message-ID: <1569533574-55188-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-tisdk-makefile: Update to fix build issue with arm-oe-linux-gnueabi
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
X-List-Received-Date: Thu, 26 Sep 2019 21:34:07 -0000
Content-Type: text/plain

With arm-oe-linux-gnueabi toolchain, the sysroot path is not picked up
by default.

This fixes problem with building the ipc examples using top level make,
in platforms using arm-oe-linux-gnueabi toolchain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
index 53f9c88..682a791 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
@@ -100,6 +100,7 @@ ti-ipc-linux-examples: ti-ipc-rtos-path-check
 		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
 		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
 		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
+		LINUX_SYSROOT_DIR=$(SDK_PATH_TARGET) \
 		$(IPC_TOOLS_PATHS)
 
 ti-ipc-linux-examples_install: ti-ipc-rtos-path-check ti-ipc-linux-examples
@@ -131,5 +132,6 @@ ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
 		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
 		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
 		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
+		LINUX_SYSROOT_DIR=$(SDK_PATH_TARGET) \
 		$(IPC_TOOLS_PATHS)
 
-- 
1.9.1


