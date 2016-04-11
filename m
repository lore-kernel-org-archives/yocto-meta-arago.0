Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id CC9D452A16
	for <meta-arago@arago-project.org>;
	Mon, 11 Apr 2016 19:38:30 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5H00B5JIJRQM10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Apr 2016 14:38:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=VeTYMUeYZ30gC_BTH1MA:9
Received: by 100.15.86.14 with SMTP id 0a6d5a2e; Mon, 11 Apr 2016 19:38:15 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 58A0A161F91;	Mon,
	11 Apr 2016 15:38:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Apr 2016 15:38:13 -0400
Message-id: <1460403493-30083-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-image: fix for rootfs/image split in master, disable SW manifest for now
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
X-List-Received-Date: Mon, 11 Apr 2016 19:38:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

TI HTML SW manifest is disabled for now due to missing opkg info DB in devkit.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index a9bc0d2..632894f 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -1,4 +1,5 @@
 inherit rootfs_ipk
+inherit image
 inherit image_types
 
 # This defines the list of features that we want to include in the SDK
@@ -653,7 +654,6 @@ IMAGE_PREPROCESS_COMMAND += "tisdk_image_cleanup; "
 # to install a given list of packages using opkg.
 fakeroot python do_rootfs () {
     from oe.rootfs import create_rootfs
-    from oe.image import create_image
     from oe.manifest import create_manifest
 
     # generate the initial manifest
@@ -661,10 +661,18 @@ fakeroot python do_rootfs () {
 
     # generate rootfs
     create_rootfs(d)
+}
+
+fakeroot python do_image () {
+    from oe.utils import execute_pre_post_process
+
+    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
 
-    # generate final images
-    create_image(d)
+    execute_pre_post_process(d, pre_process_cmds)
 }
+do_image[dirs] = "${TOPDIR}"
+do_image[umask] = "022"
+addtask do_image after do_rootfs before do_build
 
 tisdk_image_setup () {
     set -x
@@ -816,7 +824,7 @@ tisdk_image_build () {
     fi
 
     # Create the TI software manifest
-    generate_sw_manifest
+#    generate_sw_manifest
 
     # Delete installed toolchain sdk since we need the toolchain sdk installer
     # not the extracted version
-- 
2.2.0


