Return-Path: <a0389345@dta0389345ub>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1B23F52A85
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 23:29:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UNQe7K011787
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 18:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593559600;
	bh=JkUcGDTUcTqtj5k1SAIlUBmfxEvORGjzS5/6HHQxKUc=;
	h=From:To:CC:Subject:Date;
	b=Xfb27nW7M1WMNjMQQDejoqbfbXky93d5TVgi1KBXPmgEI+AuqRx3JtHig6L8AGtRP
	2xymWd4H3MK2Za8n04vTPuwYEZMwArFrioioR68QDDD5GSIVXKrya3Y3FJYqfI4KRr
	XaGQfuiVgyKf7mYhxyKEOlGA65yYzIwJ/m9tVOFA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05UNQe4H115687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 18:26:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 18:26:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 18:26:39 -0500
Received: from dta0389345ub (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UNQdaX111387;
	Tue, 30 Jun 2020 18:26:39 -0500
Received: from a0389345 by dta0389345ub with local (Exim 4.90_1)
	(envelope-from <a0389345@dta0389345ub>)
	id 1jqPeB-0007Cr-JN; Tue, 30 Jun 2020 18:26:39 -0500
From: <prao@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 30 Jun 2020 18:26:31 -0500
Message-ID: <20200630232631.27654-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Praveen Rao <prao@ti.com>
Subject: .master/dunfell] recipes-tisdk: ti-tisdk-makefile: Fix Makefile for sysfw-image
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
X-List-Received-Date: Tue, 30 Jun 2020 23:29:19 -0000
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

The sysfw-image name changed from system-firmware-image to k3-image.
Fix the Makefile to reflect this update.

Signed-off-by: Praveen Rao <prao@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index ab7ff727..a6e6f866 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -32,14 +32,14 @@ sysfw-image: linux-dtbs
 	@echo =============================
 	@echo    Building SYSFW Image
 	@echo =============================
-	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; \
+	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; \
 		make $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
 
 sysfw-image_clean:
 	@echo =============================
 	@echo    Cleaning SYSFW Image
 	@echo =============================
-	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; make clean
+	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; make clean
 
 sysfw-image_install:
 	@echo =============================
-- 
2.17.1


