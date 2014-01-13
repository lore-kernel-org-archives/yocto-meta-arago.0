Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 31A7352986
	for <meta-arago@arago-project.org>;
	Mon, 13 Jan 2014 21:50:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZD00MOO0N8DZ00@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 13 Jan 2014 15:50:06 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1FEE220088; Mon,
	13 Jan 2014 16:49:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 13 Jan 2014 16:49:54 -0500
Message-id: <1389649794-6757-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] branding-bleeding: create special brand for experimenting
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
X-List-Received-Date: Mon, 13 Jan 2014 21:50:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Useful for testing unreleased components that are not yet accessible outside.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-bleeding.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
new file mode 100644
index 0000000..67f9f22
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -0,0 +1 @@
+# Special "bleeding" branding for experimenting and testing unreleased components
-- 
1.8.3.2


