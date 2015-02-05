Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5642D52A4D
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 16:15:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15GFdDu028122
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 10:15:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15GFcxn024090
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 10:15:38 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 10:15:38 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t15GFb3s022934;	Thu, 5 Feb 2015 10:15:38 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Feb 2015 11:15:36 -0500
Message-ID: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] sysvinit: Changing default setting to add HWCLOCKACCESS=no
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
X-List-Received-Date: Thu, 05 Feb 2015 16:15:40 -0000
Content-Type: text/plain

- realtime clock is not commonly present and hence adding
  HWCLOCKACCESS=no
- Avoids error message if rc device not present

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/sysvinit/files/hwclock.rcS        |    2 ++
 .../sysvinit/sysvinit_2.88dsf.bbappend             |    9 +++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
 create mode 100644 meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend

diff --git a/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
new file mode 100644
index 0000000..3e26c20
--- /dev/null
+++ b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
@@ -0,0 +1,2 @@
+# This is to indicate hwclock is not supported
+HWCLOCKACCESS=no
diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
new file mode 100644
index 0000000..6e08c83
--- /dev/null
+++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
@@ -0,0 +1,9 @@
+PR_append = "-arago0"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+SRC_URI += "file://hwclock.rcS"
+do_install_append () {
+# Add hwclock configuration
+	cat ${WORKDIR}/hwclock.rcS >> ${D}${sysconfdir}/default/rcS
+}
-- 
1.7.9.5


