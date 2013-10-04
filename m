Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 82A9E5296F
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 19:23:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94JNZAl019780
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 14:23:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94JNZTN003300
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 14:23:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 4 Oct 2013 14:23:35 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94JNVFZ031102;
	Fri, 4 Oct 2013 14:23:33 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Oct 2013 15:09:33 -0500
Message-ID: <1380917373-18870-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3 v3] meta-toolchain-arago: Remove TARGET_SYS env variable
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
X-List-Received-Date: Fri, 04 Oct 2013 19:23:37 -0000
Content-Type: text/plain

* Within environment-setup the TARGET_SYS variable is exported but used
  improperly.
* The value for --target and --host isn't the TARGET_SYS value within the
  environment-setup file but rather the OE variable TARGET_SYS.
* Cross compiling autotools based applications using environment-setup
  results in host and machine not recognized "configure" errors.
* Looking at toolchain-scripts.bbclass it looks like that variable has been
  removed from environment-setup so mimic that change.
* Introduce new REAL_MULTIMACH_TARGET_SYS environment variable since the value
  is reused in several places within environment-setup.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Somehow in my v2 patch an extra dollar sign was added.
Remove this extra symbol.

Version 2 changes:
Replace TARGET_SYS environment variable with REAL_MULTIMACH_TARGET_SYS
environment variable.

 .../recipes-core/meta/meta-toolchain-arago.bb      |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index a8da4dc..cd39b4a 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -30,17 +30,17 @@ toolchain_create_sdk_env_script () {
 	echo '    export SDK_PATH' >> $script
 	echo 'fi' >> $script
 	echo 'export SDK_SYS=${SDK_SYS}' >> $script
-	echo 'export TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script
+	echo 'export REAL_MULTIMACH_TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script
 	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
 	echo 'export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-' >> $script
 	echo 'export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS' >> $script
-	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$TARGET_SYS' >> $script
+	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' >> $script
 	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$PATH' >> $script
 	echo 'export CPATH=$SDK_PATH_TARGET/usr/include:$CPATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH_TARGET' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig' >> $script
 	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
-	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$TARGET_SYS' >> $script
+	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script
 	printf 'export CC=\x24{TOOLCHAIN_PREFIX}gcc\n' >> $script
 	printf 'export CXX=\x24{TOOLCHAIN_PREFIX}g++\n' >> $script
 	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
@@ -52,7 +52,7 @@ toolchain_create_sdk_env_script () {
 	printf 'export OBJCOPY=\x24{TOOLCHAIN_PREFIX}objcopy\n' >> $script
 	printf 'export OBJDUMP=\x24{TOOLCHAIN_PREFIX}objdump\n' >> $script
 	printf 'export STRIP=\x24{TOOLCHAIN_PREFIX}strip\n' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=$TARGET_SYS --host=$TARGET_SYS --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' >> $script
+	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' >> $script
 	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=$SDK_PATH_TARGET"' >> $script
 	echo 'export CFLAGS="$CPPFLAGS"' >> $script
 	echo 'export CXXFLAGS="$CPPFLAGS"' >> $script
-- 
1.7.0.4


