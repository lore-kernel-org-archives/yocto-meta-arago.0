Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 534EE52A68
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 04:05:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0800IJ7ZD79RI1@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jan 2014 22:05:46 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E121020094; Thu,
	30 Jan 2014 23:05:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2014 23:05:28 -0500
Message-id: <1391141129-26736-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2 1/2] udev-extraconf: overlay mount.sh as is from oe-core/dylan
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
X-List-Received-Date: Fri, 31 Jan 2014 04:05:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

This will be modified to fix SD mounting issues.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - actually overlay it as .bbappend and not .bb

 .../recipes-core/udev/udev-extraconf/mount.sh      | 76 ++++++++++++++++++++++
 .../recipes-core/udev/udev-extraconf_1.0.bbappend  |  4 ++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
 create mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend

diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
new file mode 100644
index 0000000..d1419ed
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
@@ -0,0 +1,76 @@
+#!/bin/sh
+#
+# Called from udev
+#
+# Attempt to mount any added block devices and umount any removed devices
+
+
+MOUNT="/bin/mount"
+PMOUNT="/usr/bin/pmount"
+UMOUNT="/bin/umount"
+for line in `grep -v ^# /etc/udev/mount.blacklist`
+do
+	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
+	then
+		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
+		exit 0
+	fi
+done
+
+automount() {	
+	name="`basename "$DEVNAME"`"
+
+	! test -d "/media/$name" && mkdir -p "/media/$name"
+	# Silent util-linux's version of mounting auto
+	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
+	then
+		MOUNT="$MOUNT -o silent"
+	fi
+	
+	if ! $MOUNT -t auto $DEVNAME "/media/$name"
+	then
+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
+		rm_dir "/media/$name"
+	else
+		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
+		touch "/tmp/.automount-$name"
+	fi
+}
+	
+rm_dir() {
+	# We do not want to rm -r populated directories
+	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
+	then
+		! test -z "$1" && rm -r "$1"
+	else
+		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
+	fi
+}
+
+if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
+	if [ -x "$PMOUNT" ]; then
+		$PMOUNT $DEVNAME 2> /dev/null
+	elif [ -x $MOUNT ]; then
+    		$MOUNT $DEVNAME 2> /dev/null
+	fi
+	
+	# If the device isn't mounted at this point, it isn't
+	# configured in fstab (note the root filesystem can show up as
+	# /dev/root in /proc/mounts, so check the device number too)
+	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
+		grep -q "^$DEVNAME " /proc/mounts || automount
+	fi
+fi
+
+
+
+if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
+	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
+	do
+		$UMOUNT $mnt
+	done
+	
+	# Remove empty directories from auto-mounter
+	name="`basename "$DEVNAME"`"
+	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
+fi
diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
new file mode 100644
index 0000000..c0ab069
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
@@ -0,0 +1,4 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
-- 
1.8.3.2


