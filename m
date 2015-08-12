Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A5F465299C
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2015 12:27:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7CCQurY021619
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 07:26:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CCQuTx007614
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 07:26:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 12 Aug 2015 07:26:56 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CCQuR5018513;
	Wed, 12 Aug 2015 07:26:56 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPV7P-0004wk-3t; Wed, 12 Aug 2015 08:26:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Aug 2015 08:26:53 -0400
Message-ID: <1439382413-12377-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qtbase,examples,deform: UX enhancements.
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
X-List-Received-Date: Wed, 12 Aug 2015 12:27:07 -0000
Content-Type: text/plain

* Enhance how controls are shown:
  - Hide controls before showing them so that they will persist in
    the foreground.
* Remove OpenGL button
  - This feature does not work properly.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../0001-deform-Fix-how-controls-are-shown.patch   | 33 ++++++++++
 .../qtbase/0002-deform-disable-opengl-button.patch | 71 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |  4 +-
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
new file mode 100644
index 0000000..076beca
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
@@ -0,0 +1,33 @@
+From adad036a785f6b3910e6305181e7711c2bac0df6 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Fri, 12 Jun 2015 08:34:17 -0400
+Subject: [PATCH 1/2] deform: Fix how controls are shown.
+
+* Workaround for issue when controls are full screen, and user clicks
+  OK, black surface remains covering the entire screen.
+* If controls are not full screen, then they must retain focus while
+  opened.
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ examples/widgets/painting/deform/pathdeform.cpp |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/examples/widgets/painting/deform/pathdeform.cpp b/examples/widgets/painting/deform/pathdeform.cpp
+index 287f700..f8ecc3b 100644
+--- a/examples/widgets/painting/deform/pathdeform.cpp
++++ b/examples/widgets/painting/deform/pathdeform.cpp
+@@ -266,7 +266,9 @@ PathDeformWidget::PathDeformWidget(QWidget *parent, bool smallScreen)
+ 
+ void PathDeformWidget::showControls()
+ {
+-    m_controls->showFullScreen();
++    // Hide first to keep controls in foreground.
++    m_controls->hide();
++    m_controls->show();
+ }
+ 
+ void PathDeformWidget::hideControls()
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
new file mode 100644
index 0000000..b15324b
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
@@ -0,0 +1,71 @@
+From 066333592c77ef831286482c7d3636265777a774 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Fri, 12 Jun 2015 10:24:33 -0400
+Subject: [PATCH 2/2] deform: disable opengl button.
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ examples/widgets/painting/deform/pathdeform.cpp |   12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/examples/widgets/painting/deform/pathdeform.cpp b/examples/widgets/painting/deform/pathdeform.cpp
+index f8ecc3b..9da6bf3 100644
+--- a/examples/widgets/painting/deform/pathdeform.cpp
++++ b/examples/widgets/painting/deform/pathdeform.cpp
+@@ -91,7 +91,7 @@ void PathDeformControls::layoutForDesktop()
+     QPushButton *showSourceButton = new QPushButton(mainGroup);
+     showSourceButton->setText(tr("Show Source"));
+ 
+-#ifdef QT_OPENGL_SUPPORT
++#if 0
+     QPushButton *enableOpenGLButton = new QPushButton(mainGroup);
+     enableOpenGLButton->setText(tr("Use OpenGL"));
+     enableOpenGLButton->setCheckable(true);
+@@ -114,7 +114,7 @@ void PathDeformControls::layoutForDesktop()
+     mainGroupLayout->addWidget(textGroup);
+     mainGroupLayout->addWidget(animateButton);
+     mainGroupLayout->addStretch(1);
+-#ifdef QT_OPENGL_SUPPORT
++#if 0
+     mainGroupLayout->addWidget(enableOpenGLButton);
+ #endif
+     mainGroupLayout->addWidget(showSourceButton);
+@@ -140,7 +140,7 @@ void PathDeformControls::layoutForDesktop()
+     connect(deformSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setIntensity(int)));
+     connect(fontSizeSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setFontSize(int)));
+     connect(animateButton, SIGNAL(clicked(bool)), m_renderer, SLOT(setAnimated(bool)));
+-#ifdef QT_OPENGL_SUPPORT
++#if 0
+     connect(enableOpenGLButton, SIGNAL(clicked(bool)), m_renderer, SLOT(enableOpenGL(bool)));
+ #endif
+ 
+@@ -183,7 +183,7 @@ void PathDeformControls::layoutForSmallScreen()
+     QPushButton *animateButton = new QPushButton(tr("Animated"), mainGroup);
+     animateButton->setCheckable(true);
+ 
+-#ifdef QT_OPENGL_SUPPORT
++#if 0
+     QPushButton *enableOpenGLButton = new QPushButton(mainGroup);
+     enableOpenGLButton->setText(tr("Use OpenGL"));
+     enableOpenGLButton->setCheckable(mainGroup);
+@@ -205,7 +205,7 @@ void PathDeformControls::layoutForSmallScreen()
+     mainGroupLayout->addWidget(fontSizeLabel, 2, 0, Qt::AlignRight);
+     mainGroupLayout->addWidget(fontSizeSlider, 2, 1);
+     mainGroupLayout->addWidget(animateButton, 3,0, 1,2);
+-#ifdef QT_OPENGL_SUPPORT
++#if 0
+     mainGroupLayout->addWidget(enableOpenGLButton, 4,0, 1,2);
+ #endif
+ 
+@@ -221,7 +221,7 @@ void PathDeformControls::layoutForSmallScreen()
+     connect(deformSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setIntensity(int)));
+     connect(fontSizeSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setFontSize(int)));
+     connect(animateButton, SIGNAL(clicked(bool)), m_renderer, SLOT(setAnimated(bool)));
+-#ifdef QT_OPENGL_SUPPORT
++#if 0
+     connect(enableOpenGLButton, SIGNAL(clicked(bool)), m_renderer, SLOT(enableOpenGL(bool)));
+ #endif
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
index 412bf67..d6e3f4d 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -5,7 +5,7 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago6"
+PR_append = "-arago7"
 
 QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -21,6 +21,8 @@ QT_ENV_ti33x = "${@base_contains('DISTRO_FEATURES', 'wayland', 'qt_env.sh', 'qt_
 SRC_URI += "\
     file://${QT_ENV} \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
+    file://0001-deform-Fix-how-controls-are-shown.patch \
+    file://0002-deform-disable-opengl-button.patch \
 "
 
 python do_patch_append() {
-- 
1.9.1


