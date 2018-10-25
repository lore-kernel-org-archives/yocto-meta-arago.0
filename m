Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0534E5299C
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2018 14:01:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9PE11U2008146
	for <meta-arago@arago-project.org>; Thu, 25 Oct 2018 09:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1540476061;
	bh=gJoNvFwf5buEKJrqAopfEYhyfyRJ8BVy/HbjDlHsBlk=;
	h=From:To:Subject:Date;
	b=rvzNO/tCJ++P3zRhuqPdTLATvzDq2T65y0A7G1e3stJhdzyInsz6tIf6DO4x0ZVLY
	V6y+JBOvaedt/0/kZ9ghpC+knztsUyL+i74OKqKL1ZpInvhsoWUuZzJyLfcAdfPLuA
	HM3couSH/OJQ6NWmA8Ebbb+EPjK4xWOPHyM+cWg8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9PE116Z020628
	for <meta-arago@arago-project.org>; Thu, 25 Oct 2018 09:01:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 25 Oct 2018 09:01:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 25 Oct 2018 09:01:01 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9PE10oD030791
	for <meta-arago@arago-project.org>; Thu, 25 Oct 2018 09:01:00 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 Oct 2018 10:00:55 -0400
Message-ID: <1540476055-17045-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] glmark2: add tilcdc and tidss to the list of drm modules for AM3 and AM6 respectively
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
X-List-Received-Date: Thu, 25 Oct 2018 14:01:15 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e-drm-add-tilcdc-and-tidss-to-drm_modules.patch | 28 ++++++++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch

diff --git a/meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch b/meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch
new file mode 100644
index 0000000..a66df92
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch
@@ -0,0 +1,28 @@
+From b533b3a738b49aa8ca0ad31a3a1ae7e62f0cc883 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 18 Oct 2018 14:06:24 -0400
+Subject: [PATCH] native-state-drm: add tilcdc and tidss to drm_modules list
+
+Upstream-Status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/native-state-drm.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
+index 5f4699f..ef369b0 100644
+--- a/src/native-state-drm.cpp
++++ b/src/native-state-drm.cpp
+@@ -207,6 +207,8 @@ NativeStateDRM::init()
+         "radeon",
+         "vmgfx",
+         "omapdrm",
++        "tilcdc",
++        "tidss",
+         "exynos",
+         "pl111",
+         "vc4",
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
index 85d7bf1..d7744ad 100644
--- a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
     file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
     file://Fix-configure-for-sqrt-check.patch \
+    file://0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch \
 "
 SRCREV = "9b1070fe9c5cf908f323909d3c8cbed08022abe8"
 
-- 
1.9.1


