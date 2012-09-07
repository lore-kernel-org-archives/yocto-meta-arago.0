Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 6653A52A61
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 18:32:55 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eh20so4891799obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6oOERXup8TBM0VkALHbWXixGc1XEMU3rhE9x1/GUoOQ=;
	b=SznnatSHktL1k6+nJzhtYqLaqRfutVxBe94wYeS+GOE1KK3TxuXbPsPmlwKuhuW3Tt
	q1etf7gBoGYMGGggE/NojnZogahUoHhfBuI3LM338a4A2X7SuPX1IqpNVhquX5XuMSy5
	bYscGXHvtmCRujLwwQ+C/REs5XbhqLCvbjk2TTC7akcu8SLrv+XmVYK5bqmvEPuGCWCZ
	vkmdSHim8Hr7W3PXBQ476hQsmT2sC/iJJ8OGM8Ynq4QPbAENp4mDvS1kNWuYrDlRyWNq
	TxXN2IC7TWR26YCNgKsSyt65jnwD5+GLzBuzkAiI1FD0yVxoEXg2sjcH/B3NX7LpSmw6
	oOZQ==
Received: by 10.60.27.41 with SMTP id q9mr7007790oeg.80.1347042775147;
	Fri, 07 Sep 2012 11:32:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a20sm4289247oei.2.2012.09.07.11.32.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 11:32:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 13:50:57 -0500
Message-Id: <1347043857-20831-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1347043857-20831-1-git-send-email-fcooper27jr@gmail.com>
References: <1347043857-20831-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2] flash-utility: Add temporary license file
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
X-List-Received-Date: Fri, 07 Sep 2012 18:32:55 -0000

* Add temporary license file to the flash-utility.
* This file was grabbed from the license agreement screen when
  installing the flash utility.
* A proper license file needs to be added to the zip file that is apart
  of the official flash utility release.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../flash-utility/flash-utility-1.6.0.0/LICENSE    |   63 ++++++++++++++++++++
 .../flash-utility/flash-utility_1.6.0.0.bb         |   14 ++++-
 2 files changed, 76 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE

diff --git a/meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE b/meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE
new file mode 100644
index 0000000..dc4f3dd
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE
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
\ No newline at end of file
diff --git a/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb b/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
index 94d78f6..e25557e 100644
--- a/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
+++ b/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
@@ -1,15 +1,27 @@
 DESCRIPTION = "Texas Instruments Flash Utility"
 LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3fff2f9c28a0f21bdb38a7a718701562"
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/580/4785/Flash_v1.6.0.0.zip;name=base;subdir=${P}"
+
+# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
+# from the License Agreement screen when installing the flash utility application.
+SRC_URI += "file://LICENSE"
+
 S = "${WORKDIR}/${P}"
 
+do_unpack_extra() {
+    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
+}
+
+addtask unpack_extra after do_unpack before do_patch
+
 installdir = "host-tools/flash_utils/windows"
 
 do_install() {
-- 
1.7.0.4


