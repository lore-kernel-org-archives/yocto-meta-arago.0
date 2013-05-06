Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3A16952A98
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:28:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LSlsp026038
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LSljJ003668
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:47 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:28:47 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LSV9d016143;
	Mon, 6 May 2013 16:28:45 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:28:27 -0500
Message-ID: <1367875707-8579-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367875707-8579-1-git-send-email-fcooper@ti.com>
References: <1367875707-8579-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/6] av-examples: Grab CFLAGS from OE or Rules.make
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
X-List-Received-Date: Mon, 06 May 2013 21:28:48 -0000
Content-Type: text/plain

* When building from OE CFLAGS will be passed in.
* When building from within the sdk CFLAGS from Rules.make will be used.
* This insures the optimal CFLAGS are used which corrects optimization and
* also the correct toolchain settings (ie softfp/hardfp) are used.
---
 .../av-examples/av-examples_1.0.bb                 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
index 3782cba..dec17a8 100644
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(omap3)"
 
 BRANCH ?= "master"
-SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
+SRCREV = "87469a47bf91d681f15f0a2eb368fe695b21508c"
 
 SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
 
@@ -24,6 +24,7 @@ INSANE_SKIP_${PN} = "True"
 do_compile() {
 	touch debug
 	export CROSS_COMPILE=${TARGET_PREFIX}
+	export CFLAGS='${TARGET_CC_ARCH}'
 	make release LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${MACHINE}"
 }
 
-- 
1.7.0.4


