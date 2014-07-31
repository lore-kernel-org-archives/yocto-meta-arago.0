Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 4A0AE52972
	for <meta-arago@arago-project.org>;
	Thu, 31 Jul 2014 18:45:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9L00G7IARFV601@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Jul 2014 13:45:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 269A02001F; Thu,
	31 Jul 2014 14:45:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Jul 2014 14:45:07 -0400
Message-id: <1406832307-7965-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C6E9C1D@DFLE08.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C6E9C1D@DFLE08.ent.ti.com>
Subject: [PATCH v2 06/11] matrix-gui: run on top of Wayland and Qt5
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
X-List-Received-Date: Thu, 31 Jul 2014 18:45:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/matrix/matrix-gui/init-qt5        | 66 ++++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          | 11 ++--
 2 files changed, 73 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5 b/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
new file mode 100644
index 0000000..6286028
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
@@ -0,0 +1,66 @@
+#! /bin/sh
+
+matrixgui="/usr/bin/matrix_browser"
+ROTATION=__MATRIX_ROT__
+GUI_OPTS="http://localhost:80/"
+PIDFILE="/var/run/matrix-gui-2.0.pid"
+
+test -x "$matrixgui" || exit 0
+
+export TSLIB_TSDEVICE=/dev/input/touchscreen0
+export QWS_MOUSE_PROTO=Auto
+export QT_QPA_PLATFORM=wayland
+export XDG_RUNTIME_DIR=/run/user/root
+export WAYLAND_DISPLAY=wayland-0
+
+case "$1" in
+  start)
+#    chvt 4
+
+    # ARM9 devices get a lot of alignment trap errors with the current
+    # version of Qt (4.7.2) that we use.  The printing of these messages
+    # is causing a severe slowdown with matrix and other Qt applications
+    # that matrix launches.  The root cause is under investigation and an
+    # issue is being filed in the Qt JIRA tracker.  For now using the
+    # following command will do a software fixup of the alignment trap errors
+    # in the kernel.  This should have no impact on cortex-A8 devices.
+    echo 2 > /proc/cpu/alignment
+
+    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
+    if [ -e /dev/input/touchscreen0 ]
+    then
+        export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+    fi
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
+    echo -n "Starting Matrix GUI application"
+    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE --exec $matrixgui -- $GUI_OPTS
+    echo "."
+    ;;
+
+  stop)
+    echo -n "Stopping Matrix GUI application"
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 523cfe1..4cba926 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r16"
+PR = "r17"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -20,12 +20,15 @@ SRCREV = "d0fcc5ab50c9ecdf7a3cc5610807d16a6c91a850"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://init \
+           file://init-qt5 \
            file://php.ini"
 
 require matrix-gui-paths.inc
 
 S = "${WORKDIR}/git"
 
+INITFILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'init-qt5', 'init', d)}"
+
 MATRIX_ROT = ""
 MATRIX_ROT_am37x-evm = "-display transformed:Rot90"
 
@@ -38,13 +41,13 @@ do_install(){
 	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
 
 	# Set the proper path in the init script
-	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/init
-	sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/" ${WORKDIR}/init
+	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/${INITFILE}
+	sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/" ${WORKDIR}/${INITFILE}
 
 	# Install the init script
 	# TODO: replace init script with systemd files
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
+	install -m 0755 ${WORKDIR}/${INITFILE} ${D}${sysconfdir}/init.d/matrix-gui-2.0
 }
 
 GUIDEPS = "matrix-gui-browser refresh-screen"
-- 
2.0.2


