Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B516852976
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 19:07:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82J7UHk018190
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82J7U55031150
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 14:07:29 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s82J7TkF022168;	Tue, 2 Sep 2014 14:07:29 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s82J7OcV001691;	Wed, 3 Sep 2014 00:37:27 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 14:07:19 -0500
Message-ID: <1409684841-19677-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409684841-19677-1-git-send-email-fcooper@ti.com>
References: <1409684841-19677-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] qtwayland: Add Touch issue fix
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
X-List-Received-Date: Tue, 02 Sep 2014 19:07:31 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Currently Qt 5 when using Wayland only properly recognizes one touchup,
  touchmove and touch down event.
* Any further touch events are not properly recognized.
* Apparently this is a bug in how Weston handles touch events.
* Use a patch provided by Digia to work around this issue.
* More testing is required to verify that this is a valid fix.

Qt Bug Report link:
https://bugreports.qt-project.org/browse/QTBUG-36602

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt5/qtwayland/0001-Fix-touch-with-Weston.patch |   74 ++++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |    7 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
new file mode 100644
index 0000000..df564bb
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
@@ -0,0 +1,74 @@
+From 797fd02ed6bb26f30899e117d6ab8119b7a24f95 Mon Sep 17 00:00:00 2001
+From: Laszlo Agocs <laszlo.agocs@digia.com>
+Date: Fri, 29 Aug 2014 20:43:20 +0200
+Subject: [PATCH] Fix touch with Weston
+
+Work around the missing touch_frame after the last touch_up.
+
+Task-number: QTBUG-36602
+Change-Id: Iccb03bdc8b430c7cefc097c3c84e50be676c7fe7
+---
+ src/client/qwaylandinputdevice.cpp |   26 +++++++++++++++++++-------
+ 1 file changed, 19 insertions(+), 7 deletions(-)
+
+diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
+index 6c13201..a520c79 100644
+--- a/src/client/qwaylandinputdevice.cpp
++++ b/src/client/qwaylandinputdevice.cpp
+@@ -220,6 +220,8 @@ public:
+     void touch_frame() Q_DECL_OVERRIDE;
+     void touch_cancel() Q_DECL_OVERRIDE;
+ 
++    bool allTouchPointsReleased();
++
+     QWaylandInputDevice *mParent;
+     QWaylandWindow *mFocus;
+     QList<QWindowSystemInterface::TouchPoint> mTouchPoints;
+@@ -863,6 +865,13 @@ void QWaylandInputDevice::Touch::touch_up(uint32_t serial, uint32_t time, int32_
+     Q_UNUSED(time);
+     mFocus = 0;
+     mParent->handleTouchPoint(id, 0, 0, Qt::TouchPointReleased);
++
++    // As of Weston 1.5.90 there is no touch_frame after the last touch_up
++    // (i.e. when the last finger is released). To accomodate for this, issue a
++    // touch_frame. This cannot hurt since it is safe to call the touch_frame
++    // handler multiple times when there are no points left.
++    if (allTouchPointsReleased())
++        touch_frame();
+ }
+ 
+ void QWaylandInputDevice::Touch::touch_motion(uint32_t time, int32_t id, wl_fixed_t x, wl_fixed_t y)
+@@ -921,6 +930,15 @@ void QWaylandInputDevice::handleTouchPoint(int id, double x, double y, Qt::Touch
+     mTouch->mTouchPoints.append(tp);
+ }
+ 
++bool QWaylandInputDevice::Touch::allTouchPointsReleased()
++{
++    for (int i = 0; i < mTouchPoints.count(); ++i)
++        if (mTouchPoints.at(i).state != Qt::TouchPointReleased)
++            return false;
++
++    return true;
++}
++
+ void QWaylandInputDevice::Touch::touch_frame()
+ {
+     // Copy all points, that are in the previous but not in the current list, as stationary.
+@@ -950,13 +968,7 @@ void QWaylandInputDevice::Touch::touch_frame()
+ 
+     QWindowSystemInterface::handleTouchEvent(window, mParent->mTouchDevice, mTouchPoints);
+ 
+-    bool allReleased = true;
+-    for (int i = 0; i < mTouchPoints.count(); ++i)
+-        if (mTouchPoints.at(i).state != Qt::TouchPointReleased) {
+-            allReleased = false;
+-            break;
+-        }
+-
++    const bool allReleased = allTouchPointsReleased();
+     mPrevTouchPoints = mTouchPoints;
+     mTouchPoints.clear();
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
index 64de589..dca1710 100644
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,3 +1,8 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-Fix-touch-with-Weston.patch"
+
 
 QT_MODULE_BRANCH = "5.4"
-- 
1.7.9.5


