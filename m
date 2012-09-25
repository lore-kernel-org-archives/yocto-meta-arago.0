Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 49D8E52A5A
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 13:41:41 +0000 (UTC)
Received: by oagn12 with SMTP id n12so1449375oag.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uUToxdYMhjtfxKTcUrLO5gqTv6aXCXtGHlZcKuYQGcs=;
	b=0iaH/jYcIgafg6wzy4KhgY6av+QZuhjhtBKvCqJyFI+eSelA4857npNhSMDs1RcxLn
	LIOGbL3RoSVtVWb/ts6VsiQQ5QNhXlS/L+VDTBjr6WyxajMK54vLv2OQRiER1F6nK4Ug
	Tjx0GKnwUdYv274SHy0HUsMBM16Xz1GTp8R38kdxBYcLHKtLbGcgk+Dm1Lwe/gMc4ihw
	U1KJ/I3ljjtkHPn8GtKdU6tmWNHs39vG9hfhO3gqOndyAIuxtia70FLsTJScrxjc+9mv
	Z5ORVWnImfoJX7jFVIcNhNNub8AhQ9k4HgCsp8e+FbwfU6l+1j1N8oQ9Sg1j1uBDW3Bp
	zMew==
Received: by 10.60.20.74 with SMTP id l10mr12249660oee.19.1348580500672;
	Tue, 25 Sep 2012 06:41:40 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id eb3sm268231obc.19.2012.09.25.06.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 06:41:40 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 09:06:16 -0500
Message-Id: <1348581976-14342-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] parse-ip: Add script to parse ip address
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
X-List-Received-Date: Tue, 25 Sep 2012 13:41:41 -0000

* Port recipe from arago. This recipe was orginally called
  ti-oobe-script.
* Add script to parse ip address from the target system
  and save it into a mmc partition that is mountable by
  the host PC.
* This is used to determine the right ip address to bring
  up remote Matrix.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 addresses the following comments:
Changed the name of the recipe from ti-oobe-script to parse-ip.

 .../recipes-tisdk/parse-ip/parse-ip.bb             |   24 ++++++++++
 .../recipes-tisdk/parse-ip/parse-ip/init           |   46 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
new file mode 100644
index 0000000..4aba91d
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Script to parse ip address during boot and make it available to the host system using shared partitions"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
+
+COMPATIBLE_MACHINE = "ti33x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "file://init"
+
+PR = "r0"
+
+S = "${WORKDIR}"
+
+INITSCRIPT_NAME = "parse-ip"
+INITSCRIPT_PARAMS = "defaults 98"
+
+inherit update-rc.d
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
+}
+
+FILES_${PN} = "${sysconfdir}"
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
new file mode 100644
index 0000000..0020ea2
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+# This distribution contains contributions or derivatives under copyright
+# as follows:
+#
+# Copyright (c) 2010, Texas Instruments Incorporated
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+# - Redistributions of source code must retain the above copyright notice,
+#   this list of conditions and the following disclaimer.
+# - Redistributions in binary form must reproduce the above copyright
+#   notice, this list of conditions and the following disclaimer in the
+#   documentation and/or other materials provided with the distribution.
+# - Neither the name of Texas Instruments nor the names of its
+#   contributors may be used to endorse or promote products derived
+#   from this software without specific prior written permission.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
+# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
+# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+case "$1" in
+    start )
+        if [ -e /media/mmcblk0p1 ]
+        then
+            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /media/mmcblk0p1/.ipaddr
+            sync
+	    sync
+	fi
+    ;;
+    stop )
+        exit 0;;
+esac
+
+exit 0
-- 
1.7.0.4


