Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 4AF7B529A1
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 23:18:20 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eh20so199443obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 16:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mZ8Vqkgo2avLEZy9wVmrWkog+Q6ftND44froJnsU93k=;
	b=HMH44ju7c1y++YrlfSWxls9NGFu+hXyVyb/ngjkc3OB3epgMDgJM67z1sLyZIgEicZ
	2fkTFqPaXa+3iDCAq3bTZhRN7WqO/r+SS3/E1qvmzbdJbhnTKH6YsSXTFGJ/GckHnTwF
	Dgl5hDPJda+6GyZsCaDfrhRDGS/kR0nB7pCoG5xLJxFwEMe5ct38cqni7NTeslUDGNmY
	95zfRIL/GsYyhzeQAR5GyK8eIuasuRZMi8j6mlF9MenQadQ471BmAwvOHkOr3w0O/Izt
	WplEkafbs2hLa8yGfGk9BoxW3JDdIXRD3Zudj0NEga8/hZTSVA4yJa9LvfVTxBsIN30e
	8l0g==
Received: by 10.60.30.168 with SMTP id t8mr7811524oeh.89.1347059900130;
	Fri, 07 Sep 2012 16:18:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a6sm4768420oeh.1.2012.09.07.16.18.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 16:18:19 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 18:36:25 -0500
Message-Id: <1347060985-22177-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1347060985-22177-1-git-send-email-fcooper27jr@gmail.com>
References: <1347060985-22177-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2 v2] thttpd: Port arago changes
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
X-List-Received-Date: Fri, 07 Sep 2012 23:18:20 -0000

* Port changes from arago.
* Set the port used to 8080

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-core/tasks/task-arago-console.bb       |    5 +-
 .../recipes-extended/thttpd/thttpd/init            |   47 ++++++++++++++++++++
 .../recipes-extended/thttpd/thttpd_2.25b.bbappend  |    4 ++
 3 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/thttpd/thttpd/init
 create mode 100644 meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-console.bb b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
index db424c1..ecae770 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -57,8 +57,7 @@ ARAGO_SDK_PREREQ = "\
     jpeg \
     jpeg-tools \
     freetype \
-    lighttpd \
-    lighttpd-module-cgi \
+    thttpd \
     "
 
 ARAGO_CONSOLE = "\
diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd/init b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
new file mode 100644
index 0000000..1cfaa65
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
@@ -0,0 +1,47 @@
+#! /bin/sh 
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/thttpd and type
+# > update-rc.d thttpd defaults 60
+#
+
+
+thttpd=/usr/sbin/thttpd
+test -x "$thttpd" || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd 
+    ;;
+  restart)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
+    echo "."
+    echo -n "Waiting for thttpd to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend b/meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
new file mode 100644
index 0000000..c0ab069
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
@@ -0,0 +1,4 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
-- 
1.7.0.4


