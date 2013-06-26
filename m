Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C0EAF52990
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:12:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFC2ms017014
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFC2K4015081
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:02 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:12:02 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QFBsFh032671;
	Wed, 26 Jun 2013 10:12:00 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 10:24:56 -0500
Message-ID: <1372260299-3134-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372260299-3134-1-git-send-email-fcooper@ti.com>
References: <1372260299-3134-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/6] arm-benchmarks: Pull in updated commit to fix the CCS project file.
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
X-List-Received-Date: Wed, 26 Jun 2013 15:12:04 -0000
Content-Type: text/plain

* The CCS project file now contains symbols that the SDK installer will replace
  with correct values when the SDK is installed.
* This makes it easier to manage changes in the toolchain sdk structure.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index ce18860..d46c0ab 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,25 +4,24 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r5"
+PR = "r6"
 
 BRANCH ?= "master"
-SRCREV = "176c8869817913967ae1a0d561535eb40ba8a527"
+SRCREV = "eba9e69247c105f6d8dbcb56452ad4c4ea2df31e"
 
 SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-PLATFORM_ARCH = "${ARMPKGARCH}"
-PLATFORM_ARCH_omapl138 = "armv5te"
-
 do_compile() {
+
 	export CROSS_COMPILE=${TARGET_PREFIX}
 	export CFLAGS='${TARGET_CC_ARCH}'
 	# build the release version
-	oe_runmake -C ${PLATFORM_ARCH} release
+	oe_runmake release
 }
-
 do_install() {
-	oe_runmake -C ${PLATFORM_ARCH} DESTDIR=${D} install
+
+	oe_runmake DESTDIR=${D} install
 }
+
-- 
1.7.0.4


