Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6A22652099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 14:39:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HEdPSf013631
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 09:39:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HEdO63026463
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 09:39:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 09:39:24 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HEdOXb006559;
	Tue, 17 Mar 2015 09:39:24 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YXseR-000316-Dp;
	Tue, 17 Mar 2015 10:39:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Mar 2015 10:39:21 -0400
Message-ID: <1426603161-11566-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui: Clear background when starting and stopping matrix.
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
X-List-Received-Date: Tue, 17 Mar 2015 14:39:26 -0000
Content-Type: text/plain

* Clearing the background is done by calling refresh_screen with the
  "background-black" argument.
* Always switch virtual terminals so that command prompt will be visible
  upon exiting matrix.
* Disable blinking cursor while matrix is running, re-enable when stopping
  matrix.
    - When using qt over eglfs, the blinking cursor will show through the
      gui.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui/init            |   10 +++++++++-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 +---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index 3ec0a55..9f0507f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -16,7 +16,7 @@ test -x "$matrixgui" || exit 0
 
 case "$1" in
   start)
-    __SWITCH_FOREGROUND_VT__
+    chvt 4
 
     #Clear out the the tmp and lock directory
     cd __MATRIX_WEB_DIR__
@@ -34,6 +34,9 @@ case "$1" in
       fi
     fi
 
+    echo 0 > /sys/class/graphics/fbcon/cursor_blink
+    refresh_screen "background-black"
+
     echo -n "Starting Matrix GUI application"
     start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE --exec $matrixgui -- $GUI_OPTS
     echo "."
@@ -42,6 +45,11 @@ case "$1" in
   stop)
     echo -n "Stopping Matrix GUI application"
     start-stop-daemon --stop --quiet --pidfile $PIDFILE
+
+    refresh_screen "background-black"
+    echo 1 > /sys/class/graphics/fbcon/cursor_blink
+    chvt 1
+
     echo "."
     ;;
   *)
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 1b61ff1..b4161ff 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r21"
+PR = "r22"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -27,7 +27,6 @@ require matrix-gui-paths.inc
 S = "${WORKDIR}/git"
 
 MATRIX_FLAGS = "${@base_conditional('QT_PROVIDER','qt5','','-qws',d)}"
-SWITCH_FOREGROUND_VT = "${@base_conditional('QT_PROVIDER','qt5','','chvt 4',d)}"
 do_install(){
 	install -d ${D}${MATRIX_BASE_DIR}
 	install -d ${D}${MATRIX_WEB_DIR}
@@ -39,7 +38,6 @@ do_install(){
 	# Set the proper path in the init script
 	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/init
 	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/init
-	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/init
 
 	# Install the init script
 	# TODO: replace init script with systemd files
-- 
1.7.9.5


