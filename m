Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 19EAC52A98
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:28:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LSgW5024411
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LSgIk003590
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:42 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:28:42 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LSV9b016143;
	Mon, 6 May 2013 16:28:40 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:28:25 -0500
Message-ID: <1367875707-8579-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367875707-8579-1-git-send-email-fcooper@ti.com>
References: <1367875707-8579-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/6] ti-crypto-examples: Grab CFLAGS from OE or Rules.make
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
X-List-Received-Date: Mon, 06 May 2013 21:28:43 -0000
Content-Type: text/plain

* When building from OE CFLAGS will be passed in.
* When building from within the sdk CFLAGS from Rules.make will be used.
* This insures the optimal CFLAGS are used which corrects optimization and also
  the correct toolchain settings (ie softfp/hardfp) are used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 648d7dd..78f2d32 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://armv5te/AES/aes_256.c;beginline=9;endline=35;md5=8edb
 SECTION = "console"
 DEPENDS += "openssl"
 
-PR = "r3"
+PR = "r4"
 
 BRANCH ?= "master"
-SRCREV = "95007ae6a4284841e624680afff8e0859f28d429"
+SRCREV = "ade3446fda75f4e07262b6162343a1b8d85521cb"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
@@ -23,7 +23,8 @@ SOURCE_DIR_omapl138 = "${S}/armv5te"
 
 do_compile() {
     cd ${SOURCE_DIR}
-
+    export CROSS_COMPILE=${TARGET_PREFIX}
+    export CFLAGS='${TARGET_CC_ARCH}'
     # build the release version
     oe_runmake release
 }
-- 
1.7.0.4


