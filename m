Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 4946F52A8E
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:41:52 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00LSTRLR8E10@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=F1xPCRIlUnZjrs6lQjYA:9
Received: by 100.15.86.14 with SMTP id 68be6113; Fri, 01 Apr 2016 03:41:52 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 19AF0161F6B;	Thu,
	31 Mar 2016 23:41:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:39 -0400
Message-id: <1459482106-27723-20-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 19/26] HACK: weston-init: overlay locally due to REQUIRED_DISTRO_FEATURES = "opengl"
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
X-List-Received-Date: Fri, 01 Apr 2016 03:41:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to sort it out with upstream

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bb        | 28 ++++++++++
 .../recipes-graphics/wayland/weston-init/init      | 60 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             | 15 ++++++
 3 files changed, 103 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init.bb
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/init
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init.bb b/meta-arago-extras/recipes-graphics/wayland/weston-init.bb
new file mode 100644
index 0000000..a40f4b2
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+SRC_URI = "file://init \
+           file://weston.service"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}/${sysconfdir}/init.d
+	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+
+	install -d ${D}${systemd_system_unitdir}
+	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
+}
+
+inherit allarch update-rc.d distro_features_check systemd
+
+# rdepends on weston which depends on virtual/egl
+#REQUIRED_DISTRO_FEATURES = "opengl"
+
+RDEPENDS_${PN} = "weston kbd"
+
+INITSCRIPT_NAME = "weston"
+INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+
+SYSTEMD_SERVICE_${PN} = "weston.service"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/init b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
new file mode 100644
index 0000000..2e938f4
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
@@ -0,0 +1,60 @@
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
+if test -e /etc/default/weston ; then
+        . /etc/default/weston
+fi
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
+        openvt -s weston -- $OPTARGS
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
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service b/meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service
new file mode 100644
index 0000000..4f1f7ff
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Weston Wayland compositor startup
+RequiresMountsFor=/run
+
+[Service]
+User=root
+EnvironmentFile=-/etc/default/weston
+Environment="XDG_RUNTIME_DIR=/run/user/root"
+ExecStartPre=/bin/mkdir -p /run/user/root
+ExecStartPre=/bin/chmod 0700 /run/user/root
+ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
+
+[Install]
+WantedBy=multi-user.target
+
-- 
2.2.0


