Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by arago-project.org (Postfix) with ESMTPS id 0F01052A9D
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:39 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h16so2924206oag.19
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=LE4ZYAS9BSuzcwfK+/rrpSi/c/8wT83aJczOVt8Q3Dw=;
	b=0EYJXxQcy9YwYOeihsrDlilWAE+1d3Z/XFsZbFazvErKs8egs2poj+W9vwhNX6a8QV
	Cs7UtpzsmemgR8H2PS9pXwvAXpCT2ogF211mIWEnHTVZyqvaJUQly+cjiIWH4CGzpDMg
	qEs8nCaEr1OCAA20GoN9D830CIRubMobXB6s9FlPHZkHw2eiK0vUADMl3IgjJFLA8L+5
	6inj4xtX7/CtXBH52r1wS7149Unrr9o2VakFLJLtYsQbcHp0OYiYF0H7vm7TGtXmQReV
	PW//yZW9irnWtE9O5lonWlWSb0GsSmiexlK49GfU/z0S7wG4RiHAVRfNCTHpvMyZ0GoS
	Kxzw==
X-Received: by 10.60.4.35 with SMTP id h3mr4686000oeh.123.1358445218468;
	Thu, 17 Jan 2013 09:53:38 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.36
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:37 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:08 -0600
Message-Id: <1358445195-22441-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/12] qt4-embedded-gles: Correct linux.conf
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:39 -0000

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


