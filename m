Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 3B7CA5208C
	for <meta-arago@arago-project.org>;
	Mon,  3 Mar 2014 23:36:58 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1V004EJW9492M0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Mar 2014 17:36:42 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B30C420565; Mon,
	03 Mar 2014 18:36:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Mar 2014 18:36:19 -0500
Message-id: <1393889779-3995-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1393889779-3995-1-git-send-email-denis@denix.org>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH 5/5] arago-core-tisdk-dylan-puget: update to use new CLI
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
X-List-Received-Date: Mon, 03 Mar 2014 23:36:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-dylan-puget.txt
index f4ccb26..e24ab70 100644
--- a/configs/arago-core-tisdk-dylan-puget.txt
+++ b/configs/arago-core-tisdk-dylan-puget.txt
@@ -164,11 +164,11 @@ TEST_LOCAL_IFACE="eth1"
 
 # This variable contains the tarball name for the opentest CLI which is
 # required to do target side testing.
-OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
+OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
 
 # This variable specifies the IP address of the TEE to be used with OpenTest
 # Defaults to 128.247.105.11 if not set
-OPENTEST_TEE_IP="10.218.102.142"
+OPENTEST_TEE_IP="none"
 
 # This variable specifies the hardware capabilities to be used with OpenTest
 # Capabilities are separated by underscores, some excamples are here:
-- 
1.7.9.5


