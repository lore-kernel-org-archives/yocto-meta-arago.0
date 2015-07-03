Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id BB1C052A4E
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00LO35RR5G20@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:16 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=5x3K_6Qp14Wihgqgx5oA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 133A3161AC8;	Thu,
	2 Jul 2015 23:02:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:25 -0400
Message-id: <1435892533-6046-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 06/54] udev-extraconf: fix accepted upstream, remove locally
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/udev/udev-extraconf/mount.sh      | 76 ----------------------
 .../recipes-core/udev/udev-extraconf_1.0.bbappend  |  4 --
 2 files changed, 80 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend

diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
deleted file mode 100644
index 0f436ca..0000000
--- a/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/sh
-#
-# Called from udev
-#
-# Attempt to mount any added block devices and umount any removed devices
-
-
-MOUNT="/bin/mount"
-PMOUNT="/usr/bin/pmount"
-UMOUNT="/bin/umount"
-for line in `grep -v ^# /etc/udev/mount.blacklist`
-do
-	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
-	then
-		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
-		exit 0
-	fi
-done
-
-automount() {	
-	name="`basename "$DEVNAME"`"
-
-	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
-	# Silent util-linux's version of mounting auto
-	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
-	then
-		MOUNT="$MOUNT -o silent"
-	fi
-	
-	if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
-	then
-		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
-		rm_dir "/run/media/$name"
-	else
-		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
-		touch "/tmp/.automount-$name"
-	fi
-}
-	
-rm_dir() {
-	# We do not want to rm -r populated directories
-	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
-	then
-		! test -z "$1" && rm -r "$1"
-	else
-		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
-	fi
-}
-
-if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
-	if [ -x "$PMOUNT" ]; then
-		$PMOUNT $DEVNAME 2> /dev/null
-	elif [ -x $MOUNT ]; then
-    		$MOUNT $DEVNAME 2> /dev/null
-	fi
-	
-	# If the device isn't mounted at this point, it isn't
-	# configured in fstab (note the root filesystem can show up as
-	# /dev/root in /proc/mounts, so check the device number too)
-	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
-		grep -q "^$DEVNAME " /proc/mounts || automount
-	fi
-fi
-
-
-
-if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
-	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
-	do
-		$UMOUNT $mnt
-	done
-	
-	# Remove empty directories from auto-mounter
-	name="`basename "$DEVNAME"`"
-	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
-fi
diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
deleted file mode 100644
index 997adf2..0000000
--- a/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago1"
-- 
2.2.0


