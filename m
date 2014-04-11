Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 974C952972
	for <meta-arago@arago-project.org>;
	Fri, 11 Apr 2014 20:11:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3V00G5TUP97LE0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 11 Apr 2014 15:10:36 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5AB972036C; Fri,
	11 Apr 2014 16:10:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 11 Apr 2014 16:10:19 -0400
Message-id: <1397247019-15012-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
Subject: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: use tmp/deploy/images/machine/ structure
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
X-List-Received-Date: Fri, 11 Apr 2014 20:11:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

From Dora and up, images are deployed into corresponding machine subdirs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 8df9a5b..cff86e4 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -125,6 +125,12 @@ extract_sdk_image() {
         return 1
     fi
 
+    # prefer sdk_path/m, if exists - Dora and up
+    if [ -d $sdk_path/$m ]
+    then
+        sdk_path="$sdk_path/$m"
+    fi
+
 ################################################################################
 # SDK_FILTER variable is used to specify the SDK image produced by the build,
 # that includes bootloaders, kernel, rootfs, devkit and host tools.
-- 
1.7.9.5


