Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 53D5B52A8D
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 15:46:30 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so1140760obb.38
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=MbIDffPDhHJ/btujmNOV5+1NDZl3nhWmVl3iX0BMgBk=;
	b=sqaS/IVd/641oxIZ3VlUZ33NmZ2dmWnq4PIms5XgSmFCW50HQdAjw8PC8sMtT65vqx
	bMd6Koh/HinQB3BGw2D+tACarbB8/WpKgNxf1OnnOpWwQl3SwJnvspxc912wowVrlMDM
	LrAJkRdgiBAp6EgPC4Xf+1Ca/+AYlmrjvg2kToU8lnjfomVuQPgr+57vcrfUkmWi7sCM
	I2eejSpOBPkKu6Rq5vN8Im2/gziV40hrW1BH/fr9BONVm6OL45Rlg4K2gs8RDOgW6m8c
	zSVCsMGZxVU8QwI7Ur6E/Fyy6HNo5UbSFTEbY+Lf9F5DzdxAcDNlzC2+BnbIZbq6nK9k
	ez2w==
Received: by 10.60.7.169 with SMTP id k9mr3220767oea.77.1348069589801;
	Wed, 19 Sep 2012 08:46:29 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j10sm2283915oej.10.2012.09.19.08.46.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 08:46:29 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 19 Sep 2012 11:08:57 -0500
Message-Id: <1348070937-32238-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH v2] flash-utility: Add flash utility tool
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
X-List-Received-Date: Wed, 19 Sep 2012 15:46:30 -0000

* Add Windows base flash utility
* Port flash utility recipe from arago
* The current recipe pulls in a zip file that doesn't contain license
  information.
* Add a LICENSE file that contains the text that is displayed within the
  license agreement screen when installing this application.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 of this patch addresses the following issues:
Remove unneeded PACKAGE_ARCH = "${MACHINE_ARCH}" statement
Add the license information that was provided in the flash-utility PATCH 2/2
into this patch.

 .../flash-utility/flash-utility-1.6.0.0/LICENSE    |   63 ++++++++++++++++++++
 .../flash-utility/flash-utility_1.6.0.0.bb         |   35 +++++++++++
 2 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/flash-utility/flash-utility-1.6.0.0/LICENSE
 create mode 100644 meta-arago-extras/recipes-devtools/flash-utility/flash-utility_1.6.0.0.bb

diff --git a/meta-arago-extras/recipes-devtools/flash-utility/flash-utility-1.6.0.0/LICENSE b/meta-arago-extras/recipes-devtools/flash-utility/flash-utility-1.6.0.0/LICENSE
new file mode 100644
index 0000000..fd4f082
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/flash-utility/flash-utility-1.6.0.0/LICENSE
@@ -0,0 +1,63 @@
+Copyright (c) 2010, Texas Instruments Incorporated
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without modification,
+are permitted provided that the following conditions are met:
+
+ - Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer.
+ - Redistributions in binary form must reproduce the above copyright notice,
+   this list of conditions and the following disclaimer in the documentation
+   and/or other materials provided with the distribution.
+ - Neither the name of Texas Instruments nor the names of its contributors
+   may be used to endorse or promote products derived from this software
+   without specific prior written permission.
+
+ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+ COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+ INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+ BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+ OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
+ AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ SUCH DAMAGE.
+
+Copyright (C) 2008 The Android Open Source Project
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+ - Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+ - Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in
+   the documentation and/or other materials provided with the
+   distribution.
+
+ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+ COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+ INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+ BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+ OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
+ AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ SUCH DAMAGE.
+
+Copyright (c) 1996 L. Peter Deutsch and Jean-Loup Gailly
+
+Permission is granted to copy and distribute this document for any
+purpose and without charge, including translations into other
+languages and incorporation into compilations, provided that the
+copyright notice and this notice are preserved, and that any
+substantive changes or deletions from the original are clearly
+marked.
diff --git a/meta-arago-extras/recipes-devtools/flash-utility/flash-utility_1.6.0.0.bb b/meta-arago-extras/recipes-devtools/flash-utility/flash-utility_1.6.0.0.bb
new file mode 100644
index 0000000..48fb1f4
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/flash-utility/flash-utility_1.6.0.0.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Texas Instruments Flash Utility"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a428c464689fd2fac5b185963cbfbf85"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/580/4785/Flash_v1.6.0.0.zip;name=base;subdir=${P}"
+
+# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
+# from the License Agreement screen when installing the flash utility application.
+SRC_URI += "file://LICENSE"
+
+S = "${WORKDIR}/${P}"
+
+do_unpack_extra() {
+    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
+}
+
+addtask unpack_extra after do_unpack before do_patch
+
+installdir = "host-tools/flash_utils/windows"
+
+do_install() {
+    install -d ${D}/${installdir}
+    install ${S}/setup.exe ${D}/${installdir}
+    install ${S}/FlashInstaller.msi ${D}/${installdir}
+    install ${S}/Release_Notes.txt ${D}/${installdir}
+}
+
+FILES_${PN} += "${installdir}/*"
+
+SRC_URI[base.md5sum] = "1f53efa31996afb5af78930739090ae6"
+SRC_URI[base.sha256sum] = "f6722422016ec4e49b8c55c38affea4c924b6636a47d0d67e6537e7dab108a1b"
-- 
1.7.0.4


