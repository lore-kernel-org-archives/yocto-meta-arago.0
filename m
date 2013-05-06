Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9AF7652A4A
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:28:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LSjuM026035
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LSjdW003636
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:45 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:28:44 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LSV9c016143;
	Mon, 6 May 2013 16:28:43 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:28:26 -0500
Message-ID: <1367875707-8579-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367875707-8579-1-git-send-email-fcooper@ti.com>
References: <1367875707-8579-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6] screenshot: Grab CFLAGS from OE or Rules.make
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
X-List-Received-Date: Mon, 06 May 2013 21:28:45 -0000
Content-Type: text/plain

* When building from OE CFLAGS will be passed in.
* When building from within the sdk CFLAGS from Rules.make will be used.
* This insures the optimal CFLAGS are used which corrects optimization and also
  the correct toolchain settings (ie softfp/hardfp) are used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/screenshot/screenshot_1.0.bb  |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
index ed819d0..096aa40 100644
--- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
@@ -4,23 +4,23 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
 SECTION = "graphics"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
-SRCREV = "1f11a23be4386c2ee0387cd12c1a9569c703a3bb" 
+SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
 
 SRC_URI = "git://gitorious.org/screenshot/screenshot.git;protocol=git;branch=${BRANCH}"
 
+
 S = "${WORKDIR}/git"
 
 do_compile() {
     export CROSS_COMPILE=${TARGET_PREFIX}
-    export ARCH=${ARMPKGARCH}
+    export CFLAGS='${TARGET_CC_ARCH}'
     # build the release version
     make release
 }
 
 do_install() {
-    export ARCH=${ARMPKGARCH}
     make DESTDIR=${D} install
 }
-- 
1.7.0.4


