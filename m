Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 19928529A8
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 05:46:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTM00M9H814KJD4@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 24 Sep 2013 00:46:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 968F0200F4; Tue,
	24 Sep 2013 01:46:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 24 Sep 2013 01:46:10 -0400
Message-id: <1380001570-25248-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380001570-25248-1-git-send-email-denis@denix.org>
References: <1380001570-25248-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] tisdk-image.bbclass: adjust to handle zImage along with uImage kernels
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
X-List-Received-Date: Tue, 24 Sep 2013 05:46:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 4397a70..c365eaa 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -523,9 +523,9 @@ do_sdk_image () {
     fi
 
     # Copy the Kernel image if it exists
-    if [ -e ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ]
+    if [ -e ${DEPLOY_DIR_IMAGE}/[uz]Image-${MACHINE}.bin ]
     then
-        cp ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ${prebuilt_dir}/
+        cp ${DEPLOY_DIR_IMAGE}/[uz]Image-${MACHINE}.bin ${prebuilt_dir}/
     else
         echo "Could not find the Kernel image"
         return 1
@@ -539,7 +539,7 @@ do_sdk_image () {
     then
         for f in `find ${DEPLOY_DIR_IMAGE} -type l -name "*${DTB_FILTER}*.dtb"`
         do
-            dtb_file=`basename $f | sed s/uImage-//`
+            dtb_file=`basename $f | sed s/.Image-//`
             cp $f ${prebuilt_dir}/${dtb_file}
         done
     fi
-- 
1.8.3.2


