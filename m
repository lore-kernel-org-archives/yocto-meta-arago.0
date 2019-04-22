Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 54A7352093
	for <meta-arago@arago-project.org>;
	Mon, 22 Apr 2019 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB65440BD1;
	Mon, 22 Apr 2019 20:10:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bL05MoQOxPFK; Mon, 22 Apr 2019 20:10:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC16740BC1;
	Mon, 22 Apr 2019 20:10:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AA9CC16E4CB;
	Mon, 22 Apr 2019 16:10:51 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 22 Apr 2019 16:10:51 -0400
Message-Id: <1555963851-17767-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] qtwayland: remove old unused backported patches
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
X-List-Received-Date: Mon, 22 Apr 2019 20:11:17 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../qt5/qtwayland/0001-Fix-touch-with-Weston.patch |  74 -------------
 ...-drag-a-window-by-its-titlebar-using-the-.patch | 118 ---------------------
 .../0001-Wayland-correct-touch-location.patch      |  31 ------
 3 files changed, 223 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
deleted file mode 100644
index df564bb..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 797fd02ed6bb26f30899e117d6ab8119b7a24f95 Mon Sep 17 00:00:00 2001
-From: Laszlo Agocs <laszlo.agocs@digia.com>
-Date: Fri, 29 Aug 2014 20:43:20 +0200
-Subject: [PATCH] Fix touch with Weston
-
-Work around the missing touch_frame after the last touch_up.
-
-Task-number: QTBUG-36602
-Change-Id: Iccb03bdc8b430c7cefc097c3c84e50be676c7fe7
----
- src/client/qwaylandinputdevice.cpp |   26 +++++++++++++++++++-------
- 1 file changed, 19 insertions(+), 7 deletions(-)
-
-diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
-index 6c13201..a520c79 100644
---- a/src/client/qwaylandinputdevice.cpp
-+++ b/src/client/qwaylandinputdevice.cpp
-@@ -220,6 +220,8 @@ public:
-     void touch_frame() Q_DECL_OVERRIDE;
-     void touch_cancel() Q_DECL_OVERRIDE;
- 
-+    bool allTouchPointsReleased();
-+
-     QWaylandInputDevice *mParent;
-     QWaylandWindow *mFocus;
-     QList<QWindowSystemInterface::TouchPoint> mTouchPoints;
-@@ -863,6 +865,13 @@ void QWaylandInputDevice::Touch::touch_up(uint32_t serial, uint32_t time, int32_
-     Q_UNUSED(time);
-     mFocus = 0;
-     mParent->handleTouchPoint(id, 0, 0, Qt::TouchPointReleased);
-+
-+    // As of Weston 1.5.90 there is no touch_frame after the last touch_up
-+    // (i.e. when the last finger is released). To accomodate for this, issue a
-+    // touch_frame. This cannot hurt since it is safe to call the touch_frame
-+    // handler multiple times when there are no points left.
-+    if (allTouchPointsReleased())
-+        touch_frame();
- }
- 
- void QWaylandInputDevice::Touch::touch_motion(uint32_t time, int32_t id, wl_fixed_t x, wl_fixed_t y)
-@@ -921,6 +930,15 @@ void QWaylandInputDevice::handleTouchPoint(int id, double x, double y, Qt::Touch
-     mTouch->mTouchPoints.append(tp);
- }
- 
-+bool QWaylandInputDevice::Touch::allTouchPointsReleased()
-+{
-+    for (int i = 0; i < mTouchPoints.count(); ++i)
-+        if (mTouchPoints.at(i).state != Qt::TouchPointReleased)
-+            return false;
-+
-+    return true;
-+}
-+
- void QWaylandInputDevice::Touch::touch_frame()
- {
-     // Copy all points, that are in the previous but not in the current list, as stationary.
-@@ -950,13 +968,7 @@ void QWaylandInputDevice::Touch::touch_frame()
- 
-     QWindowSystemInterface::handleTouchEvent(window, mParent->mTouchDevice, mTouchPoints);
- 
--    bool allReleased = true;
--    for (int i = 0; i < mTouchPoints.count(); ++i)
--        if (mTouchPoints.at(i).state != Qt::TouchPointReleased) {
--            allReleased = false;
--            break;
--        }
--
-+    const bool allReleased = allTouchPointsReleased();
-     mPrevTouchPoints = mTouchPoints;
-     mTouchPoints.clear();
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
deleted file mode 100644
index 468e519..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 3538efae35dcbd4adf1361598deae0d198bbe13f Mon Sep 17 00:00:00 2001
-From: Shawn Rutledge <shawn.rutledge@digia.com>
-Date: Mon, 1 Sep 2014 17:04:09 +0200
-Subject: [PATCH] Wayland: can drag a window by its titlebar using the
- touchscreen
-
-It was already possible to drag it via the mouse but not via touch.
-
-Task-number: QTBUG-41085
-Change-Id: Ia52c7124fb2f1aa0331897bd072fcf09fb78aa1a
-Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
----
- src/client/qwaylanddecoration.cpp  |   13 +++++++++++++
- src/client/qwaylanddecoration_p.h  |    1 +
- src/client/qwaylandinputdevice.cpp |   10 ++++++++--
- src/client/qwaylandwindow.cpp      |    7 +++++++
- src/client/qwaylandwindow_p.h      |    3 +++
- 5 files changed, 32 insertions(+), 2 deletions(-)
-
-diff --git a/src/client/qwaylanddecoration.cpp b/src/client/qwaylanddecoration.cpp
-index b288deb..c9ab23c 100644
---- a/src/client/qwaylanddecoration.cpp
-+++ b/src/client/qwaylanddecoration.cpp
-@@ -335,6 +335,19 @@ bool QWaylandDecoration::handleMouse(QWaylandInputDevice *inputDevice, const QPo
-     return true;
- }
- 
-+bool QWaylandDecoration::handleTouch(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global, Qt::TouchPointState state, Qt::KeyboardModifiers mods)
-+{
-+    Q_UNUSED(inputDevice);
-+    Q_UNUSED(global);
-+    Q_UNUSED(mods);
-+
-+    if (state == Qt::TouchPointPressed && local.y() <= m_margins.top()) {
-+        m_wayland_window->shellSurface()->move(inputDevice);
-+        return true;
-+    }
-+    return false;
-+}
-+
- bool QWaylandDecoration::inMouseButtonPressedState() const
- {
-     return m_mouseButtons & Qt::NoButton;
-diff --git a/src/client/qwaylanddecoration_p.h b/src/client/qwaylanddecoration_p.h
-index 14bf4a9..c240b9c 100644
---- a/src/client/qwaylanddecoration_p.h
-+++ b/src/client/qwaylanddecoration_p.h
-@@ -75,6 +75,7 @@ public:
-     bool isDirty() const;
- 
-     bool handleMouse(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global,Qt::MouseButtons b,Qt::KeyboardModifiers mods);
-+    bool handleTouch(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global, Qt::TouchPointState state, Qt::KeyboardModifiers mods);
-     bool inMouseButtonPressedState() const;
- 
-     void startResize(QWaylandInputDevice *inputDevice,enum wl_shell_surface_resize resize, Qt::MouseButtons buttons);
-diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
-index 014303f..5be76d9 100644
---- a/src/client/qwaylandinputdevice.cpp
-+++ b/src/client/qwaylandinputdevice.cpp
-@@ -853,8 +853,8 @@ void QWaylandInputDevice::Touch::touch_down(uint32_t serial,
-                                      wl_fixed_t x,
-                                      wl_fixed_t y)
- {
--    Q_UNUSED(serial);
--    Q_UNUSED(time);
-+    mParent->mTime = time;
-+    mParent->mSerial = serial;
-     mFocus = QWaylandWindow::fromWlSurface(surface);
-     mParent->handleTouchPoint(id, wl_fixed_to_double(x), wl_fixed_to_double(y), Qt::TouchPointPressed);
- }
-@@ -966,6 +966,12 @@ void QWaylandInputDevice::Touch::touch_frame()
- 
-     QWindow *window = mFocus ? mFocus->window() : 0;
- 
-+    if (mFocus) {
-+        const QWindowSystemInterface::TouchPoint &tp = mTouchPoints.last();
-+        QPointF localPos(window->mapFromGlobal(tp.area.center().toPoint()));
-+        if (mFocus->touchDragDecoration(mParent, localPos, tp.area.center(), tp.state, mParent->modifiers()))
-+            return;
-+    }
-     QWindowSystemInterface::handleTouchEvent(window, mParent->mTouchDevice, mTouchPoints);
- 
-     const bool allReleased = allTouchPointsReleased();
-diff --git a/src/client/qwaylandwindow.cpp b/src/client/qwaylandwindow.cpp
-index fb3095d..278825e 100644
---- a/src/client/qwaylandwindow.cpp
-+++ b/src/client/qwaylandwindow.cpp
-@@ -583,6 +583,13 @@ void QWaylandWindow::handleMouseLeave(QWaylandInputDevice *inputDevice)
-     restoreMouseCursor(inputDevice);
- }
- 
-+bool QWaylandWindow::touchDragDecoration(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global, Qt::TouchPointState state, Qt::KeyboardModifiers mods)
-+{
-+    if (!mWindowDecoration)
-+        return false;
-+    return mWindowDecoration->handleTouch(inputDevice, local, global, state, mods);
-+}
-+
- void QWaylandWindow::handleMouseEventWithDecoration(QWaylandInputDevice *inputDevice, ulong timestamp, const QPointF &local, const QPointF &global, Qt::MouseButtons b, Qt::KeyboardModifiers mods)
- {
-     if (mWindowDecoration->handleMouse(inputDevice,local,global,b,mods))
-diff --git a/src/client/qwaylandwindow_p.h b/src/client/qwaylandwindow_p.h
-index 0d0833e..db0b594 100644
---- a/src/client/qwaylandwindow_p.h
-+++ b/src/client/qwaylandwindow_p.h
-@@ -156,6 +156,9 @@ public:
-     void handleMouseEnter(QWaylandInputDevice *inputDevice);
-     void handleMouseLeave(QWaylandInputDevice *inputDevice);
- 
-+    bool touchDragDecoration(QWaylandInputDevice *inputDevice, const QPointF &local, const QPointF &global,
-+                             Qt::TouchPointState state, Qt::KeyboardModifiers mods);
-+
-     bool createDecoration();
- 
-     inline bool isMaximized() const { return mState == Qt::WindowMaximized; }
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
deleted file mode 100644
index caa6dff..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ae54be549e6ebeef829d5c1089d5307d00d0b791 Mon Sep 17 00:00:00 2001
-From: Shawn Rutledge <shawn.rutledge@digia.com>
-Date: Mon, 1 Sep 2014 15:30:42 +0200
-Subject: [PATCH] Wayland: correct touch location
-
-The window margins were offsetting the touch point in the wrong
-direction.
-
-Task-number: QTBUG-36602
-Change-Id: Id8b31d2de4051f36d3ff4e088bbc9bd7cc84ca13
-Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
----
- src/client/qwaylandinputdevice.cpp |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
-index 4a100f7..014303f 100644
---- a/src/client/qwaylandinputdevice.cpp
-+++ b/src/client/qwaylandinputdevice.cpp
-@@ -921,7 +921,7 @@ void QWaylandInputDevice::handleTouchPoint(int id, double x, double y, Qt::Touch
- 
-         tp.area = QRectF(0, 0, 8, 8);
-         QMargins margins = win->frameMargins();
--        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x+margins.left(), y+margins.top())));
-+        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x - margins.left(), y - margins.top())));
-     }
- 
-     tp.state = state;
--- 
-1.7.9.5
-
-- 
2.7.4


