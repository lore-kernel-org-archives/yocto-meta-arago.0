Return-Path: <a0221004@ares-ubuntu>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3C96E52A48
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 22:30:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48MU5fl030142
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 17:30:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48MU5Go015702
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 17:30:05 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 17:30:04 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r48MU4P4018442;	Wed, 8 May 2013 17:30:04 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UaCs7-0007pl-U3;
	Wed, 08 May 2013 18:30:03 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 May 2013 18:30:01 -0400
Message-ID: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Jingting Zhou <zhoujt@ti.com>
Subject: [PATCH 1/2] Recipe initscript-debugfs: mount debugfs in the initscripts when linux starts up
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
X-List-Received-Date: Wed, 08 May 2013 22:30:07 -0000
Content-Type: text/plain

From: Jingting Zhou <zhoujt@ti.com>

needed by ti-multiprocmgr, when the mgm loads the dsp image, the system printf messages come from the debugfs

Signed-off-by: Jingting Zhou <zhoujt@ti.com>
---
 .../initscript-debugfs/files/debugfs.sh            |   40 ++++++++++++++++++++
 .../initscript-debugfs/initscript-debugfs.bb       |   20 ++++++++++
 2 files changed, 60 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
 create mode 100755 meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb

diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
new file mode 100755
index 0000000..9b26279
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/initscript-debugfs/files/debugfs.sh
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+#   Copyright 2012, Texas Instruments, Inc.
+#  
+#   Redistribution and use in source and binary forms, with or without 
+#   modification, are permitted provided that the following conditions 
+#   are met:
+# 
+#     Redistributions of source code must retain the above copyright 
+#     notice, this list of conditions and the following disclaimer.
+# 
+#     Redistributions in binary form must reproduce the above copyright
+#     notice, this list of conditions and the following disclaimer in the 
+#     documentation and/or other materials provided with the   
+#     distribution.
+# 
+#     Neither the name of Texas Instruments Incorporated nor the names of
+#     its contributors may be used to endorse or promote products derived
+#     from this software without specific prior written permission.
+# 
+#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
+#   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
+#   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+#   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
+#   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
+#   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
+#   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+#   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+#   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
+#   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
+#   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# 
+
+
+if ! [ -e /debug ] ; then
+  mkdir -p /debug
+fi
+mount -t debugfs debugfs /debug
+
+exit 0
diff --git a/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb
new file mode 100755
index 0000000..f8145ba
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/initscript-debugfs/initscript-debugfs.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Initscripts for debugfs"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://debugfs.sh;startline=3;endline=32;md5=4d96701a693bf321ad2d15026a285446"
+
+PR ="r0"
+
+SRC_URI = "file://debugfs.sh"
+		   
+INITSCRIPT_NAME = "debugfs.sh"
+INITSCRIPT_PARAMS = "start 09 S ."
+
+inherit update-rc.d
+
+S = "${WORKDIR}"
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d/ 
+	install -c -m 755 ${WORKDIR}/debugfs.sh ${D}${sysconfdir}/init.d/debugfs.sh 
+}
-- 
1.7.9.5


