Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id CB5A952A71
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 15:59:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9800DBZ4EVTB00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 24 Jul 2014 10:59:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CD8A22032C; Thu,
	24 Jul 2014 11:59:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 24 Jul 2014 11:59:14 -0400
Message-id: <1406217554-27757-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
Subject: [tisdk-build-scripts][PATCH] arago-core-tisdk-2014.08.00: use the right opentest CLI
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
X-List-Received-Date: Thu, 24 Jul 2014 15:59:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

TMC IP has changed and the old CLI uses the wrong one now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/arago-core-tisdk-2014.08.00.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
index 000f903..3b00504 100644
--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
@@ -164,7 +164,7 @@ TEST_LOCAL_IFACE=""
 
 # This variable contains the tarball name for the opentest CLI which is
 # required to do target side testing.
-OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
+OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
 
 # This variable specifies the IP address of the TEE to be used with OpenTest
 # Defaults to 128.247.105.11 if not set
-- 
2.0.2


