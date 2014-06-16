Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 1E49A529D8
	for <meta-arago@arago-project.org>;
	Mon, 16 Jun 2014 22:19:37 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7A002618NVOH20@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Jun 2014 17:19:18 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AFEB620182; Mon,
	16 Jun 2014 18:19:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Jun 2014 18:19:07 -0400
Message-id: <1402957147-15244-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: am437x-evm has different name in OpenTest
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
X-List-Received-Date: Mon, 16 Jun 2014 22:19:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Actually, OpenTest has 2 variants - am43xx-gpevm and am43xx-epos, use first for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index 9a8e45b..a64e4cc 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -5,9 +5,12 @@ set_opentest_platform() {
     machine="$1"
 
     case $machine in
-        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|am335x-evm|am437x-evm|omap5-evm|dra7xx-evm )
+        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|am335x-evm|omap5-evm|dra7xx-evm )
             oplatform=$machine
             ;;
+        am437x-evm )
+            oplatform="am43xx-gpevm"
+            ;;
         * )
             return 2
             ;;
-- 
1.7.9.5


