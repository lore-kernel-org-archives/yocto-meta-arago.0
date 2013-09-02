Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 1CA6B529CA
	for <meta-arago@arago-project.org>;
	Mon,  2 Sep 2013 21:35:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSI007DEPAK75U0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Sep 2013 16:35:23 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EFC9920011; Mon,
	02 Sep 2013 17:35:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Sep 2013 17:35:07 -0400
Message-id: <1378157707-15689-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] remove-net-rules: _remove is a new keyword now, sanitize the function name
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
X-List-Received-Date: Mon, 02 Sep 2013 21:35:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/remove-net-rules.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass b/meta-arago-distro/classes/remove-net-rules.bbclass
index fcad9c7..2764f7b 100644
--- a/meta-arago-distro/classes/remove-net-rules.bbclass
+++ b/meta-arago-distro/classes/remove-net-rules.bbclass
@@ -4,12 +4,11 @@
 # will allow moving SD cards between EVMs and similar boards such as
 # beaglebone and the EVM.
 
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_remove_net_rules;"
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_rm_net_rules;"
 
-rootfs_remove_net_rules () {
+rootfs_rm_net_rules () {
     if [ -e ${IMAGE_ROOTFS}/lib/udev/write_net_rules ]
     then
         rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
     fi
 }
-
-- 
1.8.3.2


