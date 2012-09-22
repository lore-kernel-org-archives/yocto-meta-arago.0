Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id D5DE5529A1
	for <meta-arago@arago-project.org>;
	Sat, 22 Sep 2012 00:19:37 +0000 (UTC)
Received: by oagl20 with SMTP id l20so3742193oag.38
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2012 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+idApnpf+JXkRPZED9rTDfnShmZQOSsVoBZpwt8+uro=;
	b=voMqyCZrDPBxjhSl8dA7Wg5ulsy+vFwmyhnIkGafgpQbv/94RdnXMeIAh2qnFv0cX8
	Iok8KtjjYZrZI74NZoAhQGoCqwyEzFifWf1Rg/yAshsKOy9K49HOQ774kv/Cnl9hbHSC
	8UhpVrQZOzMqHHXTKXDm7/T/PF9jyLQw7eb342WxVjwiAQWI5wAMzzA5Ea1G75oc4Kf6
	xWO2Ihn+5lXHim+WNNjoYRVUccf/ZfYF1W2iOi6RXoye6qAQ22p3xao371WvBUV7cssk
	NLO6KCzTJCmlw99SRc6QE0r3I83PPNkPkCrsoiUbu+Q4P62H8/Cvln5YLRlRS54umwHO
	7PQg==
Received: by 10.60.5.129 with SMTP id s1mr5059882oes.85.1348273176801;
	Fri, 21 Sep 2012 17:19:36 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id x1sm7353444oef.8.2012.09.21.17.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 17:19:36 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Sep 2012 19:43:00 -0500
Message-Id: <1348274580-27428-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extra][PATCH] pinmux-utility: Add pinmux utility for am1808
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
X-List-Received-Date: Sat, 22 Sep 2012 00:19:38 -0000

* Add Windows base pinmux utility for am1808.
* This recipe was split from the pinmux-utility_2.3.1.0 recipe in arago.
* The current recipe pulls in a zip file that doesn't contain license
  information. No where within the zip file or actually application contains
  licensing information.
* Use the LICENSE file that contains the license agreement text that is
  displayed when installing the pinmux-utility version 2.3.1.0.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../pinmux-utility/pinmux-utility_1.0.1076.3.bb    |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
new file mode 100644
index 0000000..24f4a15
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Texas Instruments Pinmux Utility"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b328fcf0477d688d8b85f7310f9e6b9"
+COMPATIBLE_MACHINE = "am180x-evm"
+
+PR = "r0"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_AM18xx_01_00_1076_03.zip;name=omapl138;subdir=${P}"
+
+# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
+# from the License Agreement screen when installing pinmux-utility_2.3.1.0. No license information exist for this
+# version of the pinmux utility.
+SRC_URI += "file://LICENSE"
+
+SRC_URI[base.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
+SRC_URI[base.sha256sum] = "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0"
+
+S = "${WORKDIR}/${P}"
+
+do_unpack_extra() {
+    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
+}
+
+addtask unpack_extra after do_unpack before do_patch
+
+installdir = "host-tools/pinmux_utils/windows"
+
+do_install() {
+    install -d ${D}/${installdir}
+    cp -rf ${S}/bin ${D}/${installdir}/
+    cp -rf ${S}/configurations ${D}/${installdir}/
+}
+
+FILES_${PN} += "${installdir}/*"
-- 
1.7.0.4


