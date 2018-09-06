Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7D1F652985
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 16:50:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86Go9uZ077054
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 11:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536252609;
	bh=cSJdGwanxPBYciFltL6NAvCwT9DDxmSeYDF5owEHV/g=;
	h=From:To:CC:Subject:Date;
	b=W4nPVgdkHUyMSQVdvGD7RyViAHKaYz19ysSTXFXqii1xelzK7WKsdtvLVGTb84AQY
	VgFvE9IqVqW7+oM/T+hp/2MKfcwGIwmNX1yeAdnL0BYjaiWi6AN0Ry7j60qSr2nyDg
	+ziEAkhR7WV+g4A0ZUrvjKyEyh357DPnnqo0xHOY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86Go90n014167
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 11:50:09 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 11:50:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 11:50:09 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86Go8TW030212;
	Thu, 6 Sep 2018 11:50:08 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Sep 2018 12:50:07 -0400
Message-ID: <1536252607-7772-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [apps-tida01555] [PATCH] ARM_User_Space_App: Makefile: remove ARM_CCT and use CC
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
X-List-Received-Date: Thu, 06 Sep 2018 16:50:17 -0000
Content-Type: text/plain

* CC is defined from Processor SDK Linux

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ARM_User_Space_App/Makefile | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/ARM_User_Space_App/Makefile b/ARM_User_Space_App/Makefile
index 1ad4b2e..50ad7a8 100644
--- a/ARM_User_Space_App/Makefile
+++ b/ARM_User_Space_App/Makefile
@@ -1,20 +1,3 @@
-# ARM_CCT environment variable must point to the ARM cross-compile toolchain. E.g.:
-#(Desktop Linux) export ARM_CCT=$(HOME)/ti-processor-sdk-linux-rt-amxxx-evm-ww.xx.yy.zz/
-#linux-devkit/sysroots/x86_64-arago-linux/usr/bin
-
-ifndef ARM_CCT
-define ERROR_BODY
-
-*******************************************************************************
-ARM_CCT environment variable is not set. Examples given:
-(Desktop Linux) export ARM_CCT=$(HOME)/ti-processor-sdk-linux-rt-amxxx-evm-ww.xx.yy.zz/
-linux-devkit/sysroots/x86_64-arago-linux/usr/bin
-*******************************************************************************
-
-endef
-$(error $(ERROR_BODY))
-endif
-
 MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
 CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
 PROJ_NAME=$(CURRENT_DIR)
@@ -47,7 +30,7 @@ $(TARGET):
 	@echo ''
 	@echo 'Building target: $@'
 	@echo 'Invoking: ARM x86 Cross Compiler'
-	$(ARM_CCT)/arm-linux-gnueabihf-gcc -Wall $(SOURCES) $(CFLAGS) -o $(TARGET) -lncurses -lpthread
+	$(CC) -Wall $(SOURCES) $(CFLAGS) -o $(TARGET) -lncurses -lpthread
 	@echo 'Finished building target: $@'
 
 .PHONY: all clean
-- 
1.9.1


