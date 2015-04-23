Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 18A1352A0D
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2015 12:08:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NC8vxV027911
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 07:08:57 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NC8unV031338
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 07:08:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 07:08:56 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NC8uTH025986;
	Thu, 23 Apr 2015 07:08:56 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YlFw8-0005Bf-Ce;
	Thu, 23 Apr 2015 08:08:56 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Apr 2015 08:08:52 -0400
Message-ID: <1429790932-19909-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-uenv, am57xx-evm: Set default dtb to am57xx-evm.dtb
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
X-List-Received-Date: Thu, 23 Apr 2015 12:08:59 -0000
Content-Type: text/plain

* This device tree supports display on either LCD or HDMI.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb         |    2 +-
 .../tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt      |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index e67ea97..542cdb2 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
     file://uEnv.txt \
 "
 
-PR = "r0"
+PR = "r1"
 PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt
new file mode 100644
index 0000000..a082e1d
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt
@@ -0,0 +1,10 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
+fdtfile=am57xx-evm.dtb
-- 
1.7.9.5


