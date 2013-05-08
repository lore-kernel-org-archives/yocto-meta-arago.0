Return-Path: <a0756824@ares-ubuntu>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0FF5B529D4
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 00:28:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r480SExS000800
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:28:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r480SE4u006205
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:28:14 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 19:28:13 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r480SDBv017913;	Tue, 7 May 2013 19:28:14 -0500
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1UZsEv-0003lf-Np;
	Tue, 07 May 2013 20:28:13 -0400
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 May 2013 20:28:10 -0400
Message-ID: <1367972890-14439-4-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367972890-14439-1-git-send-email-sajesh@ti.com>
References: <1367972890-14439-1-git-send-email-sajesh@ti.com>
MIME-Version: 1.0
Subject: [PATCH] update to run lad at bootup
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
X-List-Received-Date: Wed, 08 May 2013 00:28:15 -0000
Content-Type: text/plain

---
 .../recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb           |   16 ++++++++++---
 .../recipes-bsp/ti-ipc/tiipclad-daemon.sh          |   24 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100755 meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh

diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
index d127020..92f54c0 100644
--- a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
+++ b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
@@ -12,12 +12,12 @@ SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 TARGET_PLATFORM = "tci6638"
 
-PR = "r19"
+PR = "r21"
 
 BRANCH ?= "master"
 SRCREV = "3.00.00.16_eng"
 
-SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} file://tiipclad-daemon.sh"
 
 S = "${WORKDIR}/git"
 
@@ -33,4 +33,14 @@ FILES_${PN}-test = "${bindir}/NameServerApp_${TARGET_PLATFORM} \
 					${bindir}/MessageQBench_${TARGET_PLATFORM} \
 					${bindir}/ping_rpmsg"
 
-inherit autotools
\ No newline at end of file
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


