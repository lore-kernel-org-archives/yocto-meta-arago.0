Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7389152990
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:11:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFBvIv016996
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:11:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFBvj3014816
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:11:57 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:11:57 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QFBsFf032671;
	Wed, 26 Jun 2013 10:11:55 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 10:24:54 -0500
Message-ID: <1372260299-3134-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/6] av-examples: Pull in updated commit to fix the CCS project file.
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
X-List-Received-Date: Wed, 26 Jun 2013 15:11:58 -0000
Content-Type: text/plain

* The CCS project file now contains symbols that the SDK installer will replace
  with correct values when the SDK is installed.
* This makes it easier to manage changes in the toolchain sdk structure.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../av-examples/av-examples_1.0.bb                 |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
index dec17a8..e797aa5 100644
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM := "file://COPYING;md5=80ea1ff5788f65d5c5b3206d50d4bc6c"
 SECTION = "system"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "virtual/kernel"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(omap3)"
 
 BRANCH ?= "master"
-SRCREV = "87469a47bf91d681f15f0a2eb368fe695b21508c"
+SRCREV = "b67b11011a8a54a7598eed383f3a106c32b47c6d"
 
 SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
 
@@ -22,6 +22,7 @@ S = "${WORKDIR}/git"
 INSANE_SKIP_${PN} = "True"
 
 do_compile() {
+
 	touch debug
 	export CROSS_COMPILE=${TARGET_PREFIX}
 	export CFLAGS='${TARGET_CC_ARCH}'
-- 
1.7.0.4


