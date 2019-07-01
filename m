Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2EA8F52972
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2019 17:15:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61HEVN6113383
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 12:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562001271;
	bh=kDiUNSCnNwOzWOuvi93Dz5eAp3zfs1JNa2b+v3b65hU=;
	h=From:To:CC:Subject:Date;
	b=Pgi883GKVG2rLqPRQ50mcbzSFzntBbmAlPeV3DN/dirAbBwuXouPuECF+oWghmZ6l
	3xPnGkvscBuLMLnj2zzOkJrsw4Yk4a6aSYQ+DzHzOsKRqM25ZUg0z0GUkENrSNL/fB
	eA/y97oGZ3T68AfCpxViet0f64VXEI2COvARzYDY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61HEVDU123480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 12:14:31 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 12:14:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 1 Jul 2019 12:14:31 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61HEVfK086998;
	Mon, 1 Jul 2019 12:14:31 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jul 2019 08:10:36 -0400
Message-ID: <20190701121036.7462-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] glow: Remove glow from the devkit, demo-glow from the filesystem and top level makefile
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
X-List-Received-Date: Mon, 01 Jul 2019 17:15:17 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
Image-classifier model-to-object file conversion tool is still 
dependent on some host libraries (instead on devkit libraries only).
So, both demo-glow and glow are temporarily removed.


 .../nativesdk-packagegroup-arago-tisdk-host.bbappend  |  3 ---
 .../packagegroup-arago-tisdk-addons-sdk-host.bbappend | 11 -----------
 ...ackagegroup-arago-tisdk-addons-sdk-target.bbappend |  6 ------
 .../packagegroup-arago-tisdk-addons.bbappend          |  6 ------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend  |  4 ----
 5 files changed, 30 deletions(-)
 delete mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
deleted file mode 100644
index 409740b..0000000
--- a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = ".tisdk0"
-
-EXTRA_TI_TOOLS_append = " nativesdk-glow "
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index 6349bcd..a8a0b2e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -18,14 +18,3 @@ EXTRA_LIBS_append_dra7xx = " \
 
 UTILS_append_am335x-evm = " pru-adc-src"
 
-EXTRA_PACKAGES_append_omap-a15 = " \
-    demo-glow-src \
-"
-
-EXTRA_PACKAGES_append_ti43x = " \
-    demo-glow-src \
-"
-    
-EXTRA_PACKAGES_append_ti33x = " \
-    demo-glow-src \
-"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 6d8a49e..08f20e4 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -77,9 +77,3 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-sys-iface \
 "
 
-EXTRA_PACKAGES_append_ti33x = " demo-glow-dev "
-
-EXTRA_PACKAGES_append_ti43x = " demo-glow-dev "
-
-EXTRA_PACKAGES_append_omap-a15 = " demo-glow-dev "
-
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index a5c115e..b6cb1e9 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -29,9 +29,3 @@ EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples kaldi ti
 
 EXTRA_PACKAGES_append_k2hk = " ti-fftw-examples"
 
-EXTRA_PACKAGES_append_ti33x = " demo-glow "
-
-EXTRA_PACKAGES_append_ti43x = " demo-glow "
-
-EXTRA_PACKAGES_append_omap-a15 = " demo-glow "
-
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 249cc03..2900fb7 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -11,7 +11,6 @@ SRC_URI_append = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_tidl-examples \
     file://Makefile_pru-adc \
-    file://Makefile_demo-glow \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -40,16 +39,13 @@ MAKEFILES_remove_omapl138 = "pru"
 MAKEFILES_remove_omapl138 = "u-boot-legacy"
 
 MAKEFILES_append_omap-a15 = " video-graphics-test \
-                              demo-glow \
 "
 
 MAKEFILES_append_ti43x = " evse-hmi \
-                           demo-glow \
 "
 
 MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
-                           demo-glow \
 "
 
 MAKEFILES_append_k3 = " evse-hmi"
-- 
2.17.1


