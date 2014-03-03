Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0A0085208C
	for <meta-arago@arago-project.org>;
	Mon,  3 Mar 2014 20:52:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s23KqSjC009745
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 14:52:28 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s23KqRLT010797
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 14:52:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 14:52:27 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s23KqRdL032693;	Mon, 3 Mar 2014 14:52:27 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Mar 2014 15:52:25 -0500
Message-ID: <1393879945-11703-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] initscripts: Add mkdir debugfs and mount
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
X-List-Received-Date: Mon, 03 Mar 2014 20:52:29 -0000
Content-Type: text/plain

- Add script to create /debug directory and mount debugfs

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/initscripts/files/debugfs.sh      |    8 ++++++++
 .../initscripts/initscripts_1.0.bbappend           |    8 ++++++++
 2 files changed, 16 insertions(+)
 create mode 100755 meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
 create mode 100644 meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend

diff --git a/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh b/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
new file mode 100755
index 0000000..17e2474
--- /dev/null
+++ b/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+if ! [ -e /debug ] ; then
+  mkdir -p /debug
+fi
+mount -t debugfs debugfs /debug
+
+exit 0
diff --git a/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
new file mode 100644
index 0000000..1d78ab3
--- /dev/null
+++ b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS_append := "${THISDIR}/files"
+
+SRC_URI += "file://debugfs.sh"
+
+do_install_append () {
+	install -c -m 755 ${WORKDIR}/debugfs.sh ${D}${sysconfdir}/init.d/debugfs.sh
+	update-rc.d -r ${D} devpts.sh start 09 S .
+}
-- 
1.7.9.5


