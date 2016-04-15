Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2FC24529B3
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 13:30:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3FDUp0M017555
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 08:30:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FDUpw6003782
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 08:30:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 Apr 2016 08:30:51 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3FDUnSB007983;	Fri, 15 Apr 2016 08:30:50 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Apr 2016 19:00:48 +0530
Message-ID: <1460727048-24545-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][PATCH] bvtest: Deprecate this package
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
X-List-Received-Date: Fri, 15 Apr 2016 13:30:53 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/bvtest/bvtest_git.bb          | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb

diff --git a/meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb b/meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb
deleted file mode 100644
index cac8f7f..0000000
--- a/meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "This is a bltsville userspace test application used to test \
-the sanity of bltsville implementation"
-
-HOMEPAGE = "https://git.ti.com/bvtest/bvtest"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fc5539100b9be986fce191b19d2a48ae"
-DEPENDS = "bltsville libdrm"
-
-inherit autotools pkgconfig
-
-PR = "r0"
-SRCREV = "67e76ddf08703bd157935f666030c74a370b2836"
-
-SRC_URI = "git://git.ti.com/bvtest/bvtest.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-
-do_compile() {
-    export CC_PATH=${TOOLCHAIN_PATH}  
-    export CROSS_COMPILE=${TOOLCHAIN_PREFIX}
-    export BLTSVILLESEARCHPATH=${STAGING_DIR_TARGET}/usr
-    cd ${S}/src/bvtest
-    make -f makefile.linux  
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/src/bvtest/bvtest ${D}${bindir}
-}
-- 
1.9.1


