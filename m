Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id DF8EF529DA
	for <meta-arago@arago-project.org>;
	Sat, 21 Mar 2015 00:11:47 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLJ00F25CJCXPC0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Mar 2015 19:11:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Pd9IXZlY c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=z5MGr5SgWUw8JYmnKzYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5BA3E200EF;	Fri,
	20 Mar 2015 20:11:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Mar 2015 20:11:35 -0400
Message-id: <1426896696-19843-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] thermal-init: init script to enable thermal zones
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
X-List-Received-Date: Sat, 21 Mar 2015 00:11:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/thermal-init/thermal-init.bb         | 19 +++++++++++++++++++
 .../recipes-core/thermal-init/thermal-init/init       | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
 create mode 100644 meta-arago-distro/recipes-core/thermal-init/thermal-init/init

diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
new file mode 100644
index 0000000..e564b1e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Init script to enable cpu_thermal zones"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+PR = "r0"
+
+SRC_URI = "file://init"
+
+INITSCRIPT_NAME = "thermal-zone-init"
+INITSCRIPT_PARAMS = "defaults 98"
+
+inherit update-rc.d
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
+
+FILES_${PN} = "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init/init b/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
new file mode 100644
index 0000000..15fdeac
--- /dev/null
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+case "$1" in
+    start )
+        echo "Enabling thermal zones..."
+        for i in /sys/class/thermal/thermal_zone*/mode; do
+            echo enabled > $i
+        done
+    ;;
+    stop )
+        echo "Disabling thermal zones..."
+        for i in /sys/class/thermal/thermal_zone*/mode; do
+            echo disabled > $i
+        done
+    ;;
+esac
+
+exit 0
-- 
2.2.0


