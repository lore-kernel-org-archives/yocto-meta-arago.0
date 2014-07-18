Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 070BE52ABF
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X005DG8F4AHR0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:17 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F39A0259B4; Fri,
	18 Jul 2014 14:52:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:51:57 -0400
Message-id: <1405709522-404-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 06/11] HACK: matrix-gui: run on top of Wayland
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui/init   | 7 +++++--
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index dab7dc6..6286028 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -2,17 +2,20 @@
 
 matrixgui="/usr/bin/matrix_browser"
 ROTATION=__MATRIX_ROT__
-GUI_OPTS="-qws $ROTATION http://localhost:80/"
+GUI_OPTS="http://localhost:80/"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 test -x "$matrixgui" || exit 0
 
 export TSLIB_TSDEVICE=/dev/input/touchscreen0
 export QWS_MOUSE_PROTO=Auto
+export QT_QPA_PLATFORM=wayland
+export XDG_RUNTIME_DIR=/run/user/root
+export WAYLAND_DISPLAY=wayland-0
 
 case "$1" in
   start)
-    chvt 4
+#    chvt 4
 
     # ARM9 devices get a lot of alignment trap errors with the current
     # version of Qt (4.7.2) that we use.  The printing of these messages
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 523cfe1..16f2eeb 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r16"
+PR = "r17"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
2.0.0


