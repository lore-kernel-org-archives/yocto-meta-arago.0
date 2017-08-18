Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E5A455297F
	for <meta-arago@arago-project.org>;
	Fri, 18 Aug 2017 18:41:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7IIfV1N015826
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 13:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503081691;
	bh=xGqJQMCqioGheubJTWSqSNSYPA2XjnGiDI3NZk0RJzE=;
	h=From:To:CC:Subject:Date;
	b=ENASK0EgXk8YVDZrMPhZXhboR9QOFMzjC2XpwuLq5KfgAVPfl+r+4z1EgMDum1ypg
	XNjY1SlCy74JJTXwqiRrP1I/0+9qVpnKjr1Fs2+J10aRmoUJ4nlm5l3y7jbR+JtT2V
	kNIK+KoXxDGzpO3O11cuT/u6h9cWvjoHVq+EvRPU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IIfVnV018008
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 13:41:31 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 18 Aug 2017 13:41:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 18 Aug 2017 13:41:31 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IIfUNY008359;
	Fri, 18 Aug 2017 13:41:30 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Aug 2017 14:41:24 -0400
Message-ID: <1503081684-3935-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] [PATCH] matrix-gui: update init scripts to execute /etc/profile.d/*.sh only when they exist
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
X-List-Received-Date: Fri, 18 Aug 2017 18:41:32 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-core/matrix/matrix-gui/init         | 56 ++++++++++++++++++++++++
 recipes-core/matrix/matrix-gui/init.eglfs   | 67 +++++++++++++++++++++++++++++
 recipes-core/matrix/matrix-gui_2.0.bbappend |  4 +-
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/matrix/matrix-gui/init
 create mode 100644 recipes-core/matrix/matrix-gui/init.eglfs

diff --git a/recipes-core/matrix/matrix-gui/init b/recipes-core/matrix/matrix-gui/init
new file mode 100644
index 0000000..0dd4bd3
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/init
@@ -0,0 +1,56 @@
+#! /bin/sh
+
+matrixgui="/usr/bin/matrix_browser"
+GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
+PIDFILE="/var/run/matrix-gui-2.0.pid"
+
+# Important System Environment Variables
+DIR=/etc/profile.d
+SCRIPTS=$DIR/*.sh
+
+if [ "$(ls -A $DIR)" ];
+then
+    for f in $SCRIPTS
+    do
+	source $f
+    done
+fi
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
index 0000000..f40a55e
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/init.eglfs
@@ -0,0 +1,67 @@
+#! /bin/sh
+
+matrixgui="/usr/bin/matrix_browser"
+GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
+PIDFILE="/var/run/matrix-gui-2.0.pid"
+
+# Important System Environment Variables
+DIR=/etc/profile.d
+SCRIPTS=$DIR/*.sh
+
+if [ "$(ls -A $DIR)" ];
+then
+    for f in $SCRIPTS
+    do
+	source $f
+    done
+fi
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


