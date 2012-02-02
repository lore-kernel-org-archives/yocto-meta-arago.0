Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0FB2D52978
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2012 15:19:42 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q12FJeWo023541
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 09:19:40 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12FJcIc019710
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 20:49:39 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 2 Feb 2012 20:49:38 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12FJaYV016016;
	Thu, 2 Feb 2012 20:49:37 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2012 09:19:33 -0600
Message-ID: <1328195973-29006-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] initscript-telnetd: port from old arago overlay
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
X-List-Received-Date: Thu, 02 Feb 2012 15:19:44 -0000
Content-Type: text/plain

* Ported the initscript for telnetd from the old arago overlay
  until this can be convered to a systemd script.
* telnet is still used and supported by our SDKs
* Modified the S variable to make the LICENSE_FILE_CHKSUM setting
  easier and used ${S} in the do_install function.
* Added the MIT license to the init file for checksum support

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../initscript-telnetd/initscript-telnetd.bb       |   18 +++++++++
 .../initscript-telnetd/initscript-telnetd/telnetd  |   40 ++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
 create mode 100644 meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd

diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
new file mode 100644
index 0000000..e987092
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Initscripts for telnetd"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://telnetd;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
+PR ="r0"
+
+SRC_URI = "file://telnetd"
+
+S = ${WORKDIR}
+
+INITSCRIPT_NAME = "telnetd"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/telnetd ${D}${sysconfdir}/init.d/telnetd
+}
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
new file mode 100644
index 0000000..116dd6d
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
@@ -0,0 +1,40 @@
+#! /bin/sh
+#Permission is hereby granted, free of charge, to any person obtaining a copy
+#of this software and associated documentation files (the "Software"), to deal
+#in the Software without restriction, including without limitation the rights
+#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#copies of the Software, and to permit persons to whom the Software is
+#furnished to do so, subject to the following conditions:
+#
+#The above copyright notice and this permission notice shall be included in
+#all copies or substantial portions of the Software.
+#
+#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#THE SOFTWARE.
+
+telnetd=/usr/sbin/telnetd
+
+test -x "$telnetd" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting telnet daemon"
+    start-stop-daemon --start --quiet --exec $telnetd
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping telnet daemon"
+    start-stop-daemon --stop --quiet --pidfile /var/run/telnetd.pid
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/telnetd {start|stop}"
+    exit 1
+esac
+
+exit 0
-- 
1.7.0.4


