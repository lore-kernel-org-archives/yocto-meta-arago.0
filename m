Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 41B0B52993
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 15:22:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VFLO41037363
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559316084;
	bh=ss0BC3C7hoaCsinM724jKFrLw5mFPRYUoKTs2NRBDYg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=T+oL6Zpq7ypAvCo6KQFLHTva+D3BItAoJrCOO4ps3N8fgo3vpPk4wNnbpRq2AMTJZ
	L8Kgkq8G8oDUausvRQezIhntT2ycvyIVzIvhc3xTQByG3j8VNBOJZxBE6qrSyj1D8F
	MIFwLbLy/b6EHBwsA5R/0R5klz+5Xo7HATbknA1U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VFLOhm110623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 10:21:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 10:21:24 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VFLJUr034955
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:23 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 11:20:58 -0400
Message-ID: <20190531152100.19757-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531152100.19757-1-e-ruei1@ti.com>
References: <20190531152100.19757-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/4] packagegroup-arago-tisdk-graphics: add MACHINE FEATURES condition sgx for certain modules
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
X-List-Received-Date: Fri, 31 May 2019 15:22:00 -0000
Content-Type: text/plain

- The following modules all depend on sgx to be functional:
  chromium-wayland
  ti-sgx-ddk-km
  glmark2

Note: ti-sgx-ddk-um is still needed for build, but the libraries will not
      be invoked at run-time

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-graphics.bb             | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index e12c42aa..cb7f68bc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 inherit packagegroup
 
@@ -12,25 +12,25 @@ GRAPHICS_WAYLAND = "\
 "
 
 GRAPHICS_WAYLAND_append_omap-a15 = "\
-    chromium-wayland \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','chromium-wayland','',d)} \
 "
 
 GRAPHICS_WAYLAND_append_k3 = "\
-    chromium-wayland \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','chromium-wayland','',d)} \
 "
 
 GRAPHICS_RDEPENDS = "\
     libgbm \
-    ti-sgx-ddk-km \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-sgx-ddk-km','',d)} \
     ti-sgx-ddk-um \
-    glmark2 \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','glmark2','',d)} \
 "
 
 GRAPHICS_DISPLAY_UTILS = "\
 "
 
 GRAPHICS_DISPLAY_UTILS_append_omap-a15  = "\
-    glsdk-util-scripts \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','glsdk-util-scripts','',d)} \
 "
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
-- 
2.17.1


