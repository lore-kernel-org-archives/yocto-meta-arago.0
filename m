Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id 9F5BB52AB6
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:11:12 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so4995014oag.12
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=oPmk2RdxEokJc3x/rcARTY91QsnEkDazG+jKkgefZRc=;
	b=n6tPu4jQ6x83LtmEJJPRrKogkllLG/jaJ3arxwXkJbLIP5umFUiEw408r5FIVIoWiM
	4Z/VKkLajEb0KvM2yolkGZtTeZDMktQoRZi6gpO5wJPnMKI8Ykj9MnIRT/z0Uef9GWpI
	e7ENQfUF3clxyzB+diPR/GLy72MPVPbeaFpXffi2MPGyYDC8xjV9M2yUvZq+M4Ig6NE3
	QI6Z0sFCu0lUtNhRGoybDYzzBFm94cUmSgQIis0AVdX0rA++UZ0ocSfaKVZuSb2IOM4T
	T3VOTPm4w4TeMkQ6dyxoUoSsJv9eJMEHbMpenHhNntSQbhUoDIYaHDMgjgEs8lEOsT1X
	nrZA==
X-Received: by 10.60.169.231 with SMTP id ah7mr7210791oec.142.1362107472246;
	Thu, 28 Feb 2013 19:11:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.11.09
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:11:11 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:46 -0600
Message-Id: <1362107447-11234-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362107447-11234-1-git-send-email-fcooper@ti.com>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
Cc: Michael Tadyshak <mtadyshak@ti.com>,
	"Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 8/9] pinmux-utility: Add new Pinmux Utility
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
X-List-Received-Date: Fri, 01 Mar 2013 03:11:12 -0000

From: Michael Tadyshak <mtadyshak@ti.com>

* Add new Pinmux Utility that adds am335x silicon 2.1 support
* Remove external license file since the zip file now contains one

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../pinmux-utility/pinmux-utility_2.4.1.0.bb       |   34 --------------------
 .../pinmux-utility/pinmux-utility_2.5.2.0.bb       |   24 ++++++++++++++
 2 files changed, 24 insertions(+), 34 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
 create mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
deleted file mode 100644
index c34f9fd..0000000
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Texas Instruments Pinmux Utility"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b328fcf0477d688d8b85f7310f9e6b9"
-COMPATIBLE_MACHINE = "am335x-evm|am37x-evm|am3517-evm|beagleboard"
-
-PR = "r0"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/850/5562/PinMuxUtility_v2_04_01_00.zip;name=base;subdir=${P}"
-
-# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
-# from the License Agreement screen when installing this application.
-SRC_URI += "file://LICENSE"
-
-SRC_URI[base.md5sum] = "f65ec03bbbb9e14126ac8ce2795acede"
-SRC_URI[base.sha256sum] = "a95fe1b436419bf97bfdcc0b7ce95e497558ad81190d95dc0869ef9fc794094c"
-
-S = "${WORKDIR}/${P}"
-
-do_unpack_extra() {
-    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
-}
-
-addtask unpack_extra after do_unpack before do_patch
-
-installdir = "host-tools/pinmux_utils/windows"
-
-do_install() {
-    install -d ${D}/${installdir}
-    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
-    install ${S}/setup.exe ${D}/${installdir}
-    install ${S}/Release_Notes.txt ${D}/${installdir}
-}
-
-FILES_${PN} += "${installdir}/*"
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb
new file mode 100644
index 0000000..51c6571
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Texas Instruments Pinmux Utility"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d69a4aafe4f7b66d5f9c60d6875ebd52"
+COMPATIBLE_MACHINE = "am335x-evm|am37x-evm|am3517-evm|beagleboard"
+
+PR = "r0"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1019/6393/PinMuxUtility_v2_05_02_00.zip;name=base;subdir=${P}"
+
+SRC_URI[base.md5sum] = "5a5cb5e9a5361fcb244a4b685872fe6b"
+SRC_URI[base.sha256sum] = "93b8dfd726dd614aad9c2b0bb9ffc0abbd47e1c2900c3f411be7433c6d04fd2a"
+
+S = "${WORKDIR}/${P}"
+
+installdir = "host-tools/pinmux_utils/windows"
+
+do_install() {
+    install -d ${D}/${installdir}
+    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
+    install ${S}/setup.exe ${D}/${installdir}
+    install ${S}/Release_Notes.txt ${D}/${installdir}
+}
+
+FILES_${PN} += "${installdir}/*"
-- 
1.7.0.4


