Return-Path: <anandb@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8940F52985
	for <meta-arago@arago-project.org>;
	Mon, 24 Jun 2019 15:40:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OFdfCZ057889
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 10:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561390781;
	bh=9TqERihESL97X3qb0CpAI0S5yFTsM23f0O9vOcrzkXc=;
	h=From:To:CC:Subject:Date;
	b=t1rqVPd8JraBTLxyr3EjInyeKxCXkYUslQzVPPVZkHJ00Lk9b2IyI3tuOWpiFRBfG
	u0fU2F9zFIu3gqkcvVjptIARpcLy8RMUfRofHOKDI7hTAeGw+talEp16DEnj5qrSH+
	hifGV+zJd6AETaH2YBlnJo93tAL2dOzivhNBNW/U=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OFdfbf089126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 10:39:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 10:39:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 10:39:41 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OFddXq043054; 
	Mon, 24 Jun 2019 10:39:40 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 21:09:37 +0530
Message-ID: <1561390777-15499-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH v3] packagegroup-*-graphics: add virtual provider for GPU driver
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
X-List-Received-Date: Mon, 24 Jun 2019 15:40:24 -0000
Content-Type: text/plain

- Add a new virtual provider for GPU driver
- Specify Rogue and SGX as GPU driver provider for J7 and other platforms
- Replace SGX with virtual GPU provider in package groups

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>

Conflicts:
	meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc                 | 2 ++
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb       | 3 +--
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb     | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb   | 4 ++--
 4 files changed, 6 insertions(+), 5 deletions(-)

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
index 16be54a..aee7c3a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
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


