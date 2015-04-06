Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A2D4652093
	for <meta-arago@arago-project.org>;
	Mon,  6 Apr 2015 12:59:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t36CxVvK001501
	for <meta-arago@arago-project.org>; Mon, 6 Apr 2015 07:59:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t36CxU6i008944
	for <meta-arago@arago-project.org>; Mon, 6 Apr 2015 07:59:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Apr 2015 07:59:30 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t36CxU9C004231;
	Mon, 6 Apr 2015 07:59:30 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Yf6cj-00073d-V2;
	Mon, 06 Apr 2015 08:59:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Apr 2015 08:59:23 -0400
Message-ID: <1428325163-27099-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui: Disable terminal blanking while running matrix.
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
X-List-Received-Date: Mon, 06 Apr 2015 12:59:32 -0000
Content-Type: text/plain

* When running qt over eglfs, matrix may blank out after 10 minutes of
  inactivity.
* When this occurs, the matrix is not recoverable and muyst be manuallyi
  restarted.
* This occurs because virtual terminal in which matrix is running will blank
  due to kernel configuration.
* Writing certain special characters into the virtual terminal device can
  disable the blanking.
* The utils-linux package contains the "setterm" utility which may obtain the
  same results with the command "setterm -blank 0 -powerdown 0", however,
  utils-linux is not present on the filesystem.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui/init.eglfs      |    4 ++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
index 10748c4..213f859 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
@@ -35,6 +35,7 @@ case "$1" in
     fi
 
     echo 0 > /sys/class/graphics/fbcon/cursor_blink
+    echo -ne "\033[9;0]\033[14;0]" > /dev/tty4
 
     echo -n "Starting Matrix GUI application"
     start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE --exec $matrixgui -- $GUI_OPTS
@@ -46,7 +47,10 @@ case "$1" in
     start-stop-daemon --stop --quiet --pidfile $PIDFILE
 
     refresh_screen "background-black"
+
+    echo -ne "\033[9;10]\033[14;10]" > /dev/tty4
     echo 1 > /sys/class/graphics/fbcon/cursor_blink
+
     chvt 1
 
     echo "."
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 27cf9c0..0d62367 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r23"
+PR = "r24"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.7.9.5


