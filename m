Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E82A3529BD
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 20:48:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24KmObd021900
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:48:24 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24KmNJl014429
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:48:23 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 14:48:22 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24KmL5V009233;	Wed, 4 Mar 2015 14:48:22 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t24KmJQQ008745;	Thu, 5 Mar 2015 02:18:20 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 14:48:18 -0600
Message-ID: <1425502098-15001-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3 v2] stream: Add append for TISDK customizations
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
X-List-Received-Date: Wed, 04 Mar 2015 20:48:25 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Use an SDK branch that slightly tweaks the makefile to include generic
  optimizations that should be used by all TI platforms.
* Also manually set certain variables to insure no additional/unexpected
  compiler optimization are pulled in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
v2 changes:
Unset CFLAGS and LDFLAGS variable. Those variables aren't providing anything
useful and CC provides everything needed to compile

 .../recipes-benchmark/stream/stream_git.bbappend   |   10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
new file mode 100644
index 0000000..9dc244b
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
@@ -0,0 +1,10 @@
+PR_append = "-arago0"
+
+BRANCH = "sdk"
+SRCREV = "cfd73a33c0ceef1f8532ce6a71de3bcf9435f6a2"
+
+do_compile_prepend() {
+    #Explicitly clear some variables to insure no unexpected optimizations are being passed in.
+    unset CFLAGS
+    unset LDFLAGS
+}
-- 
1.7.9.5


