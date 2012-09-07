Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 67C19529B9
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 18:51:58 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so4920124obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fEkyBlQfNUdXG2PmRxCYwHsErDEkSYdNDom+GX2Ot2I=;
	b=NvZWjbypjR9o45XSFJGD7DnzOj2qVR3/CSPzx5kKxviUWUq8MRMPPzfGpqiPIMWA3/
	7QnSAKiGjIDTR0myI1HM2s5bvMg0RTkYU6NjSYNWp7tl4PJPgx3Z6tTYodH0EZxkWygN
	TZ5e4xfKQ3TovvdK8wS69kW5CcpU1T7jHs8oM6RA5DcRuun4VAOGkZbOK7U0Gn2SOqAF
	YhDpmoiKMVBZOSSxE6iAyXkTrsHZgQom33yYMUA1V5C5vfLsP7KPODRPRHnGNsUk+rks
	irau7h17z8uctheIAOJTAQHdIAwwKu8vKQ6kxcLaSLuDKhmdz8rAIc1U58NyEmF+H7Qw
	JffQ==
Received: by 10.60.3.194 with SMTP id e2mr7120461oee.1.1347043917289;
	Fri, 07 Sep 2012 11:51:57 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 5sm2978527oeq.4.2012.09.07.11.51.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 11:51:56 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 14:09:59 -0500
Message-Id: <1347044999-25201-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1347044999-25201-1-git-send-email-fcooper27jr@gmail.com>
References: <1347044999-25201-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2 v2] pinmux-utility: Add temporary license file
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
X-List-Received-Date: Fri, 07 Sep 2012 18:52:02 -0000

* Add temporary license file to the pinmux-utility. This file was
  grabbed from the license agreement screen when installing the non
  am18x version of the pinmux utility. A proper license file needs to
  be added to the zip file that is apart of the offical pinmux utility
  release.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../pinmux-utility/pinmux-utility-2.3.1.0/LICENSE  |   30 ++++++++++++++++++++
 .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   13 ++++++++-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility-2.3.1.0/LICENSE

diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility-2.3.1.0/LICENSE b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility-2.3.1.0/LICENSE
new file mode 100644
index 0000000..dcd680f
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility-2.3.1.0/LICENSE
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
\ No newline at end of file
diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
index e966f3a..fa20429 100644
--- a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
@@ -1,6 +1,6 @@
 require pinmux-utility.inc
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 SRC_URI = "\
     https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtility_v2_03_01_00.zip;name=base;subdir=${P} \
@@ -23,3 +23,14 @@ do_install_omapl138() {
 
 SRC_URI[omapl138.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
 SRC_URI[omapl138.sha256sum] = "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0"
+
+# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
+# from the License Agreement screen when installing the non am18x version of the pinmux utility.
+SRC_URI += "file://LICENSE"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f400ac8ac09799ccf153aab40deff94"
+
+do_unpack_extra() {
+    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
+}
+
+addtask unpack_extra after do_unpack before do_patch
-- 
1.7.0.4


