Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id AD41252A47
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtwVp122956
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465358;
	bh=9FOvb0QpAX9YiKZQ0SuwiFdqB5efRKSA892haUzf0IM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JZwj77PRtBO1Jr5FqrmTZAJFoh/uy3zgvvGT3LZDxcjSqoiH35a2dyz9pDY1MH473
	PAHOjotdqvNVD9EJgbQtbBaNuA9jfpqzZQmxSiuCN9bHuaRHWlIaWFwP2r62/8CvC9
	U9JW6KSVRoZlxbY3snnn6Tx2MwO38DRbzNL1DOMo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtwMI031271
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:45 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwr112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:49 -0400
Message-ID: <20191030195550.17767-7-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 6/7] omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:21 -0000
Content-Type: text/plain

- Replace pvr_wlegl with wayland_egl in the LDFLAGS string

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
new file mode 100644
index 00000000..4774425f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
@@ -0,0 +1,32 @@
+From 06b21346d662209f5ea9816f408f9f883b775d60 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Mon, 28 Oct 2019 09:43:47 -0400
+Subject: [PATCH] util: Makefile.am: update LDFLAGS for Mesa-based EGL
+
+- replace pvr_wlegl with wayland-egl
+
+Upstream-Status: Pending
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ util/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+ mode change 100644 => 100755 util/Makefile.am
+
+diff --git a/util/Makefile.am b/util/Makefile.am
+old mode 100644
+new mode 100755
+index 2bfcb5e..fdeb877
+--- a/util/Makefile.am
++++ b/util/Makefile.am
+@@ -37,7 +37,7 @@ endif
+ if ENABLE_WAYLAND
+ libutil_la_SOURCES += display-wayland.c wayland-drm-protocol.c viewporter-protocol.c
+ libutil_la_CFLAGS = @DRM_CFLAGS@
+-libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lpvr_wlegl -lavcodec
++libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lwayland-egl -lavcodec
+ 
+ endif
+ 
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 079663e7..bb166b74 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omap-a15|ti43x"
 
 inherit autotools pkgconfig
 
-PR = "r28"
+PR = "r29"
 SRCREV = "20338b9f575ffe9c18c12bbed41c16069d27ccf4"
 
 EXTRA_OEMAKE = "CC="${CC}""
@@ -17,6 +17,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
         file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
+	file://0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


