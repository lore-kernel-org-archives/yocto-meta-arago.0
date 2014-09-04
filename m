Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 540C352992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 21:14:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84LEFfd008699
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 16:14:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84LEFeM010786
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 16:14:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 16:14:15 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s84LEEHL019170;	Thu, 4 Sep 2014 16:14:15 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s84LECD9012075;	Fri, 5 Sep 2014 02:44:13 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 16:14:10 -0500
Message-ID: <1409865250-23669-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3 v2] qtwayland: Fix windows margin issue when using touch events.
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
X-List-Received-Date: Thu, 04 Sep 2014 21:14:17 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* This is another QtWayland bug that was discussed in the Qt bug report:
  https://bugreports.qt-project.org/browse/QTBUG-36602
* Patch link:
    https://codereview.qt-project.org/#/c/93664/

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Add another patch that fixes moving the menu bar around issue.

 ...-drag-a-window-by-its-titlebar-using-the-.patch |  118 ++++++++++++++++++++
 .../0001-Wayland-correct-touch-location.patch      |   31 +++++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |    7 +-
 3 files changed, 154 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
new file mode 100644
index 0000000..468e519
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
@@ -0,0 +1,118 @@
+From 3538efae35dcbd4adf1361598deae0d198bbe13f Mon Sep 17 00:00:00 2001
+From: Shawn Rutledge <shawn.rutledge@digia.com>
+Date: Mon, 1 Sep 2014 17:04:09 +0200
+Subject: [PATCH] Wayland: can drag a window by its titlebar using the
+ touchscreen
+
+It was already possible to drag it via the mouse but not via touch.
+
+Task-number: QTBUG-41085
+Change-Id: Ia52c7124fb2f1aa0331897bd072fcf09fb78aa1a
+Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
+---
+ src/client/qwaylanddecoration.cpp  |   13 +++++++++++++
+ src/client/qwaylanddecoration_p.h  |    1 +
+ src/client/qwaylandinputdevice.cpp |   10 ++++++++--
+ src/client/qwaylandwindow.cpp      |    7 +++++++
+ src/client/qwaylandwindow_p.h      |    3 +++
+ 5 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/client/qwaylanddecoration.cpp b/src/client/qwaylanddecoration.cpp
+index b288deb..c9ab23c 100644
+--- a/src/client/qwaylanddecoration.cpp
++++ b/src/client/qwaylanddecoration.cpp
+@@ -335,6 +335,19 @@ bool QWaylandDecoration::handleMouse(QWaylandInputDevice *inputDevice, const QPo
+     return true;
+ }
+ 
++bool QWaylandDecoration::handleTouch(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global, Qt::TouchPointState state, Qt::KeyboardModifiers mods)
++{
++    Q_UNUSED(inputDevice);
++    Q_UNUSED(global);
++    Q_UNUSED(mods);
++
++    if (state == Qt::TouchPointPressed && local.y() <= m_margins.top()) {
++        m_wayland_window->shellSurface()->move(inputDevice);
++        return true;
++    }
++    return false;
++}
++
+ bool QWaylandDecoration::inMouseButtonPressedState() const
+ {
+     return m_mouseButtons & Qt::NoButton;
+diff --git a/src/client/qwaylanddecoration_p.h b/src/client/qwaylanddecoration_p.h
+index 14bf4a9..c240b9c 100644
+--- a/src/client/qwaylanddecoration_p.h
++++ b/src/client/qwaylanddecoration_p.h
+@@ -75,6 +75,7 @@ public:
+     bool isDirty() const;
+ 
+     bool handleMouse(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global,Qt::MouseButtons b,Qt::KeyboardModifiers mods);
++    bool handleTouch(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global, Qt::TouchPointState state, Qt::KeyboardModifiers mods);
+     bool inMouseButtonPressedState() const;
+ 
+     void startResize(QWaylandInputDevice *inputDevice,enum wl_shell_surface_resize resize, Qt::MouseButtons buttons);
+diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
+index 014303f..5be76d9 100644
+--- a/src/client/qwaylandinputdevice.cpp
++++ b/src/client/qwaylandinputdevice.cpp
+@@ -853,8 +853,8 @@ void QWaylandInputDevice::Touch::touch_down(uint32_t serial,
+                                      wl_fixed_t x,
+                                      wl_fixed_t y)
+ {
+-    Q_UNUSED(serial);
+-    Q_UNUSED(time);
++    mParent->mTime = time;
++    mParent->mSerial = serial;
+     mFocus = QWaylandWindow::fromWlSurface(surface);
+     mParent->handleTouchPoint(id, wl_fixed_to_double(x), wl_fixed_to_double(y), Qt::TouchPointPressed);
+ }
+@@ -966,6 +966,12 @@ void QWaylandInputDevice::Touch::touch_frame()
+ 
+     QWindow *window = mFocus ? mFocus->window() : 0;
+ 
++    if (mFocus) {
++        const QWindowSystemInterface::TouchPoint &tp = mTouchPoints.last();
++        QPointF localPos(window->mapFromGlobal(tp.area.center().toPoint()));
++        if (mFocus->touchDragDecoration(mParent, localPos, tp.area.center(), tp.state, mParent->modifiers()))
++            return;
++    }
+     QWindowSystemInterface::handleTouchEvent(window, mParent->mTouchDevice, mTouchPoints);
+ 
+     const bool allReleased = allTouchPointsReleased();
+diff --git a/src/client/qwaylandwindow.cpp b/src/client/qwaylandwindow.cpp
+index fb3095d..278825e 100644
+--- a/src/client/qwaylandwindow.cpp
++++ b/src/client/qwaylandwindow.cpp
+@@ -583,6 +583,13 @@ void QWaylandWindow::handleMouseLeave(QWaylandInputDevice *inputDevice)
+     restoreMouseCursor(inputDevice);
+ }
+ 
++bool QWaylandWindow::touchDragDecoration(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global, Qt::TouchPointState state, Qt::KeyboardModifiers mods)
++{
++    if (!mWindowDecoration)
++        return false;
++    return mWindowDecoration->handleTouch(inputDevice, local, global, state, mods);
++}
++
+ void QWaylandWindow::handleMouseEventWithDecoration(QWaylandInputDevice *inputDevice, ulong timestamp, const QPointF &local, const QPointF &global, Qt::MouseButtons b, Qt::KeyboardModifiers mods)
+ {
+     if (mWindowDecoration->handleMouse(inputDevice,local,global,b,mods))
+diff --git a/src/client/qwaylandwindow_p.h b/src/client/qwaylandwindow_p.h
+index 0d0833e..db0b594 100644
+--- a/src/client/qwaylandwindow_p.h
++++ b/src/client/qwaylandwindow_p.h
+@@ -156,6 +156,9 @@ public:
+     void handleMouseEnter(QWaylandInputDevice *inputDevice);
+     void handleMouseLeave(QWaylandInputDevice *inputDevice);
+ 
++    bool touchDragDecoration(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global,
++                             Qt::TouchPointState state, Qt::KeyboardModifiers mods);
++
+     bool createDecoration();
+ 
+     inline bool isMaximized() const { return mState == Qt::WindowMaximized; }
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
new file mode 100644
index 0000000..caa6dff
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
@@ -0,0 +1,31 @@
+From ae54be549e6ebeef829d5c1089d5307d00d0b791 Mon Sep 17 00:00:00 2001
+From: Shawn Rutledge <shawn.rutledge@digia.com>
+Date: Mon, 1 Sep 2014 15:30:42 +0200
+Subject: [PATCH] Wayland: correct touch location
+
+The window margins were offsetting the touch point in the wrong
+direction.
+
+Task-number: QTBUG-36602
+Change-Id: Id8b31d2de4051f36d3ff4e088bbc9bd7cc84ca13
+Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
+---
+ src/client/qwaylandinputdevice.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
+index 4a100f7..014303f 100644
+--- a/src/client/qwaylandinputdevice.cpp
++++ b/src/client/qwaylandinputdevice.cpp
+@@ -921,7 +921,7 @@ void QWaylandInputDevice::handleTouchPoint(int id, double x, double y, Qt::Touch
+ 
+         tp.area = QRectF(0, 0, 8, 8);
+         QMargins margins = win->frameMargins();
+-        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x+margins.left(), y+margins.top())));
++        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x - margins.left(), y - margins.top())));
+     }
+ 
+     tp.state = state;
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
index dca1710..1911a9e 100644
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,8 +1,11 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://0001-Fix-touch-with-Weston.patch"
+SRC_URI += "file://0001-Fix-touch-with-Weston.patch \
+            file://0001-Wayland-correct-touch-location.patch \
+            file://0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch \
+"
 
 
 QT_MODULE_BRANCH = "5.4"
-- 
1.7.9.5


