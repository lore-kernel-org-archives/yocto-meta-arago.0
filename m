Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7058052099
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 15:11:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JFBbgt029213
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 10:11:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JFBakN021918
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 10:11:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 10:11:36 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JFBYH2013099;
	Thu, 19 Mar 2015 10:11:35 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YYc6f-0005ou-Uu;
	Thu, 19 Mar 2015 11:11:34 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Mar 2015 11:11:31 -0400
Message-ID: <1426777891-22340-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] matrix-gui: Clear background when starting and stopping matrix.
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
X-List-Received-Date: Thu, 19 Mar 2015 15:11:38 -0000
Content-Type: text/plain

* Clearing the background is done by calling refresh_screen with the
  "background-black" argument.
* Switch virtual terminals so that command prompt will be visible upon
  exiting matrix.
* Disable blinking cursor while matrix is running, re-enable when stopping
  matrix.
    - When using qt over eglfs, the blinking cursor will show through the
      gui.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Create a seperate init script when using qt5 without wayland.

 .../recipes-core/matrix/matrix-gui/init.eglfs      |   60 ++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |   14 +++--
 2 files changed, 68 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
new file mode 100644
index 0000000..9f0507f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
@@ -0,0 +1,60 @@
+#! /bin/sh
+
+matrixgui="/usr/bin/matrix_browser"
+GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
+PIDFILE="/var/run/matrix-gui-2.0.pid"
+
+# Important System Environment Variables
+SCRIPTS=/etc/profile.d/*.sh
+
+for f in $SCRIPTS
+do
+    source $f
+done
+
+test -x "$matrixgui" || exit 0
+
+case "$1" in
+  start)
+    chvt 4
+
+    #Clear out the the tmp and lock directory
+    cd __MATRIX_WEB_DIR__
+    rm -rf tmp/*
+    rm -rf lock/*
+    cd -
+
+	if [ -e $PIDFILE ]; then
+      PIDDIR=/proc/$(cat $PIDFILE)
+      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${matrixgui}" ]; then
+        echo "$DESC already started; not starting."
+      else
+        echo "Removing stale PID file $PIDFILE."
+        rm -f $PIDFILE
+      fi
+    fi
+
+    echo 0 > /sys/class/graphics/fbcon/cursor_blink
+    refresh_screen "background-black"
+
+    echo -n "Starting Matrix GUI application"
+    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE --exec $matrixgui -- $GUI_OPTS
+    echo "."
+    ;;
+
+  stop)
+    echo -n "Stopping Matrix GUI application"
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
+
+    refresh_screen "background-black"
+    echo 1 > /sys/class/graphics/fbcon/cursor_blink
+    chvt 1
+
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 8843521..1874f85 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r22"
+PR = "r23"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -18,8 +18,10 @@ inherit update-rc.d
 BRANCH ?= "master"
 SRCREV = "d65a5e1d178bb30653f16322bebf7e7ee530d613"
 
+MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER','qt5', ${@base_contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d)}, 'init', d)}"
+
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=http;branch=${BRANCH} \
-           file://init \
+           file://${MATRIX_INITSCRIPT} \
            file://php.ini"
 
 require matrix-gui-paths.inc
@@ -37,14 +39,14 @@ do_install(){
 	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
 
 	# Set the proper path in the init script
-	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/init
-	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/init
-	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/init
+	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/${MATRIX_INITSCRIPT}
+	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MATRIX_INITSCRIPT}
+	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
 
 	# Install the init script
 	# TODO: replace init script with systemd files
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
+	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
 }
 
 GUIDEPS = "matrix-gui-browser refresh-screen"
-- 
1.7.9.5


