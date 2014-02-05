Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 766FA529D2
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 17:18:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J00AUH9DZPFM0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 05 Feb 2014 11:18:00 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 93A3A201BF; Wed,
	05 Feb 2014 12:17:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 05 Feb 2014 12:17:59 -0500
Message-id: <1391620679-4518-1-git-send-email-denis@denix.org>
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
X-List-Received-Date: Wed, 05 Feb 2014 17:18:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Make it available on the first boot too, otherwise the first boot may fail
to automount SD card partitions. Normally, it gets created on the first
boot by volatiles init script and stays there on consecutive boots.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
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


