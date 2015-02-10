Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 823EB52AA6
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 19:58:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJK008L0NGFGJ60@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 10 Feb 2015 13:57:52 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=PYxIXZlY c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=0uncoVMVup48fduu7eAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4318A20030;	Tue,
	10 Feb 2015 14:57:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 10 Feb 2015 14:57:50 -0500
Message-id: <1423598270-30922-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] arago-image, packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES, sans server
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
X-List-Received-Date: Tue, 10 Feb 2015 19:58:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - rebase against recent master

 meta-arago-distro/recipes-core/images/arago-image.inc                  | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb     | 2 ++
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb        | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 98af6c3..977ce8f 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -3,7 +3,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-IMAGE_FEATURES += "package-management"
+IMAGE_FEATURES += "package-management splash"
 
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD_ext2.gz += "-i 4096"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index e5ce2b5..908325f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -3,6 +3,8 @@ COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|keystone"
 
 require arago-image.inc
 
+SPLASH = ""
+
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 7652622..0e8960f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 inherit packagegroup
 
@@ -12,7 +12,6 @@ RDEPENDS_${PN} = "\
     libpcre \
     iptables \
     iperf \
-    psplash \
     arago-gpl-notice \
     arago-feed-config \
     nfs-utils-client \
-- 
2.2.0


