Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 8A9155296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:35:12 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2768654obc.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LE4ZYAS9BSuzcwfK+/rrpSi/c/8wT83aJczOVt8Q3Dw=;
	b=1HimaEjZwULoLQSyqH0btmEujCqykDIWlHObBgWKtA+g/dvBOUc422Zq5Uq2mveyvj
	/Mu1NeR7FEtxOS2plml3otX2fqM0rGi+hpJpc+UrpKnoRmz4sDlW5F/tRY333c3pOhk2
	rTXNbXLj7WXBU8lykLAeGffbrhwFWow1i2yDrGVHHXpucMfKkhwILmkKUNu4/Rd3LeTe
	KQ4fzkc1zP7gHsMZ/gTPUA2kIX8d/R4jbzUOGu9Xvh2bHw72eVx6a1q+kLQz72gYaIsm
	eMs8fNdDEDjCxzu5hLS9Li8pY7dKT4vkLoDuwBjC5szUxINdlWxu0BjrwH5Ix+7AoNY5
	sBUQ==
Received: by 10.60.27.161 with SMTP id u1mr16193596oeg.27.1352759711983;
	Mon, 12 Nov 2012 14:35:11 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b20sm8270855obu.4.2012.11.12.14.35.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:35:11 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:35:07 -0600
Message-Id: <1352759707-5369-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt4-embedded-gles: Correct linux.conf
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
X-List-Received-Date: Mon, 12 Nov 2012 22:35:12 -0000

* Remove ${STAGING_INCDIR} and ${STAGING_LIBDIR} from linux.conf. These
  variables were improperly set in the first place and caused build issues
  when building quick-playground.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt4/qt4-embedded-gles/linux.conf    |   23 +++++++++++--------
 .../recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb      |    2 +-
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
index 7a96715..b26b7ea 100644
--- a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
+++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
@@ -11,16 +11,19 @@ QMAKE_INCDIR_X11      =
 QMAKE_LIBDIR_X11      =
 QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
 QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   = ${STAGING_INCDIR}/GLES
-QMAKE_LIBDIR_OPENGL   = ${STAGING_LIBDIR}
-QMAKE_INCDIR_OPENGL_ES1 = ${STAGING_INCDIR}/GLES
-QMAKE_LIBDIR_OPENGL_ES1 = ${STAGING_LIBDIR}
-QMAKE_INCDIR_OPENGL_ES2 = ${STAGING_INCDIR}/GLES2
-QMAKE_LIBDIR_OPENGL_ES2 = ${STAGING_LIBDIR}
-QMAKE_INCDIR_EGL      = ${STAGING_INCDIR}/GLES2
-QMAKE_LIBDIR_EGL      = ${STAGING_LIBDIR}
+QMAKE_INCDIR_OPENGL   =
+QMAKE_LIBDIR_OPENGL   =
+QMAKE_INCDIR_OPENGL_ES1 = $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES1 = $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_OPENGL_ES2 = $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES2 = $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_EGL      =
+QMAKE_LIBDIR_EGL      =
+QMAKE_INCDIR_OPENVG   =
+QMAKE_LIBDIR_OPENVG   =
 
-QMAKE_LIBS            = -Wl,-rpath-link,SEDME/lib -lglib-2.0
+
+QMAKE_LIBS            =
 QMAKE_LIBS_DYNLOAD    = -ldl
 QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
 QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
@@ -40,7 +43,7 @@ QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
 QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
 
 QMAKE_AR              = $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         = ${OBJCOPY}
+QMAKE_OBJCOPY         = objcopy
 QMAKE_RANLIB          =
 
 QMAKE_TAR             = tar -cf
diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
index c26cc2c..be8f12f 100644
--- a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
+++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
@@ -1,7 +1,7 @@
 require ${COREBASE}/meta/recipes-qt/qt4/qt-${PV}.inc
 require ${COREBASE}/meta/recipes-qt/qt4/qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-qt/qt4/qt-4.8.0:${COREBASE}/meta/recipes-qt/qt4/files:"
 
-- 
1.7.0.4


