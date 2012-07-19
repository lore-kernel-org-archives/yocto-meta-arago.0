Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 98AC85299F
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2012 23:51:08 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6JNp7EX018263
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2012 18:51:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6JNp7Vh020778
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2012 18:51:07 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 19 Jul 2012 18:51:07 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q6JNp70O022884;	Thu, 19 Jul 2012 18:51:07 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1Ss0UV-00011V-1q; Thu, 19 Jul 2012 18:50:43 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2012 18:50:32 -0500
Message-ID: <1342741832-3905-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 2/2] arm-benchmarks: Fix compile and install issues
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
X-List-Received-Date: Thu, 19 Jul 2012 23:51:09 -0000
Content-Type: text/plain

* The TUNE_PKGARCH variable isn't providing the expected arch value. Switch to
  ARMPKGARCH since it returns the expected value.
* Spell out protocol to get rid of warning.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 6746ed5..e1f700e 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -5,20 +5,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
 SRCREV = "76"
-PR = "r0+svnr${SRCPV}"
+PR = "r1+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
+SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
 S = "${WORKDIR}/trunk"
 
 do_compile() {
 	export CROSS_COMPILE=${TARGET_PREFIX}
-	export ARCH=${TUNE_PKGARCH}
+	export ARCH=${ARMPKGARCH}
 	# build the release version
 	make release
 }
 
 do_install() {
-	export ARCH=${TUNE_PKGARCH}
+	export ARCH=${ARMPKGARCH}
 	make DESTDIR=${D} install
 }
-- 
1.7.0.4


