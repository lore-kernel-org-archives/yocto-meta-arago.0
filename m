Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 594AB52A3E
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 22:44:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8MglbG114036
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573252967;
	bh=cofKCmpYt74NgR1W4jLbPqaEnkDQ9rPgyNEas62yATs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=q5c2YZbLdQ2MGo39APHdP8xui7quIkTryYt+SnW5T/Odj1eTi63axMKXOUoJV6ydM
	gTAkXHMljrjK3WpniPoovBN8p9jNKL8l6ZYpTW4sYUVrXGyxDRhmd6wXot3MYVO09H
	TTzA1lkBICh+yBwegYPf+wsvyRMo0f18dHRrgWtQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8MglP1037258
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 16:42:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 16:42:31 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8MgkmB115946
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 17:42:34 -0500
Message-ID: <20191108224236.50548-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108224236.50548-1-e-ruei1@ti.com>
References: <20191108224236.50548-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 2/4] Revert "glmark2: add tilcdc and tidss to the list of drm modules for AM3 and AM6 respectively"
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
X-List-Received-Date: Fri, 08 Nov 2019 22:44:12 -0000
Content-Type: text/plain

This reverts commit 47c4b0aeb5599fe4937cd6dca43b43b7795b064a.
Start to use 2017.07 because all required EGL 1.5 extensions are
supported by Mesa-based EGL now.
---
 ...-add-tilcdc-and-tidss-to-drm_modules.patch | 28 -------------------
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch

diff --git a/meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch b/meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch
deleted file mode 100644
index a66df92d..00000000
--- a/meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b533b3a738b49aa8ca0ad31a3a1ae7e62f0cc883 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 18 Oct 2018 14:06:24 -0400
-Subject: [PATCH] native-state-drm: add tilcdc and tidss to drm_modules list
-
-Upstream-Status: Pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/native-state-drm.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
-index 5f4699f..ef369b0 100644
---- a/src/native-state-drm.cpp
-+++ b/src/native-state-drm.cpp
-@@ -207,6 +207,8 @@ NativeStateDRM::init()
-         "radeon",
-         "vmgfx",
-         "omapdrm",
-+        "tilcdc",
-+        "tidss",
-         "exynos",
-         "pl111",
-         "vc4",
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
index d7744add..85d7bf16 100644
--- a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
     file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
     file://Fix-configure-for-sqrt-check.patch \
-    file://0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch \
 "
 SRCREV = "9b1070fe9c5cf908f323909d3c8cbed08022abe8"
 
-- 
2.17.1


