Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E0D5C52A2E
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:28:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LSbAn031272
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LSbMF003542
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:37 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:28:36 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LSV9Z016143;
	Mon, 6 May 2013 16:28:35 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:28:23 -0500
Message-ID: <1367875707-8579-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367875707-8579-1-git-send-email-fcooper@ti.com>
References: <1367875707-8579-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/6] arm-benchmarks: Grab CFLAGS from OE or Rules.make
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
X-List-Received-Date: Mon, 06 May 2013 21:28:38 -0000
Content-Type: text/plain

* When building from OE CFLAGS will be passed in.
* When building from within the sdk CFLAGS from Rules.make will be used.
* This insures the optimal CFLAGS are used which corrects optimization and also
  the correct toolchain settings (ie softfp/hardfp) are used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 23acd42..ce18860 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,10 +4,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH ?= "master"
-SRCREV = "9b7b4fbde8fcf796a23da2a464dbf934e550f6c9"
+SRCREV = "176c8869817913967ae1a0d561535eb40ba8a527"
 
 SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
@@ -18,6 +18,7 @@ PLATFORM_ARCH_omapl138 = "armv5te"
 
 do_compile() {
 	export CROSS_COMPILE=${TARGET_PREFIX}
+	export CFLAGS='${TARGET_CC_ARCH}'
 	# build the release version
 	oe_runmake -C ${PLATFORM_ARCH} release
 }
-- 
1.7.0.4


