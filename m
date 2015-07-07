Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E6D1052987
	for <meta-arago@arago-project.org>;
	Tue,  7 Jul 2015 12:10:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67CAPMd013916
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 07:10:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67CAPUb003430
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 07:10:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 07:10:11 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67CAPGp014312;	Tue, 7 Jul 2015 07:10:25 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1ZCRhg-0001xA-PA;
	Tue, 07 Jul 2015 08:10:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Jul 2015 08:10:22 -0400
Message-ID: <1436271023-7478-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-uenv: Add uEnv.txt specific to am437x-evm.
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
X-List-Received-Date: Tue, 07 Jul 2015 12:10:26 -0000
Content-Type: text/plain

* This will append to bootargs to work around the DSS underrun errata
  by limiting the screen resolution for HDMI display.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb         |    2 +-
 .../tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt      |   13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 542cdb2..b290da7 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
     file://uEnv.txt \
 "
 
-PR = "r1"
+PR = "r2"
 PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt
new file mode 100644
index 0000000..89f89f0
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt
@@ -0,0 +1,13 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
+optargs=video=HDMI-A-1:800x600
+
+# Uncomment the following line to enable HDMI display and disable LCD display.
+#fdtfile=am437x-gp-evm-hdmi.dtb
-- 
1.7.9.5


