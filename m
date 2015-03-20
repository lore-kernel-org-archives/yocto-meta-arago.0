Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 68BC6529BD
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 11:05:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2KB5qiI023391
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 06:05:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KB5pNv018315
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 06:05:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 06:05:51 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KB5pJX011141;
	Fri, 20 Mar 2015 06:05:51 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YYukQ-0006Xi-NB;
	Fri, 20 Mar 2015 07:05:50 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Mar 2015 07:05:49 -0400
Message-ID: <1426849549-25118-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] qtbase-examples: Add exit buttons when not using wayland.
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
X-List-Received-Date: Fri, 20 Mar 2015 11:05:53 -0000
Content-Type: text/plain

* Only the examples which are exposed in matrix are patched.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Removed quit.png from qtbase patches as this does not get applied during 
    the build.

 ...Add-exit-button-for-non-window-environmen.patch |   60 +++++++++++++++
 ...es-Add-exit-button-for-non-window-environ.patch |   81 ++++++++++++++++++++
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |   23 +++++-
 3 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
new file mode 100644
index 0000000..e123df5
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
@@ -0,0 +1,60 @@
+From b0cb70d35131643dce61fa5a8ce9f652dc63e963 Mon Sep 17 00:00:00 2001
+From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
+Date: Thu, 19 Mar 2015 15:21:08 -0400
+Subject: [PATCH 1/2] calculator: Add exit button for non-window environment.
+
+Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
+---
+ examples/widgets/widgets/calculator/calculator.cpp |    9 ++++++++-
+ examples/widgets/widgets/calculator/calculator.h   |    1 +
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/examples/widgets/widgets/calculator/calculator.cpp b/examples/widgets/widgets/calculator/calculator.cpp
+index bb3836b..afe0bba 100644
+--- a/examples/widgets/widgets/calculator/calculator.cpp
++++ b/examples/widgets/widgets/calculator/calculator.cpp
+@@ -78,6 +78,7 @@ Calculator::Calculator(QWidget *parent)
+     Button *backspaceButton = createButton(tr("Backspace"), SLOT(backspaceClicked()));
+     Button *clearButton = createButton(tr("Clear"), SLOT(clear()));
+     Button *clearAllButton = createButton(tr("Clear All"), SLOT(clearAll()));
++    Button *quitButton = createButton(tr("Quit"), SLOT(quitClicked()));
+ 
+     Button *clearMemoryButton = createButton(tr("MC"), SLOT(clearMemory()));
+     Button *readMemoryButton = createButton(tr("MR"), SLOT(readMemory()));
+@@ -100,7 +101,8 @@ Calculator::Calculator(QWidget *parent)
+ //! [5] //! [6]
+     mainLayout->setSizeConstraint(QLayout::SetFixedSize);
+     mainLayout->addWidget(display, 0, 0, 1, 6);
+-    mainLayout->addWidget(backspaceButton, 1, 0, 1, 2);
++    mainLayout->addWidget(quitButton, 1, 0, 1, 1);
++    mainLayout->addWidget(backspaceButton, 1, 1, 1, 1);
+     mainLayout->addWidget(clearButton, 1, 2, 1, 2);
+     mainLayout->addWidget(clearAllButton, 1, 4, 1, 2);
+ 
+@@ -297,6 +299,11 @@ void Calculator::changeSignClicked()
+ }
+ //! [24]
+ 
++void Calculator::quitClicked()
++{
++    qApp->quit();
++}
++
+ //! [26]
+ void Calculator::backspaceClicked()
+ {
+diff --git a/examples/widgets/widgets/calculator/calculator.h b/examples/widgets/widgets/calculator/calculator.h
+index 76cf048..5e5c52e 100644
+--- a/examples/widgets/widgets/calculator/calculator.h
++++ b/examples/widgets/widgets/calculator/calculator.h
+@@ -64,6 +64,7 @@ private slots:
+     void equalClicked();
+     void pointClicked();
+     void changeSignClicked();
++    void quitClicked();
+     void backspaceClicked();
+     void clear();
+     void clearAll();
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
new file mode 100644
index 0000000..7b7ab3c
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
@@ -0,0 +1,81 @@
+From 98476756ed6313c13adadf9d86bb921008c61eff Mon Sep 17 00:00:00 2001
+From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
+Date: Fri, 20 Mar 2015 15:00:51 -0400
+Subject: [PATCH 2/2] animatedtiles: Add exit button for non-window
+ environment.
+
+Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
+---
+ .../animation/animatedtiles/animatedtiles.qrc      |    1 +
+ examples/widgets/animation/animatedtiles/main.cpp  |   13 ++++++++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/examples/widgets/animation/animatedtiles/animatedtiles.qrc b/examples/widgets/animation/animatedtiles/animatedtiles.qrc
+index c43a979..3675345 100644
+--- a/examples/widgets/animation/animatedtiles/animatedtiles.qrc
++++ b/examples/widgets/animation/animatedtiles/animatedtiles.qrc
+@@ -6,6 +6,7 @@
+     <file>images/figure8.png</file>
+     <file>images/kinetic.png</file>
+     <file>images/random.png</file>
++    <file>images/quit.png</file>
+     <file>images/tile.png</file>
+ </qresource>
+ </RCC>
+diff --git a/examples/widgets/animation/animatedtiles/main.cpp b/examples/widgets/animation/animatedtiles/main.cpp
+index 09e9790..d8491d7 100644
+--- a/examples/widgets/animation/animatedtiles/main.cpp
++++ b/examples/widgets/animation/animatedtiles/main.cpp
+@@ -97,6 +97,12 @@ public:
+         painter->drawPixmap(-_pix.width()/2, -_pix.height()/2, _pix);
+     }
+ 
++public slots:
++    void quitClicked()
++    {
++        qApp->quit();
++    }
++
+ signals:
+     void pressed();
+ 
+@@ -121,6 +127,7 @@ class View : public QGraphicsView
+ public:
+     View(QGraphicsScene *scene) : QGraphicsView(scene) { }
+ 
++
+ protected:
+     void resizeEvent(QResizeEvent *event) Q_DECL_OVERRIDE
+     {
+@@ -156,16 +163,18 @@ int main(int argc, char **argv)
+     Button *randomButton = new Button(QPixmap(":/images/random.png"), buttonParent);
+     Button *tiledButton = new Button(QPixmap(":/images/tile.png"), buttonParent);
+     Button *centeredButton = new Button(QPixmap(":/images/centered.png"), buttonParent);
++    Button *quitButton = new Button(QPixmap(":/images/quit.png"), buttonParent);
+ 
+     ellipseButton->setPos(-100, -100);
+     figure8Button->setPos(100, -100);
+     randomButton->setPos(0, 0);
+     tiledButton->setPos(-100, 100);
+     centeredButton->setPos(100, 100);
++    quitButton->setPos(100, -600);
+ 
+     scene.addItem(buttonParent);
+     buttonParent->setTransform(QTransform::fromScale(0.75, 0.75), true);
+-    buttonParent->setPos(200, 200);
++    buttonParent->setPos(400, 200);
+     buttonParent->setZValue(65);
+ 
+     // States
+@@ -239,6 +248,8 @@ int main(int argc, char **argv)
+     trans = rootState->addTransition(centeredButton, SIGNAL(pressed()), centeredState);
+     trans->addAnimation(group);
+ 
++    QObject::connect(quitButton, SIGNAL(pressed()), quitButton, SLOT(quitClicked()));
++
+     QTimer timer;
+     timer.start(125);
+     timer.setSingleShot(true);
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
index 4af0582..210d23f 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -5,11 +5,30 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
-SRC_URI += "file://qt_env.sh"
+QT_EGLFS_PATCHES = "\
+    file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
+    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
+    file://quit.png \
+"
+
+SRC_URI += "\
+    file://qt_env.sh \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
+"
+
+python do_patch_append() {
+    import shutil
+
+    work_dir = d.getVar("WORKDIR", True)
+    s = d.getVar("S", True)
+
+    if not oe.utils.contains('DISTRO_FEATURES','wayland',True,False,d):
+        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
+}
 
 # Add custom Arago Qt 5 Environment script file
 do_install_append () {
-- 
1.7.9.5


