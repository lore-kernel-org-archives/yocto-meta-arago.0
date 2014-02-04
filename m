Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 44B75529B5
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2014 21:42:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0H00DL4QYCKQB0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 04 Feb 2014 15:42:22 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1FBC820086; Tue,
	04 Feb 2014 16:42:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 04 Feb 2014 16:42:11 -0500
Message-id: <1391550131-28566-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Tom Rini <trini@ti.com>, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCHv2 2/2] udev-extraconf: update mount.sh to use /run/media instead of /media
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
X-List-Received-Date: Tue, 04 Feb 2014 21:42:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is done to work around the issue of auto-mounting block devices
(i.e. SD cards) when root filesystem is still in read-only mode and
creating /media/<device> is not possible. That is due to udev getting
started earlier (/etc/rcS.d/S03udev) than checkroot gets a chance to
re-mount the rootfs as read-write (/etc/rcS.d/S10checkroot.sh).

Although, canonical FHS specifies /media/<device> as a mount point
for removable media devices, the latest 2.3 version was released in
2004 and since then FreeDesktop/udisks and other tools adopted the
new /run/media/<user>/<device> location. That was done to overcome
read-only rootfs limitation and avoid name-clash between users.

For our embedded systems environment we assume single-user operation
and hence simplify mount point to just /run/media/<device>.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>
Cc: Franklin S. Cooper Jr <fcooper@ti.com>
---
v2 - fix typo in FreeDesktop and Cc Tom and Franklin

 meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh  | 12 ++++++------
 .../recipes-core/udev/udev-extraconf_1.0.bbappend            |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
index d1419ed..0f436ca 100644
--- a/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
@@ -20,19 +20,19 @@ done
 automount() {	
 	name="`basename "$DEVNAME"`"
 
-	! test -d "/media/$name" && mkdir -p "/media/$name"
+	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
 	then
 		MOUNT="$MOUNT -o silent"
 	fi
 	
-	if ! $MOUNT -t auto $DEVNAME "/media/$name"
+	if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
 	then
-		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
-		rm_dir "/media/$name"
+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
+		rm_dir "/run/media/$name"
 	else
-		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
+		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
 		touch "/tmp/.automount-$name"
 	fi
 }
@@ -72,5 +72,5 @@ if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	
 	# Remove empty directories from auto-mounter
 	name="`basename "$DEVNAME"`"
-	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
+	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
 fi
diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
index c0ab069..997adf2 100644
--- a/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
+++ b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.8.3.2


