Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 9B6A252093
	for <meta-arago@arago-project.org>;
	Fri, 22 May 2015 21:13:53 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOR009VSSAJ8320@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 22 May 2015 16:13:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AawGxMSu c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=4Tuczek7E_QXW5c3oDIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B423020099;	Fri,
	22 May 2015 17:13:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 22 May 2015 17:13:31 -0400
Message-id: <1432329211-28195-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] oprofile: mark as machine-specific due to kernel deps
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
X-List-Received-Date: Fri, 22 May 2015 21:13:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Play it safe for now, as kernels between Sitara and Keystone could be
very different. Revisit this when kernels get unified.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-kernel/oprofile/oprofile_0.9.8.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/oprofile/oprofile_0.9.8.bbappend

diff --git a/meta-arago-distro/recipes-kernel/oprofile/oprofile_0.9.8.bbappend b/meta-arago-distro/recipes-kernel/oprofile/oprofile_0.9.8.bbappend
new file mode 100644
index 0000000..1386a89
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/oprofile/oprofile_0.9.8.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.2.0


