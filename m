Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 910FC529E6
	for <meta-arago@arago-project.org>;
	Mon,  2 May 2016 16:51:20 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K004986SV12B0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 11:51:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=BoIP8E-Byk5kaewDEQsA:9
Received: by 100.15.86.14 with SMTP id 45ea7406; Mon, 02 May 2016 16:51:05 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C78D7161FCE;	Mon,
	2 May 2016 12:50:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 12:50:54 -0400
Message-id: <1462207854-4146-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] busybox: finally drop local copies of inetd files
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
X-List-Received-Date: Mon, 02 May 2016 16:51:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/busybox/busybox/inetd             | 33 ----------------------
 .../recipes-core/busybox/busybox/inetd.conf        | 20 -------------
 .../recipes-core/busybox/busybox_%.bbappend        |  7 +----
 3 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100755 meta-arago-distro/recipes-core/busybox/busybox/inetd
 delete mode 100644 meta-arago-distro/recipes-core/busybox/busybox/inetd.conf

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/inetd b/meta-arago-distro/recipes-core/busybox/busybox/inetd
deleted file mode 100755
index cf50bcd..0000000
--- a/meta-arago-distro/recipes-core/busybox/busybox/inetd
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/sh
-#
-# start/stop inetd super server.
-
-if ! [ -x /usr/sbin/inetd ]; then
-	exit 0
-fi
-
-case "$1" in
-    start)
-	echo -n "Starting internet superserver:"
-	echo -n " inetd" ; start-stop-daemon -S -x /usr/sbin/inetd > /dev/null
-	echo "."
-	;;
-    stop)
-	echo -n "Stopping internet superserver:"
-	echo -n " inetd" ; start-stop-daemon -K -x /usr/sbin/inetd > /dev/null
-	echo "."
-	;;
-    restart)
-	echo -n "Restarting internet superserver:"
-	echo -n " inetd "
-	killall -HUP inetd
-	echo "."
-	;;
-    *)
-	echo "Usage: /etc/init.d/inetd {start|stop|restart}"
-	exit 1
-	;;
-esac
-
-exit 0
-
diff --git a/meta-arago-distro/recipes-core/busybox/busybox/inetd.conf b/meta-arago-distro/recipes-core/busybox/busybox/inetd.conf
deleted file mode 100644
index b02fe85..0000000
--- a/meta-arago-distro/recipes-core/busybox/busybox/inetd.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-# /etc/inetd.conf:  see inetd(8) for further informations.
-#
-# Internet server configuration database
-#
-# If you want to disable an entry so it isn't touched during
-# package updates just comment it out with a single '#' character.
-#
-# <service_name> <sock_type> <proto> <flags> <user> <server_path> <args>
-#
-#:INTERNAL: Internal services
-#echo		stream	tcp	nowait	root	internal
-#echo		dgram	udp	wait	root	internal
-#chargen	stream	tcp	nowait	root	internal
-#chargen	dgram	udp	wait	root	internal
-#discard		stream	tcp	nowait	root	internal
-#discard		dgram	udp	wait	root	internal
-#daytime		stream	tcp	nowait	root	internal
-#daytime	dgram	udp	wait	root	internal
-#time		stream	tcp	nowait	root	internal
-#time		dgram	udp	wait	root	internal
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index d85bfc5..e70f579 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -1,9 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago19"
-
-SRC_URI += " \
-	file://inetd \
-	file://inetd.conf \
-"
+PR_append = "-arago20"
-- 
2.2.0


