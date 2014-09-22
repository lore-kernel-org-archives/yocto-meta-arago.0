Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C133D529C2
	for <meta-arago@arago-project.org>;
	Mon, 22 Sep 2014 18:34:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCB00ALCFKWK2C0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 22 Sep 2014 13:34:09 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A70A9200AC; Mon,
	22 Sep 2014 14:34:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 22 Sep 2014 14:34:08 -0400
Message-id: <1411410848-20709-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] busybox: enable uuencode and uudecode utils
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
X-List-Received-Date: Mon, 22 Sep 2014 18:34:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig       | 4 ++--
 meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 6682328..69d7e5f 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -281,8 +281,8 @@ CONFIG_UNAME=y
 # CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_UNIQ=y
 CONFIG_USLEEP=y
-# CONFIG_UUDECODE is not set
-# CONFIG_UUENCODE is not set
+CONFIG_UUDECODE=y
+CONFIG_UUENCODE=y
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set
 CONFIG_WHOAMI=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
index bc8c837..0f49e64 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago12"
+PR_append = "-arago13"
 
 SRC_URI += " \
 	file://inetd \
-- 
2.0.4


