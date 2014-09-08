Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 1C24552A6D
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 19:49:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBL00A78LPOK840@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 08 Sep 2014 14:49:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4228201AD; Mon,
	08 Sep 2014 15:49:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 08 Sep 2014 15:48:57 -0400
Message-id: <1410205737-7590-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1410205737-7590-1-git-send-email-denis@denix.org>
References: <1410205737-7590-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH 2/2] test-files: disable Qt4 specific test cases, may add Qt5 in the future
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
X-List-Received-Date: Mon, 08 Sep 2014 19:49:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 test-scripts/test-files/mandatory-oesdk-armv7a.txt | 2 +-
 test-scripts/test-files/mandatory-oesdk.txt        | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/test-scripts/test-files/mandatory-oesdk-armv7a.txt b/test-scripts/test-files/mandatory-oesdk-armv7a.txt
index 4931d1f..51832d3 100644
--- a/test-scripts/test-files/mandatory-oesdk-armv7a.txt
+++ b/test-scripts/test-files/mandatory-oesdk-armv7a.txt
@@ -1 +1 @@
-check_app.sh -a /usr/bin/qtopia/examples/animation/moveblocks/moveblocks -x
+#check_app.sh -a /usr/bin/qtopia/examples/animation/moveblocks/moveblocks -x
diff --git a/test-scripts/test-files/mandatory-oesdk.txt b/test-scripts/test-files/mandatory-oesdk.txt
index 91aece1..ac85a72 100644
--- a/test-scripts/test-files/mandatory-oesdk.txt
+++ b/test-scripts/test-files/mandatory-oesdk.txt
@@ -1,7 +1,7 @@
 check_app.sh -a runDhrystone
 check_app.sh -a runLinpack
 check_app.sh -a runWhetstone
-check_app.sh -a /usr/bin/qtopia/examples/widgets/calculator/calculator -x
-check_app.sh -a /usr/bin/qtopia/demos/deform/deform -x
-check_app.sh -a /usr/bin/qtopia/examples/animation/animatedtiles/animatedtiles -x
-check_app.sh -a /usr/bin/qtopia/examples/graphicsview/elasticnodes/elasticnodes -x
+#check_app.sh -a /usr/bin/qtopia/examples/widgets/calculator/calculator -x
+#check_app.sh -a /usr/bin/qtopia/demos/deform/deform -x
+#check_app.sh -a /usr/bin/qtopia/examples/animation/animatedtiles/animatedtiles -x
+#check_app.sh -a /usr/bin/qtopia/examples/graphicsview/elasticnodes/elasticnodes -x
-- 
2.0.4


