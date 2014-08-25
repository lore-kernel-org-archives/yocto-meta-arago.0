Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id A458F52A6B
	for <meta-arago@arago-project.org>;
	Mon, 25 Aug 2014 19:06:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAV00LEUMDPGXJ0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Aug 2014 14:05:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4D74D2001F; Mon,
	25 Aug 2014 15:05:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Aug 2014 15:05:48 -0400
Message-id: <1408993548-4304-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] tslib: fix "unable to login" issue
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
X-List-Received-Date: Mon, 25 Aug 2014 19:06:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Scripts in /etc/profile.d/* are being sourced, not executed, so they can't
contain "exit" commands, otherwise the entire login session exits!

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/tslib/files/tslib.sh          | 22 ++++++++++------------
 .../recipes-graphics/tslib/tslib_1.1.bbappend      |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh b/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh
index f22ec9c..c80c946 100644
--- a/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh
+++ b/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh
@@ -2,16 +2,14 @@
 
 ### Touchscreen Environment Variables ###
 
-if [ ! -e /dev/input/touchscreen0 ]; then
-    exit
-fi
-
-export TSLIB_TSDEVICE=/dev/input/touchscreen0
-
-mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
-if [ "$?" = "0" ]
-then
-    export TSLIB_CALIBFILE=/run/media/mmcblk0p1/pointercal
-else
-    export TSLIB_CALIBFILE=/etc/pointercal
+if [ -e /dev/input/touchscreen0 ]; then
+    export TSLIB_TSDEVICE=/dev/input/touchscreen0
+
+    mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
+    if [ "$?" = "0" ]
+    then
+        export TSLIB_CALIBFILE=/run/media/mmcblk0p1/pointercal
+    else
+        export TSLIB_CALIBFILE=/etc/pointercal
+    fi
 fi
diff --git a/meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend b/meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend
index 875218d..e3b3b38 100644
--- a/meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend
+++ b/meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
2.0.4


