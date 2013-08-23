Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id B612252A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:17:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS000FV1307QI70@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 Aug 2013 15:16:55 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DBD7A20011; Fri,
	23 Aug 2013 16:16:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 Aug 2013 16:16:42 -0400
Message-id: <1377289002-20230-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1377289002-20230-1-git-send-email-denis@denix.org>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/4] u-boot-ti-staging: enable LOCALVERSION and AUTOREV
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
X-List-Received-Date: Fri, 23 Aug 2013 20:17:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend
new file mode 100644
index 0000000..754d625
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend
@@ -0,0 +1,15 @@
+PR_append = "-arago0"
+
+SRCREV = "${AUTOREV}"
+
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
+
+# the lines below can be removed once the U-Boot LOCALVERSION patches are merged
+# into the oe-core danny branch. Update: not coming to danny, wait for dylan.
+do_compile_prepend() {
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
+    fi
+}
-- 
1.8.3.2


