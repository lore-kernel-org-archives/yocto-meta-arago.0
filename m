Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2FFDC52A6D
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 18:19:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EIJIIQ018201
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 13:19:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EIJIFt015133
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 13:19:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 13:19:17 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7EIJGgc027383;	Thu, 14 Aug 2014 13:19:17 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7EIJCJI013320;	Thu, 14 Aug 2014 23:49:15 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Aug 2014 13:19:09 -0500
Message-ID: <1408040350-30527-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408040350-30527-1-git-send-email-fcooper@ti.com>
References: <1408040350-30527-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] weston-init: Pull in init from oe-core
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
X-List-Received-Date: Thu, 14 Aug 2014 18:19:20 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* This init will be later tweaked.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend  |    3 ++
 .../recipes-graphics/wayland/weston-init/init      |   56 ++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/init

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
new file mode 100644
index 0000000..6e18371
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/init b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
new file mode 100644
index 0000000..8e662e0
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: weston
+# Required-Start: $local_fs $remote_fs
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+killproc() {
+        pid=`/bin/pidof $1`
+        [ "$pid" != "" ] && kill $pid
+}
+
+read CMDLINE < /proc/cmdline
+for x in $CMDLINE; do
+        case $x in
+        weston=false)
+		echo "Weston disabled"
+		exit 0;
+                ;;
+        esac
+done
+
+case "$1" in
+  start)
+        . /etc/profile
+
+        # This is all a nasty hack
+        if test -z "$XDG_RUNTIME_DIR"; then
+                export XDG_RUNTIME_DIR=/run/user/root
+                mkdir --parents $XDG_RUNTIME_DIR
+                chmod 0700 $XDG_RUNTIME_DIR
+        fi
+
+        openvt -s weston
+  ;;
+
+  stop)
+        echo "Stopping Weston"
+        killproc weston
+  ;;
+
+  restart)
+	$0 stop
+        sleep 1
+        $0 start
+  ;;
+
+  *)
+        echo "usage: $0 { start | stop | restart }"
+  ;;
+esac
+
+exit 0
-- 
1.7.9.5


