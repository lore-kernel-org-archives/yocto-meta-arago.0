Return-Path: <anandb@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D3B0052985
	for <meta-arago@arago-project.org>;
	Mon, 24 Jun 2019 15:34:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OFY8ks055837
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 10:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561390448;
	bh=166Bp+/evu0JLjW+OFWNdw2/lTYrkKxg1v/bBd/CZXo=;
	h=From:To:CC:Subject:Date;
	b=MNwtE674dRS0bRE8HlHZg5IW+qef5b000/rbcBHkupvrhyRnUlZicPdeDp+rv6x2O
	WM+b16Kxe80WaIaIQFWICf1KvRpUsLNDnvMA6UjyXHhDNrtKdwSzFZQ0K/9k8BA6iR
	zF/UOYb8xuZzZrZPxv8099vsoeR9TQEJ6KsDK86U=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OFY8Ev117971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 10:34:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 10:34:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 10:34:08 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OFY6lN110992; 
	Mon, 24 Jun 2019 10:34:07 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 21:04:03 +0530
Message-ID: <1561390443-189136-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH v2] packagegroup-*-graphics: add virtual provider for GPU driver
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
X-List-Received-Date: Mon, 24 Jun 2019 15:34:52 -0000
Content-Type: text/plain

- Add a new virtual provider for GPU driver
- Specify Rogue and SGX as GPU driver provider for J7 and other platforms
- Replace SGX with virtual GPU provider in package groups

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>

Conflicts:
	meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc                  | 2 ++
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb        | 3 +--
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb      | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb    | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 25d32d5..939569c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -11,11 +11,13 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
 
 # J7 has a Rogue GPU core
 PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-img-rogue-driver"
 
 # OpenGL preferences
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index d7ac1ef..486d080 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -6,8 +6,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-GRAPHICS_RDEPENDS = "ti-sgx-ddk-km-src"
-GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-src"
+GRAPHICS_RDEPENDS = "${PREFERRED_PROVIDER_virtual/gpudriver}-src"
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-driver-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index c461f9b..bc6215e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -12,7 +12,7 @@ GRAPHICS_RDEPENDS = "\
     wayland-dev \
     weston-dev \
     ${PREFERRED_PROVIDER_virtual/egl}-dev \
-    ti-sgx-ddk-km-dev \
+    ${PREFERRED_PROVIDER_virtual/gpudriver}-dev \
 "
 GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-dev"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 16be54a..9fa5123 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -24,7 +24,7 @@ GRAPHICS_WAYLAND_append_k3 = "\
 GRAPHICS_RDEPENDS = "\
     libgbm \
     ${PREFERRED_PROVIDER_virtual/egl} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-sgx-ddk-km','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','glmark2','',d)} \
 "
 GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km"
-- 
1.9.1


