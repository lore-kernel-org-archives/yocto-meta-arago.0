Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id EFAAE52986
	for <meta-arago@arago-project.org>;
	Wed, 27 Nov 2019 22:49:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARMluGS050550
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2019 16:47:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574894876;
	bh=pqQVebZlooJBugGVM1LJ6rC29ikTCuXgKZlSeQ/QaQY=;
	h=From:To:Subject:Date;
	b=eNnhTeqideUiZKugSasH45Nhkh1bKHuHeyYvtaERox+n1SZWmhH8EDrxonBkDHROF
	+R16EZdDud+OcWvXPuLtbAyxz1zhcRrz3wJA4vfGeoo6uKsKBjc1J357b3vxb12J7H
	ce7PpkfgLAHXRFN8OWvwECYuFl3sdKL2BV/8MynY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xARMltfX013411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2019 16:47:56 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 27 Nov 2019 16:47:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 27 Nov 2019 16:47:55 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARMltHQ058284
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2019 16:47:55 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Nov 2019 17:47:22 -0500
Message-ID: <20191127224723.63994-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/mastr][PATCH 1/2] Revert "omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL"
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
X-List-Received-Date: Wed, 27 Nov 2019 22:49:26 -0000
Content-Type: text/plain

This reverts commit 76bfc363e14d70d0a04404ab9ab8d9bd18841c5c.
The required patch has been upstreamed.
---
 ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 -------------------
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
deleted file mode 100644
index 4774425f..00000000
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 06b21346d662209f5ea9816f408f9f883b775d60 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Mon, 28 Oct 2019 09:43:47 -0400
-Subject: [PATCH] util: Makefile.am: update LDFLAGS for Mesa-based EGL
-
-- replace pvr_wlegl with wayland-egl
-
-Upstream-Status: Pending
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- util/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
- mode change 100644 => 100755 util/Makefile.am
-
-diff --git a/util/Makefile.am b/util/Makefile.am
-old mode 100644
-new mode 100755
-index 2bfcb5e..fdeb877
---- a/util/Makefile.am
-+++ b/util/Makefile.am
-@@ -37,7 +37,7 @@ endif
- if ENABLE_WAYLAND
- libutil_la_SOURCES += display-wayland.c wayland-drm-protocol.c viewporter-protocol.c
- libutil_la_CFLAGS = @DRM_CFLAGS@
--libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lpvr_wlegl -lavcodec
-+libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lwayland-egl -lavcodec
- 
- endif
- 
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index bb166b74..079663e7 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omap-a15|ti43x"
 
 inherit autotools pkgconfig
 
-PR = "r29"
+PR = "r28"
 SRCREV = "20338b9f575ffe9c18c12bbed41c16069d27ccf4"
 
 EXTRA_OEMAKE = "CC="${CC}""
@@ -17,7 +17,6 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
         file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
-	file://0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


