Return-Path: <anandb@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 2EED0520C0
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 12:40:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KCeF6p066251
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 07:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561034415;
	bh=lWPXPn/bi8lKeXwIpoLX1/UqSReRFsDe37NDtWeVHJ8=;
	h=From:To:CC:Subject:Date;
	b=Aeq3Wq9FK/alE9vHP32+ExUGc8rJVLSulmvBa8IpGQAl1OGWU9IQBONFiEzCX2VPg
	tj9IiEBBETyGFSv9P4+zfD5oVVOlJMDygIT4X4el6RunNVJ3KE5h8cyXMZEPEomY0B
	m0Ec+0lo4Nz89iyOFBAXypCZiesz8zs5MCMLhN2s=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KCeFaZ065433
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 07:40:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 07:40:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 07:40:15 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KCeDi5089677; 
	Thu, 20 Jun 2019 07:40:14 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 18:10:12 +0530
Message-ID: <1561034412-64937-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] packagegroup-*-graphics: add virtual provider for GPU driver
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
X-List-Received-Date: Thu, 20 Jun 2019 12:40:57 -0000
Content-Type: text/plain

- Add a new virtual provider for GPU driver
- Specify Rogue and SGX as GPU driver provider for J7 and other platforms
- Replace SGX with virtual GPU provider in package groups

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc                   | 2 ++
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb       | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb     | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index e9e9177..3f36747 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -9,11 +9,13 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
 
 # J7 has a Rogue GPU core
 PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-img-rogue-driver"
 
 PREFERRED_PROVIDER_libgbm = "libgbm"
 PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 96ed27b..486d080 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -6,7 +6,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-GRAPHICS_RDEPENDS = "ti-sgx-ddk-km-src"
+GRAPHICS_RDEPENDS = "${PREFERRED_PROVIDER_virtual/gpudriver}-src"
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-driver-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 7e18d08..3f6485f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -12,7 +12,7 @@ GRAPHICS_RDEPENDS = "\
     wayland-dev \
     weston-dev \
     ${PREFERRED_PROVIDER_virtual/egl}-dev \
-    ti-sgx-ddk-km-dev \
+    ${PREFERRED_PROVIDER_virtual/gpudriver}-dev \
 "
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 69cfea5..de9e8c4 100644
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
 
-- 
1.9.1


