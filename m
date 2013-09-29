Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id A6A3652A6D
	for <meta-arago@arago-project.org>;
	Sun, 29 Sep 2013 02:47:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTV005ZD92F3V20@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 28 Sep 2013 21:47:18 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 026EC2008E; Sat,
	28 Sep 2013 22:47:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 28 Sep 2013 22:47:02 -0400
Message-id: <1380422822-27650-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] branding-core: temporarily disable "sgx" for ti33x on 3.12 builds
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
X-List-Received-Date: Sun, 29 Sep 2013 02:47:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index b1ae89b..3850434 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -4,3 +4,7 @@
 # Please avoid creating multiple versions of the same brand, if possible
 # The policy is for the "Core" brand to be the default,
 # hence this file is mostly empty and used as a template
+
+# Temporarily disable "sgx" machine feature for ti33x SOC while building
+# latest 3.12 integration kernel, until Graphics SDK catches up
+MACHINE_FEATURES_ti33x := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-- 
1.8.3.2


