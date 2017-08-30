Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EE6FC529CB
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 18:41:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UIf5bh005277
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 13:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504118465;
	bh=Rso4P582T9jmi+PFMxUH7+Ju5oBQ7JIRWPJfc2sO2ck=;
	h=From:To:CC:Subject:Date;
	b=q9eNDUmsPpPRLCZTNRET8E9/3Qeoe0i+xV67a0fBYU23rIXgTtuHllSxO5xhQjYWk
	aGKlJChGqI4U5tMeYlZ528tRN31O4tIHsJymqZd8MuA8wGxdQa0IMETOqLbgZDEunP
	lAQqUcDpn3S50hISq3xZNU3kD7vS/SU4isTli6Ds=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UIf03s024938
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 13:41:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 13:41:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 13:41:00 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UIf01v022109;
	Wed, 30 Aug 2017 13:41:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Aug 2017 14:34:54 -0400
Message-ID: <1504118094-3974-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-tisdk-makefile: update omapl138 targets
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
X-List-Received-Date: Wed, 30 Aug 2017 18:41:16 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 7db995c..85110a3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r82"
+PR = "r83"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -58,6 +58,7 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 "
 
 MAKEFILES_MATRIX_GUI_keystone = ""
+MAKEFILES_MATRIX_GUI_omapl138 = ""
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -125,8 +126,8 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               barcode-roi \
                               uio-module-drv \
 "
-MAKEFILES_append_omapl138 = " pru \
-                              u-boot-legacy \
+MAKEFILES_append_omapl138 = " linux-dtbs \
+                              u-boot-spl \
 "
 
 MAKEFILES_append_keystone = " u-boot-spl \
-- 
2.7.4


