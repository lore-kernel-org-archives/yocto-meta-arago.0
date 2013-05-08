Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2B0D452995
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 13:18:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48DIvRg009586
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 08:18:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48DIvth016686
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 08:18:57 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 08:18:56 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r48DIswP016073;
	Wed, 8 May 2013 08:18:55 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 May 2013 08:18:51 -0500
Message-ID: <1368019131-13375-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago: Allow relocate script to hard code SDK_PATH value
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
X-List-Received-Date: Wed, 08 May 2013 13:19:01 -0000
Content-Type: text/plain

* SDK_PATH was previously dynamically determined by using BASHISMS when
  environment-setup was sourced.
* Relocate_sdk.py is required to be ran and the script knows the location of the
  toolchain SDK.
* By having the relocate_sdk script set SDK_PATH we remove the need for
  bashisms from environment-setup.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../meta/meta-toolchain-arago-tisdk.bb             |    2 +-
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    2 +-
 .../recipes-core/meta/meta-toolchain-arago.bb      |   17 +++++------------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 114ae1c..68df1bf 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl
 
 require recipes-core/meta/meta-toolchain-arago-qte.bb
 
-PR = "r2"
+PR = "r3"
 
 toolchain_create_sdk_env_script_append() {
     echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 136ebca..207df4f 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r13"
+PR = "r14"
 
 QT_DIR_NAME = "qtopia"
 
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 699ada7..7f70c42 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -7,7 +7,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= ""
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r23"
+PR = "r24"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
@@ -15,17 +15,7 @@ toolchain_create_sdk_env_script () {
 	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
 	rm -f $script
 	touch $script
-	echo 'SDK_PATH="${SDKPATH}"' >> $script
-	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ]; then' >> $script
-	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup\""' >> $script
-	echo '    exit 1' >> $script
-	echo 'else' >> $script
-	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
-	echo '        SDK_PATH="`dirname $BASH_SOURCE`"' >> $script
-	echo '    fi' >> $script
-	echo '    SDK_PATH=`readlink -f "$SDK_PATH"`' >> $script
-	echo '    export SDK_PATH' >> $script
-	echo 'fi' >> $script
+	echo 'export SDK_PATH="${SDKPATH}"' >> $script
 	echo 'export SDK_SYS=${SDK_SYS}' >> $script
 	echo 'export TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script
 	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
@@ -234,6 +224,9 @@ for env_setup_script in `ls $target_sdk_dir/environment-setup*`; do
 	$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:g" -i $env_setup_script
 done
 
+# Correct SDK_PATH since the exact installation path is now known
+$SUDO_EXEC sed -i -e "s|export SDK_PATH\=.*|export SDK_PATH=$target_sdk_dir|g" $target_sdk_dir/environment-setup*
+
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$target_sdk_dir/sysroots/${SDK_SYS}
 dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-- 
1.7.0.4


