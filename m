Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C673D52A5A
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 13:38:45 +0000 (UTC)
Received: by oagn12 with SMTP id n12so1445967oag.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4/4qNYeR8bSDSp1kLxg5JoGNsGBEfESziIoy28B+/dM=;
	b=HtYuxD/cjLsIdhYe8sg7IzjhYXYiqSwV8us12G2wLOJruvpH30+7WZVFBOWmnJHKmZ
	50r2uveldgwZW6gDF/xG1xtN1IntZgxx12kDHYS73rv+B2Lx5HRxO7jSwJuQzkrPRV8g
	8cjh5U0iTQztj103bS41TA9o7n84HAYOKrImgE0G6epmA5K8D+QLFzoV2oDYyloJuSpg
	tZK/et31Zvm7I3mPsoFXJesmDCitXLdUy8T1jrx1d+5RW8LxL4FzLZ/Rn9TVyHjA2Fhz
	4ZwNdA+1352sj2qSKrDdET+2MiTLd35HiuNeC8CoQkGw95h2CBupqOr9rLzDo0CvcNeT
	Hopw==
Received: by 10.60.30.168 with SMTP id t8mr12744354oeh.89.1348580322848;
	Tue, 25 Sep 2012 06:38:42 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d6sm266687obx.15.2012.09.25.06.38.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 06:38:41 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 09:03:25 -0500
Message-Id: <1348581805-14280-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] pinmux-utility: Add pinmux utility for am1808
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
X-List-Received-Date: Tue, 25 Sep 2012 13:38:46 -0000

* Add Windows base pinmux utility for am1808.
* This recipe was split from the pinmux-utility_2.3.1.0 recipe in arago.
* The current recipe pulls in a zip file that doesn't contain license
  information. No where within the zip file or actually application contains
  licensing information.
* Use the LICENSE file that contains the license agreement text that is
  displayed when installing the pinmux-utility version 2.3.1.0.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 addresses the following comments:
Changed the name=omapl138 in the SRC_URI to name=base which matches the name
used in the SRC_URI checksum

 .../pinmux-utility/pinmux-utility_1.0.1076.3.bb    |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
new file mode 100644
index 0000000..d75b837
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
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_AM18xx_01_00_1076_03.zip;name=base;subdir=${P}"
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


