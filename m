Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C659752972
	for <meta-arago@arago-project.org>;
	Sun,  3 Aug 2014 20:44:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R004FL0AD1DX0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 03 Aug 2014 15:44:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 21EAB20531; Sat,
	02 Aug 2014 21:10:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Aug 2014 21:10:17 -0400
Message-id: <1407028221-9762-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH 1/5] base-files: update fstab with recent fstype changes, mount /run
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
X-List-Received-Date: Sun, 03 Aug 2014 20:44:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to mount /run early on now (which replaced /var/run) and due to the
order of udev startup, otherwise it won't be able to create control socket

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/base-files/base-files/fstab          | 6 +++---
 .../recipes-core/base-files/base-files_3.0.14.bbappend              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/meta-arago-distro/recipes-core/base-files/base-files/fstab
index 388de68..9ed6f33 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
+++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
@@ -1,11 +1,11 @@
 # stock fstab - you probably want to override this with a machine specific one
 
-rootfs               /                    auto       defaults              1  1
+/dev/root            /                    auto       defaults              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
-usbfs                /proc/bus/usb        usbfs      defaults              0  0
+usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
+tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults,size=16M     0  0
-tmpfs                /dev/shm             tmpfs      mode=0777             0  0
 tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0
 
 # uncomment this if your device has a SD/MMC/Transflash slot
diff --git a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
index 8c65bd1..40b7722 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
-- 
2.0.2


