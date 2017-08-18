Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 11715529B0
	for <meta-arago@arago-project.org>;
	Fri, 18 Aug 2017 23:07:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7IN6nUE006652
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 18:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503097609;
	bh=tHxNcy4Z+pwQyIL+l6ZeIaMuynJMs0jmxvZwRZVJZ2s=;
	h=From:To:CC:Subject:Date;
	b=sHAtNbD6IPtnDgnteMJGJPu29su1n5EN398c7zLlBNl+kDeGI1SLBq2laYWQd4K7Y
	/8PvFkm5hRPyGOf3O+E0kWFAQk2kbjV18ZPECicKEX0pe2xPV205a8VE66ztmXJ3eF
	E0wDRgRn40FMLAVG9C/N3cW+FBdjBdI8pwcondzY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IN6iOY017605
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 18:06:44 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 18 Aug 2017 18:06:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 18 Aug 2017 18:06:44 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IN6iBS006132;
	Fri, 18 Aug 2017 18:06:44 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Aug 2017 19:06:39 -0400
Message-ID: <1503097599-5407-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] [PATCH v2] matrix-gui: update init scripts to execute /etc/profile.d/*.sh only when they exist
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
X-List-Received-Date: Fri, 18 Aug 2017 23:07:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 change: simplify the check as suggested by Denys

 recipes-core/matrix/matrix-gui/init         | 49 +++++++++++++++++++++++
 recipes-core/matrix/matrix-gui/init.eglfs   | 60 +++++++++++++++++++++++++++++
 recipes-core/matrix/matrix-gui_2.0.bbappend |  4 +-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/matrix/matrix-gui/init
 create mode 100644 recipes-core/matrix/matrix-gui/init.eglfs

diff --git a/recipes-core/matrix/matrix-gui/init b/recipes-core/matrix/matrix-gui/init
new file mode 100644
index 0000000..5124c38
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/init
@@ -0,0 +1,49 @@
+#! /bin/sh
+
+matrixgui="/usr/bin/matrix_browser"
+GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
+PIDFILE="/var/run/matrix-gui-2.0.pid"
+
+# Important System Environment Variables
+for sh in /etc/profile.d/*.sh ; do
+    [ -r "$sh" ] && . "$sh"
+done
+
+test -x "$matrixgui" || exit 0
+
+case "$1" in
+  start)
+    __SWITCH_FOREGROUND_VT__
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
diff --git a/recipes-core/matrix/matrix-gui/init.eglfs b/recipes-core/matrix/matrix-gui/init.eglfs
new file mode 100644
index 0000000..df07c05
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/init.eglfs
@@ -0,0 +1,60 @@
+#! /bin/sh
+
+matrixgui="/usr/bin/matrix_browser"
+GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
+PIDFILE="/var/run/matrix-gui-2.0.pid"
+
+# Important System Environment Variables
+for sh in /etc/profile.d/*.sh ; do
+    [ -r "$sh" ] && . "$sh"
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
+    echo -ne "\033[9;0]\033[14;0]" > /dev/tty4
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
+
+    echo -ne "\033[9;10]\033[14;10]" > /dev/tty4
+    echo 1 > /sys/class/graphics/fbcon/cursor_blink
+
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
diff --git a/recipes-core/matrix/matrix-gui_2.0.bbappend b/recipes-core/matrix/matrix-gui_2.0.bbappend
index 57f4e12..1cc5c0a 100644
--- a/recipes-core/matrix/matrix-gui_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui_2.0.bbappend
@@ -1,3 +1,5 @@
-PR_append = ".tisdk1"
+PR_append = ".tisdk2"
 
 SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.9.1


