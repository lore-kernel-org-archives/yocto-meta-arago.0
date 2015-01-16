Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B5932529A7
	for <meta-arago@arago-project.org>;
	Fri, 16 Jan 2015 02:01:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0G21kXq002242
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 20:01:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0G21kWm027765
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 20:01:46 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 Jan 2015 20:01:45 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0G21j4E027079;	Thu, 15 Jan 2015 20:01:45 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Jan 2015 21:01:43 -0500
Message-ID: <1421373703-13583-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] parse-ip: Add support for keystone platforms
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
X-List-Received-Date: Fri, 16 Jan 2015 02:01:56 -0000
Content-Type: text/plain

- Added separate script for keystone platforms
- Script parses ip and sends to uart, picked up by BMC and display on LCD screen

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-tisdk/parse-ip/parse-ip.bb             |   12 ++++---
 .../recipes-tisdk/parse-ip/parse-ip/init.keystone  |   37 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.keystone

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index f20db31..5353ac6 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -2,23 +2,27 @@ DESCRIPTION = "Script to parse ip address during boot and make it available to t
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "file://init"
+SRC_URI = "file://init \
+	   file://init.keystone"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}"
 
 INITSCRIPT_NAME = "parse-ip"
 INITSCRIPT_PARAMS = "defaults 98"
+INITSCRIPT_FILENAME = "init"
+
+INITSCRIPT_FILENAME_keystone = "init.keystone"
 
 inherit update-rc.d
 
 do_install() {
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
+    install -m 0755 ${WORKDIR}/${INITSCRIPT_FILENAME} ${D}${sysconfdir}/init.d/parse-ip
 }
 
 FILES_${PN} = "${sysconfdir}"
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.keystone b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.keystone
new file mode 100644
index 0000000..7ea199e
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init.keystone
@@ -0,0 +1,37 @@
+#*
+#* Copyright (C) 2012-2014 Texas Instruments Incorporated - http://www.ti.com/
+#*
+#*
+#*  Redistribution and use in source and binary forms, with or without
+#*  modification, are permitted provided that the following conditions
+#*  are met:
+#*
+#*    Redistributions of source code must retain the above copyright
+#*    notice, this list of conditions and the following disclaimer.
+#*
+#*    Redistributions in binary form must reproduce the above copyright
+#*    notice, this list of conditions and the following disclaimer in the
+#*    documentation and/or other materials provided with the
+#*    distribution.
+#*
+#*    Neither the name of Texas Instruments Incorporated nor the names of
+#*    its contributors may be used to endorse or promote products derived
+#*    from this software without specific prior written permission.
+#*
+
+#! /bin/sh
+
+case "$1" in
+    start )
+        echo '#>>>>> LCD 12' > ipaddr
+        echo 'IP Address:' >> ipaddr
+        cat ipaddr
+
+        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > ipaddr
+        cat ipaddr
+
+        sleep 1
+    ;;
+    stop )
+        exit 0;;
+esac
-- 
1.7.9.5


