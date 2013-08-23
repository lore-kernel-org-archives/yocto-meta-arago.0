Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 47235529E8
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 21:04:01 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS0002FW566DU60@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 Aug 2013 16:03:42 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 295EC2009D; Fri,
	23 Aug 2013 17:03:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 Aug 2013 17:03:37 -0400
Message-id: <1377291818-28047-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION and AUTOREV
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
X-List-Received-Date: Fri, 23 Aug 2013 21:04:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - removed the comment about upstreaming LOCALVERSION, may not happen

 .../recipes-kernel/linux/linux-ti-staging_git.bbappend  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
new file mode 100644
index 0000000..f99482c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
@@ -0,0 +1,17 @@
+MACHINE_KERNEL_PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+require copy-defconfig.inc
+
+SRCREV = "${AUTOREV}"
+
+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
+
+kernel_do_configure_prepend() {
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+    fi
+}
-- 
1.8.3.2


