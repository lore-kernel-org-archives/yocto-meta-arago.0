Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id CE7CB529B2
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 00:48:13 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0800JNKQ7ZFP60@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jan 2014 18:48:10 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9498520210; Thu,
	30 Jan 2014 19:47:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2014 19:47:58 -0500
Message-id: <1391129278-9755-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] oe-layertool-setup.sh: avoid == bashism
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
X-List-Received-Date: Fri, 31 Jan 2014 00:48:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Use POSIX "=" for comparison instead of bash "=="

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 oe-layertool-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index ab66ef3..91fb71a 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -742,7 +742,7 @@ EOM
     fi
 
     # If command line option was not set use the old dldir
-    if [ "x$dldir" == "x" ]
+    if [ "x$dldir" = "x" ]
     then
         dldir=$old_dldir
     fi
-- 
1.8.3.2


