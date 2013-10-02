Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 8DAAA52998
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 21:20:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MU200MXK8KVYJ21@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 02 Oct 2013 16:19:58 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F3BA120011; Wed,
	02 Oct 2013 17:19:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 02 Oct 2013 17:19:29 -0400
Message-id: <1380748769-17507-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2 1/3] run-opentest: handle kernel images in zImage in addition to uImage format
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
X-List-Received-Date: Wed, 02 Oct 2013 21:20:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - fix passing not expanded [uz]Image to opentest

 lib/run-opentest |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index d3a04f3..71f9b96 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -170,9 +170,16 @@ run_target_side_test() {
         return 1
     fi
 
-    if [ -f $test_dir/temp/board-support/prebuilt-images/uImage-$m.bin ]
+    if [ -f $test_dir/temp/board-support/prebuilt-images/[uz]Image-$m.bin ]
     then
-        kernel=$test_dir/temp/board-support/prebuilt-images/uImage-$m.bin
+        if [ -f $test_dir/temp/board-support/prebuilt-images/zImage-$m.bin ]
+        then
+            kernel=$test_dir/temp/board-support/prebuilt-images/zImage-$m.bin
+        elif [ -f $test_dir/temp/board-support/prebuilt-images/uImage-$m.bin ]
+        then
+            kernel=$test_dir/temp/board-support/prebuilt-images/uImage-$m.bin
+        fi
+
         if [ "$odtb" ]
         then
             dtb="~dtb=$test_dir/temp/board-support/prebuilt-images/$odtb"
-- 
1.7.9.5


