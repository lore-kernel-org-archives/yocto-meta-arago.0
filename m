Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1367452990
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:12:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFC5jm017017
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFC51g015207
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:05 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:12:05 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QFBsFi032671;
	Wed, 26 Jun 2013 10:12:03 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 10:24:57 -0500
Message-ID: <1372260299-3134-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372260299-3134-1-git-send-email-fcooper@ti.com>
References: <1372260299-3134-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/6] ti-crypto-examples: Pull in updated commit to fix the CCS project file.
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
X-List-Received-Date: Wed, 26 Jun 2013 15:12:06 -0000
Content-Type: text/plain

* The CCS project file now contains symbols that the SDK installer will replace
  with correct values when the SDK is installed.
* This makes it easier to manage changes in the toolchain sdk structure.
* Due to this change seperate directories for architectures are no longer
* required.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |   16 +++-------------
 1 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 78f2d32..995d60a 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -1,28 +1,20 @@
 DESCRIPTION = "TI Cryptography Example Applications"
 HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://armv5te/AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5 \
-                    file://armv7a/AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
+LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION = "console"
 DEPENDS += "openssl"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH ?= "master"
-SRCREV = "ade3446fda75f4e07262b6162343a1b8d85521cb"
+SRCREV = "1c6a493600ce1a830611cc5671639c03cc3ebc01"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
-# This software contains two directories depending on ARM architecture
-SOURCE_DIR = "${S}/${ARMPKGARCH}"
-
-# Specify armv5te for ARM9 devices
-SOURCE_DIR_omapl138 = "${S}/armv5te"
-
 do_compile() {
-    cd ${SOURCE_DIR}
     export CROSS_COMPILE=${TARGET_PREFIX}
     export CFLAGS='${TARGET_CC_ARCH}'
     # build the release version
@@ -30,7 +22,5 @@ do_compile() {
 }
 
 do_install() {
-    cd ${SOURCE_DIR}
-
     oe_runmake DESTDIR=${D} install
 }
-- 
1.7.0.4


