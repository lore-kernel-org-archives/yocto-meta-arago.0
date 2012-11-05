Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id F2A3A5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:21 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6kfqhy10z46Lt59f604F3jssVNwt13j36cXoqpf0TXQ=;
	b=WnXvtvQvzqmkY55Q/lYRSGfujdJjFUj5O26QyLd8/U9Q85kwqLzEfA+4riUDXmvpzx
	Vu0UMt4W9s0P/F/MQ//+bCkROE/ecQ511PoZlHIQV9Zw5uYD9Qn8TIVz/qZhAbOyhh3y
	0PYsgpPCZdI03lFvoy7eZz5IDlZx9jV0hLbwdkalNTPt1Wa5lYaznqa4KwODYy+0SKNM
	g/8ft3Xg4cHntTneu9V4X/0sFvo/mVBNmJ4e59Bu3WPCQ/S4UwvkhrvwnwY2fu4LmURu
	cIe6Xl6YMCOP6zmLANSB7HxfeX00u3wwByiWXh2/saTbn51rt5fI+W1PhKQMZnjzoeex
	5HXA==
Received: by 10.60.0.166 with SMTP id 6mr6605182oef.6.1352080461666;
	Sun, 04 Nov 2012 17:54:21 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:21 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:26 -0600
Message-Id: <1352080417-9792-29-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 31/42] netbase: Add arago custom init
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:22 -0000

* Custom init is based on a commit from classic oe:
  netbase/init: Do not run 'ifup -a' if root is network mounted.
  commit 26af5ed1db81d29a59eb93cd9860d246d8dfa6a2
* This change is being added to fix an issue discovered by nfs failures
  when opentest is trying to run tests.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/netbase/netbase/init              |   63 ++++++++++++++++++++
 .../recipes-core/netbase/netbase_4.47.bbappend     |    2 +-
 2 files changed, 64 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/netbase/netbase/init

diff --git a/meta-arago-distro/recipes-core/netbase/netbase/init b/meta-arago-distro/recipes-core/netbase/netbase/init
new file mode 100644
index 0000000..86aff88
--- /dev/null
+++ b/meta-arago-distro/recipes-core/netbase/netbase/init
@@ -0,0 +1,63 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides:          networking
+# Required-Start:    $local_fs mountvirtfs
+# Required-Stop:     $local_fs
+# Default-Start:     S
+# Default-Stop:      0 6
+# Short-Description: Raise network interfaces and configure them
+### END INIT INFO
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+
+if ! [ -x /sbin/ifup ]; then
+    exit 0
+fi
+
+case "$1" in
+    start)
+        if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts | 
+          grep -q "^/ nfs$"; then
+            echo "NOT configuring network interfaces: / is an NFS mount"
+        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |  
+          grep -q "^/ smbfs$"; then
+            echo "NOT configuring network interfaces: / is an SMB mount"
+	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
+          grep -qE '^(nfs|smbfs|ncp|coda)$'; then
+            echo "NOT configuring network interfaces: network shares still mounted."
+        else
+            echo -n "Configuring network interfaces... "
+            ifup -a
+	    echo "done."
+      fi
+	;;
+    stop)
+        if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts | 
+          grep -q "^/ nfs$"; then
+            echo "NOT deconfiguring network interfaces: / is an NFS mount"
+        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |  
+          grep -q "^/ smbfs$"; then
+            echo "NOT deconfiguring network interfaces: / is an SMB mount"
+	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
+          grep -qE '^(nfs|smbfs|ncp|coda)$'; then
+            echo "NOT deconfiguring network interfaces: network shares still mounted."
+        else
+            echo -n "Deconfiguring network interfaces... "
+            ifdown -a
+	    echo "done."
+        fi
+	;;
+    force-reload|restart)
+        echo -n "Reconfiguring network interfaces... "
+        ifdown -a
+        ifup -a
+	echo "done."
+	;;
+    *)
+	echo "Usage: /etc/init.d/networking {start|stop|restart|force-reload}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend b/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
index 997adf2..8c65bd1 100644
--- a/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
+++ b/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
-- 
1.7.0.4


