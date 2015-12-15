Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id AA6D452A19
	for <meta-arago@arago-project.org>;
	Tue, 15 Dec 2015 21:01:47 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NZF009D23QAGZC0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 15 Dec 2015 15:01:23 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=M41mto2GcBdBzKQSPnMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AF651161D4B;	Tue,
	15 Dec 2015 16:01:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 15 Dec 2015 16:01:22 -0500
Message-id: <1450213282-20982-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ipsec-tools: mark as machine-specific due to kernel dependency
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
X-List-Received-Date: Tue, 15 Dec 2015 21:01:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend

diff --git a/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend b/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
new file mode 100644
index 0000000..1386a89
--- /dev/null
+++ b/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.2.0


