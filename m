Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6FB4452092
	for <meta-arago@arago-project.org>;
	Wed, 10 Jul 2019 17:57:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6AHujrV076877
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2019 12:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562781405;
	bh=rp8dHdkKlpNeXL10SFCXd/qB+kmsI2oq8mkOpBr3RYY=;
	h=From:To:Subject:Date;
	b=r7KmgqztEzzGKBICfiep8yUnoM3S+mL4SRQnhq9V7mFzpb3Cg4DYnK3bdia786TlJ
	rt97eZoU/aBRYNmnGBGmjzj2KUYu2L9EVBj9UtRtJs0DlChKXPyTpXpQRYk5G81f7c
	PlMA2HGGuTIl+tWal1A1B/IeUkIoDJI7Qdlt0mbg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6AHujiF092315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2019 12:56:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 10 Jul 2019 12:56:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 10 Jul 2019 12:56:45 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6AHuiqc090359
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2019 12:56:45 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Jul 2019 13:55:44 -0400
Message-ID: <20190710175545.20003-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] wayland-ivi-extension: pick up the latest version 2.2.0
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
X-List-Received-Date: Wed, 10 Jul 2019 17:57:34 -0000
Content-Type: text/plain

-pick up the latest 2.2.0 which is weston 5.0 compatible


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ....patch => 0001-force-type-conversion.patch} | 18 +++++++++++++++---
 ...2.1.0.bb => wayland-ivi-extension_2.2.0.bb} |  6 +++---
 2 files changed, 18 insertions(+), 6 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/{force-type-conversion.patch => 0001-force-type-conversion.patch} (56%)
 rename meta-arago-distro/recipes-graphics/wayland/{wayland-ivi-extension_2.1.0.bb => wayland-ivi-extension_2.2.0.bb} (88%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-force-type-conversion.patch
similarity index 56%
rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-force-type-conversion.patch
index a72aeedf..ed6b0178 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-force-type-conversion.patch
@@ -1,13 +1,25 @@
+From c497def0935440a6fa1d5f2e8dd0d17d50b207e2 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Mon, 8 Jul 2019 19:06:12 -0400
+Subject: [PATCH] force type conversion
+
+---
+ .../EGLWLMockNavigation/src/OpenGLES2App.cpp                    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
-index 2e65864..e14dbc0 100644
+index 50c3e38..2f4910e 100644
 --- a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
 +++ b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
-@@ -244,7 +247,7 @@ bool OpenGLES2App::createEGLContext()
+@@ -248,7 +248,7 @@ bool OpenGLES2App::createEGLContext(SurfaceConfiguration* config)
      m_eglContextStruct.eglSurface = NULL;
      m_eglContextStruct.eglContext = NULL;
  
 -    m_eglContextStruct.eglDisplay = eglGetDisplay(m_wlContextStruct.wlDisplay);
 +    m_eglContextStruct.eglDisplay = eglGetDisplay((EGLNativeDisplayType)m_wlContextStruct.wlDisplay);
-     eglstatus = eglGetError();
      if (!m_eglContextStruct.eglDisplay)
      {
+ 	cout << "Error: eglGetDisplay() failed.\n";
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
similarity index 88%
rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
index 52f9810a..891be8f1 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
@@ -5,10 +5,10 @@ BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Exten
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
 
-SRCREV = "d2c2e262f3bdc9db33b3014293fcdbcfdc90ab27"
+SRCREV = "10584b4d55c231a11964db0191c3707459982d4b"
 
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
-           file://force-type-conversion.patch \
+           file://0001-force-type-conversion.patch \
     "
 
 S = "${WORKDIR}/git"
@@ -24,7 +24,7 @@ FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
 
 EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-PR = "r1"
+PR = "r0"
 
 # Need these temporarily to prevent a non-fatal do_package_qa issue
 INSANE_SKIP_${PN} += "dev-deps"
-- 
2.17.1


