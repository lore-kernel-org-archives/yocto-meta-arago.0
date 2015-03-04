Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 79C4D52A8C
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 20:05:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24K5PoF024948
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:05:25 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24K5OOf026217
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:05:24 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 14:05:24 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24K5NxY012968;	Wed, 4 Mar 2015 14:05:24 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t24K5J7W032494;	Thu, 5 Mar 2015 01:35:21 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 14:05:15 -0600
Message-ID: <1425499517-11576-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425499517-11576-1-git-send-email-fcooper@ti.com>
References: <1425499517-11576-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] stream: Add append for TISDK customizations
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
X-List-Received-Date: Wed, 04 Mar 2015 20:05:26 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Use an SDK branch that slightly tweaks the makefile to include generic
  optimizations that should be used by all TI platforms.
* Also manually set certain variables to insure no additional/unexpected
  compiler optimization are pulled in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-benchmark/stream/stream_git.bbappend   |   10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
new file mode 100644
index 0000000..83adfb6
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
@@ -0,0 +1,10 @@
+PR_append = "-arago0"
+
+BRANCH = "sdk"
+SRCREV = "cfd73a33c0ceef1f8532ce6a71de3bcf9435f6a2"
+
+do_compile_prepend() {
+    #Explicitly set some variables to insure no unexpected optimizations are being passed in.
+    export CFLAGS="-isystem${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/include"
+    export LDFLAGS="-L${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib"
+}
-- 
1.7.9.5


