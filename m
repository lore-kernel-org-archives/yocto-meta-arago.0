Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 2EDAB52A59
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 19:19:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJK00CRLLO88900@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 10 Feb 2015 13:19:20 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=I4zSn2kl c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=0uncoVMVup48fduu7eAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BD5C720015;	Tue,
	10 Feb 2015 14:19:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 10 Feb 2015 14:19:19 -0500
Message-id: <1423595959-23271-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-image, packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES, sans server
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
X-List-Received-Date: Tue, 10 Feb 2015 19:19:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
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
index 704e840..c291a42 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 inherit packagegroup
 
@@ -12,7 +12,6 @@ RDEPENDS_${PN} = "\
     libpcre \
     iptables \
     iperf \
-    psplash \
     arago-gpl-notice \
     nfs-utils-client \
     "
-- 
2.2.0


