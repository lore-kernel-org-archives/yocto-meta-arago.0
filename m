Return-Path: <a0756824@ares-ubuntu>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4168752A48
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 23:17:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48NHG4K020619
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 18:17:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48NHG89005063
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 18:17:16 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 18:17:16 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r48NHG1l031927;	Wed, 8 May 2013 18:17:16 -0500
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1UaDbo-0008NI-1X;
	Wed, 08 May 2013 19:17:16 -0400
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 May 2013 19:17:14 -0400
Message-ID: <1368055034-32159-1-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ipc: add ipc 3.x support on tci6638 platform
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
X-List-Received-Date: Wed, 08 May 2013 23:17:17 -0000
Content-Type: text/plain

it had following additional features
- run name server as a daemon
- adds test images to separate package

Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
---
 .../recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb           |   46 ++++++++++++++++++++
 .../recipes-bsp/ti-ipc/tiipclad-daemon.sh          |   24 ++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
 create mode 100755 meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh

diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
new file mode 100644
index 0000000..92f54c0
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
@@ -0,0 +1,46 @@
+DESCRIPTION="This support the communication between processors \
+			in a multi-processor environment and communication to peripherals. \
+            This communication includes message passing, streams, and linked lists. \
+            These modules work transparently in both uni-processor and multi-processor \
+            configurations."
+
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+TARGET_PLATFORM = "tci6638"
+
+PR = "r21"
+
+BRANCH ?= "master"
+SRCREV = "3.00.00.16_eng"
+
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} file://tiipclad-daemon.sh"
+
+S = "${WORKDIR}/git"
+
+export PLATFORM = "${TARGET_PLATFORM}"
+
+export PARALLEL_MAKE = "-j 1"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/NameServerApp_${TARGET_PLATFORM} \
+					${bindir}/MessageQApp_${TARGET_PLATFORM} \
+					${bindir}/MessageQMulti_${TARGET_PLATFORM} \
+					${bindir}/MessageQBench_${TARGET_PLATFORM} \
+					${bindir}/ping_rpmsg"
+
+inherit autotools
+
+INITSCRIPT_NAME = "tiipclad-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
\ No newline at end of file
diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh b/meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh
new file mode 100755
index 0000000..54b3888
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+tiipclad_daemon=/usr/bin/lad_tci6638
+tiipclad_params=lad.txt
+
+test -x "$tiipclad_daemon" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting tiipclad daemon"
+    start-stop-daemon --start --quiet --exec $tiipclad_daemon $tiipclad_params
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping tiipclad daemon"
+    start-stop-daemon --stop --quiet --pidfile /var/run/tiipclad.pid
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/tiipclad-daemon.sh {start|stop}"
+    exit 1
+esac
+
+exit 0
-- 
1.7.9.5


