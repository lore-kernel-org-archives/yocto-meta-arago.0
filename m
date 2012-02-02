Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1E99652A2A
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2012 15:57:43 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q12Fvegh029589
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 09:57:41 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12FvdNg024391
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 21:27:40 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 2 Feb 2012 21:27:39 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12Fvb1s017713;
	Thu, 2 Feb 2012 21:27:38 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2012 09:57:35 -0600
Message-ID: <1328198255-30506-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-gpl-notice: port from old arago
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
X-List-Received-Date: Thu, 02 Feb 2012 15:57:44 -0000
Content-Type: text/plain

* Ported the arago-gpl-notice recipe from the old arago overlay
* This recipe adds an init script that will scan the installed
  packages for GPLv3 licenses that do not have RLE listed.
* Updated the S variable to make license checksumming easier
* Added the MIT license to the init script for checksumming

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../arago-gpl-notice/arago-gpl-notice.bb           |   19 +++++++
 .../arago-gpl-notice/print-gplv3-packages.sh       |   50 ++++++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
 create mode 100644 meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh

diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
new file mode 100644
index 0000000..2d81034
--- /dev/null
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Script to warn users of GPLv3 content on the target file system at boot time"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
+
+PR = "r0"
+
+S = ${WORKDIR}
+
+INITSCRIPT_NAME = "gplv3-notice"
+INITSCRIPT_PARAMS = "defaults 99"
+
+inherit allarch update-rc.d
+
+SRC_URI = "file://print-gplv3-packages.sh"
+
+do_install(){
+	install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${S}/print-gplv3-packages.sh ${D}${sysconfdir}/init.d/gplv3-notice
+}
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
new file mode 100644
index 0000000..026c0e9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
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
+gplv3_packages=""
+
+# find all files with GPLv3 in them that do not also have RLE
+# exception listed.
+files=`grep License: /var/lib/opkg/info/*.control | grep -i GPLv3 | grep -v RLE | cut -d: -f1 | sort -u`
+
+for i in $files
+do
+    package=`basename $i | sed s/\.control//`
+    gplv3_packages="$gplv3_packages""\t$package\n"
+done
+
+if [ "$gplv3_packages" != "" ]
+then
+    echo "***************************************************************"
+    echo "***************************************************************"
+    echo "NOTICE: This file system contains the followin GPLv3 packages:"
+    echo -e $gplv3_packages
+    echo "If you do not wish to distribute GPLv3 components please remove"
+    echo "the above packages prior to distribution.  This can be done using"
+    echo "the opkg remove command.  i.e.:"
+    echo "    opkg remove <package>"
+    echo "Where <package> is the name printed in the list above"
+    echo ""
+    echo "NOTE: If the package is a dependency of another package you"
+    echo "      will be notified of the dependent packages.  You should"
+    echo "      use the --force-removal-of-dependent-packages option to"
+    echo "      also remove the dependent packages as well"
+    echo "***************************************************************"
+    echo "***************************************************************"
+fi
-- 
1.7.0.4


