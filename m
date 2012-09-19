Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E863B529CF
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 15:28:33 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so1121868obb.38
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=OQ7gVmpA8tJkLJrrxTMuUH2GMeVyW/jo+/OIFlai2JU=;
	b=tnAVrSK73s2zg2GdePP4tN/VIQ8qvXkpa6ewOIbR0KNkDoNYwchlSvpQCNBRIqQUaH
	AYsKK8Jx2Ah8ttOM9/gxmMDxJaFP2n/WT6LCLaHp1IODSdCa3vP9CEimCx5PVo1URRLP
	YGATJkL6cFbDMH4SQm8XNv6JtLKmznPD/HibHMcc7RVYxvDCGbtTKgmpvnugMscnpXnZ
	Lq94n7HpfoumvHGz+XoJ58x4dkYFRWvn6d148oRaADjgHPIvCQXW/j8+RFfQ/hL0gluE
	MzOX0+G8VlGh5TpO0rqRbOJrVLTkJJhCs7uQBmS36u6VWvXFB4ardFBoqykkqxKa0gol
	xa1Q==
Received: by 10.60.11.104 with SMTP id p8mr3211615oeb.133.1348068512347;
	Wed, 19 Sep 2012 08:28:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y10sm2246526oed.12.2012.09.19.08.28.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 08:28:30 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 19 Sep 2012 10:50:58 -0500
Message-Id: <1348069858-29530-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH v3] pinmux-utility: Add pinmux utility
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
X-List-Received-Date: Wed, 19 Sep 2012 15:28:34 -0000

* Add Windows base pinmux utility
* Port pinmux-utility recipe from arago.
* The current recipe pulls in a zip file that doesn't contain
  license information.
* Create a LICENSE file that contains the text from the license
  agreement screen that is displayed when installing this software.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 3 addresses the following issues:
Add LICENSE file in this commit instead of in a seperate commit.
Typos in commit message.
Adding information on what is different within this version of the
commit.

 .../pinmux-utility/pinmux-utility/LICENSE          |   30 +++++++++++++++++
 .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   34 ++++++++++++++++++++
 2 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE
 create mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE
new file mode 100644
index 0000000..32f2b0a
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE
@@ -0,0 +1,30 @@
+This distribution contains contributions or derivatives under copyright
+as follows:
+Copyright (c) 2010, Texas Instruments Incorporated
+All rights reserved.
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are
+met:
+- Redistributions of source code must retain the above copyright notice,
+  this list of conditions and the following disclaimer.
+- Redistributions in binary form must reproduce the above copyright
+  notice, this list of conditions and the following disclaimer in the
+  documentation and/or other materials provided with the distribution.
+- Neither the name of Texas Instruments nor the names of its
+  contributors may be used to endorse or promote products derived
+  from this software without specific prior written permission.
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS
+AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
+WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+PARTICULAR PURPOSE ARE DISCLAIMED.
+IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
+BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb
new file mode 100644
index 0000000..6cd5b0c
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Texas Instruments Pinmux Utility"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b328fcf0477d688d8b85f7310f9e6b9"
+COMPATIBLE_MACHINE = "am335x-evm|am37x-evm|am3517-evm|beagleboard"
+
+PR = "r0"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtility_v2_03_01_00.zip;name=base;subdir=${P}"
+
+# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
+# from the License Agreement screen when installing this application.
+SRC_URI += "file://LICENSE"
+
+SRC_URI[base.md5sum] = "31f28b06f72c042e5400fc53b4a29c0e"
+SRC_URI[base.sha256sum] = "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f06e1d8d23f317a452f9"
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
+    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
+    install ${S}/setup.exe ${D}/${installdir}
+    install ${S}/Release_Notes.txt ${D}/${installdir}
+}
+
+FILES_${PN} += "${installdir}/*"
-- 
1.7.0.4


