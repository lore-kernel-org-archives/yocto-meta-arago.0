Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D61BD529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKcUu028478
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKc6p020791
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:38 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C4001355;	Mon, 19 May 2014 14:20:36 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:57 -0500
Message-ID: <1400527207-17021-10-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/19] bvtest: Add bltsville test application
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
X-List-Received-Date: Mon, 19 May 2014 19:20:39 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Migrated from meta-ti-glsdk layer but placed in meta-arago
  since it is not BSP related.  Preserved authorship for
  Mrinmayee
* Updated for upstream:
    * Use install instead of mkdir and cp
    * Use TOOLCHAIN_PREFIX instead of hard coded value
      for CROSS_COMPILE variable setting
    * Added DESCRIPTION value

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-graphics/bvtest/bvtest_git.bb          |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb

diff --git a/meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb b/meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb
new file mode 100644
index 0000000..cac8f7f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "This is a bltsville userspace test application used to test \
+the sanity of bltsville implementation"
+
+HOMEPAGE = "https://git.ti.com/bvtest/bvtest"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fc5539100b9be986fce191b19d2a48ae"
+DEPENDS = "bltsville libdrm"
+
+inherit autotools pkgconfig
+
+PR = "r0"
+SRCREV = "67e76ddf08703bd157935f666030c74a370b2836"
+
+SRC_URI = "git://git.ti.com/bvtest/bvtest.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+
+do_compile() {
+    export CC_PATH=${TOOLCHAIN_PATH}  
+    export CROSS_COMPILE=${TOOLCHAIN_PREFIX}
+    export BLTSVILLESEARCHPATH=${STAGING_DIR_TARGET}/usr
+    cd ${S}/src/bvtest
+    make -f makefile.linux  
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/src/bvtest/bvtest ${D}${bindir}
+}
-- 
1.7.9.5


