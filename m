Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8BE0152A33
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvAA089596
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465357;
	bh=WaFYVlfBE86QqG1dqZgfekSjMUj2slql/a+q880zk7Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CNIvONxvHkzbipovdeOAqD9YteZ8sZrszZU8HDstYp4atoDfixahtKnxBAnIjTewT
	lQpeKoFB1EE+/cWxam5yty9+F8X9jDoR1VKlKH+u/gK3rSxA4cPodwRb80x+mteEZ1
	gr4iXKftZncx3LhCUQaGXX/yGFqH77Nz0b5IQ+K4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtv5K031264
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:57 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwp112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:47 -0400
Message-ID: <20191030195550.17767-5-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 4/7] HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:19 -0000
Content-Type: text/plain

This is a tentative workaround due to unclean qtwebkit build procedure
where khrplatform.h under both sysroot/usr/include and 3rdparty/ANGLE
is used.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 +++++++++++++++++++
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
new file mode 100644
index 00000000..29521a8e
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
@@ -0,0 +1,30 @@
+From 4a21fcedd886772b7e1bd40861835f1b4f33c7ff Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 30 Aug 2019 17:41:13 -0400
+Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
+ MESA_EGL_NO_X11_HEADERS
+
+Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
+      This patch is a tentative workaround to make both files compatible
+
+Upstream-Status: Inappropriate [tentative workaround only]
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
+index c9e6f17d3..4e3ff69a8 100644
+--- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
++++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
+@@ -279,4 +279,6 @@ typedef enum {
+     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
+ } khronos_boolean_enum_t;
+ 
++#define MESA_EGL_NO_X11_HEADERS
++
+ #endif /* __khrplatform_h_ */
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 75213487..1dbe40d1 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -6,9 +6,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
+	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
 "
 
-PR_append = ".arago7"
+PR_append = ".arago8"
 
 EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
 
-- 
2.17.1


