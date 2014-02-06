Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 258B0529BD
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 16:23:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0L00K5T1IECKC0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 06 Feb 2014 10:23:02 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E6135200AC; Thu,
	06 Feb 2014 11:23:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 06 Feb 2014 11:23:00 -0500
Message-id: <1391703780-26628-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] base-files: pre-create /run symlink to point to /var/run
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 16:23:03 -0000

Make it available on the first boot too, otherwise the first boot may fail
to automount SD card partitions. Normally, it gets created on the first
boot by volatiles init script and stays there on consecutive boots.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../recipes-core/base-files/base-files_3.0.14.bbappend        | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
index c0ab069..4d831fd 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -1,4 +1,13 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+# Pre-create /run symlink to point to /var/run at build time
+# This normally happens on first boot, but may be too late for automount,
+# which tries to create mount-points in /run
+# NOTE: This step is not required in Dora and up, due to reverse direction
+# of symlinking between /run and /var/run
+do_install_append () {
+	ln -sf /var/run ${D}/run
+}
-- 
1.8.3.2


