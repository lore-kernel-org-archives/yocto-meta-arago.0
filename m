Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 2394752A08
	for <meta-arago@arago-project.org>;
	Fri, 10 Oct 2014 18:14:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ND800DATQMUUM10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 10 Oct 2014 13:13:58 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C365E20088; Fri,
	10 Oct 2014 14:13:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Oct 2014 14:13:42 -0400
Message-id: <1412964822-11881-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] meta-toolchain-arago*: fix breakage of linux-devkit due to API changes
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
X-List-Received-Date: Fri, 10 Oct 2014 18:14:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Similar to tisdk-image.bbclass, some SDK generating code has been moved to
corresponding Python lib code, breaking APIs used in meta-toolchain-arago*
recipes. Adjust the code for the new API and align with the way linux-devkit
was historically made.
Some Qt5 specifics also changed lately, adjust accordingly, but trying not
to break backward compatibility with Qt4.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/meta-toolchain-arago-tisdk.bb             |  4 +-
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |  9 +--
 .../recipes-core/meta/meta-toolchain-arago.bb      | 80 +++++++++++++++++-----
 3 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 68df1bf..6768ac8 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -1,10 +1,10 @@
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-toolchain-tisdk-target"
 TOOLCHAIN_SUFFIX ?= "-tisdk"
-TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"
+TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev coreutils"
 
 require recipes-core/meta/meta-toolchain-arago-qte.bb
 
-PR = "r3"
+PR = "r4"
 
 toolchain_create_sdk_env_script_append() {
     echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 25d5641..9aa29ca 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,13 +5,14 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r18"
+PR = "r19"
 
 # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
 QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
 QT_BIN_PREFIX = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT_DIR_NAME}/", '', d)}"
 QT_BIN_SUFFIX = "${@base_conditional('QT_PROVIDER', 'qt5', '', '4', d)}"
 QT_MKSPECS_LOCATION = "${@base_conditional('QT_PROVIDER', 'qt5', "${libdir}", "${datadir}", d)}"
+QT_MKSPECS_DIR = "${@base_conditional('QT_PROVIDER', 'qt5', "linux-oe-g++", "linux-gnueabi-oe-g++", d)}"
 
 toolchain_create_sdk_env_script_append() {
 	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $script
@@ -33,7 +34,7 @@ toolchain_create_sdk_env_script_append() {
 	echo 'export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbusxml2cpp${QT_BIN_SUFFIX}' >> $script
 	echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
 	echo 'export OE_QMAKE_STRIP="echo"' >> $script
-	echo 'export QMAKESPEC=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/linux-gnueabi-oe-g++' >> $script
+	echo 'export QMAKESPEC=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/${QT_MKSPECS_DIR}' >> $script
 	echo 'export QMAKE_DEFAULT_LIBDIRS=${QT_QMAKE_LIBDIR_QT}' >> $script
 	echo 'export QMAKE_DEFAULT_INCDIRS=${QT_QMAKE_INCDIR_QT}' >> $script
 
@@ -49,7 +50,7 @@ toolchain_create_sdk_env_script_append() {
 	echo 'HostPrefix = $(SDK_PATH_NATIVE)' >> $qt_conf
 	echo 'HostBinaries = $(OE_QMAKE_HOST_BINDIR_QT)' >> $qt_conf
 
-	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
-	# and QTCreator
+	# make a symbolic link to mkspecs for compatibility with Qt SDK and QTCreator
 	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
+	(cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; ln -sf ../${REAL_MULTIMACH_TARGET_SYS}${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index ff74a95..9359e92 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,13 +4,11 @@ TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
 TOOLCHAIN_CLEANUP_PACKAGES ?= ""
+SDKIMAGE_FEATURES = ""
 
 require recipes-core/meta/meta-toolchain.bb
 
-# Add in linux-libc-headers version so that is taken into consideration
-REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-${TARGET_OS}"
-
-PR = "r28"
+PR = "r29"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
@@ -64,7 +62,9 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
-populate_sdk_ipk_append () {
+SDK_POSTPROCESS_COMMAND += "arago_sdk_fixup; "
+
+arago_sdk_fixup () {
 	# Remove broken .la files
 	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
 		rm -f $i
@@ -122,7 +122,7 @@ cleanup_toolchain_packages() {
 	then
 		# Clean up the native side of the toolchain
 		opkg_dir="${SDK_OUTPUT}/${SDKPATHNATIVE}"
-		opkg_conf="${opkg_dir}/etc/opkg-sdk.conf"
+		opkg_conf="${SDK_OUTPUT}/etc/opkg-sdk.conf"
 		opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
 
 		# Clean up the target side of the toolchain
@@ -162,7 +162,10 @@ TMPSDKPATH="${SDKPATH}"
 SUDO_EXEC=""
 target_sdk_dir=""
 answer=""
-while getopts ":yd:" OPT; do
+relocate=1
+savescripts=0
+verbose=0
+while getopts ":yd:DRS" OPT; do
 	case $OPT in
 	y)
 		answer="Y"
@@ -171,15 +174,33 @@ while getopts ":yd:" OPT; do
 	d)
 		target_sdk_dir=$OPTARG
 		;;
+	D)
+		verbose=1
+		;;
+	R)
+		relocate=0
+		savescripts=1
+		;;
+	S)
+		savescripts=1
+		;;
 	*)
 		echo "Usage: $(basename $0) [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
+		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
+		echo "  -S         Save relocation scripts"
+		echo "  -R         Do not relocate executables"
+		echo "  -D         use set -x to see what is going on"
 		exit 1
 		;;
 	esac
 done
 
+if [ $verbose = 1 ] ; then
+	set -x
+fi
+
 printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
 if [ "$target_sdk_dir" = "" ]; then
 	read target_sdk_dir
@@ -188,11 +209,16 @@ else
 	echo "$target_sdk_dir"
 fi
 
-eval target_sdk_dir=$target_sdk_dir
-if [ -d $target_sdk_dir ]; then
-	target_sdk_dir=$(cd $target_sdk_dir; pwd)
+eval target_sdk_dir=$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
+if [ -d "$target_sdk_dir" ]; then
+	target_sdk_dir=$(cd "$target_sdk_dir"; pwd)
 else
-	target_sdk_dir=$(readlink -m $target_sdk_dir)
+	target_sdk_dir=$(readlink -m "$target_sdk_dir")
+fi
+
+if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
+	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
+	exit 1
 fi
 
 if [ -e "$target_sdk_dir/environment-setup*" ]; then
@@ -256,12 +282,25 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -executable)
-$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
-if [ $? -ne 0 ]; then
-	echo "SDK could not be set up. Relocate script failed. Abort!"
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec file '{}' \;| grep "\(executable\|dynamically linked\)" | cut -f 1 -d ':')
+
+tdir=`mktemp -d`
+if [ x$tdir = x ] ; then
+	echo "SDK relocate failed, could not create a temporary directory"
 	exit 1
 fi
+echo "#!/bin/bash" > $tdir/relocate_sdk.sh
+echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
+$SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
+$SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
+rm -rf $tdir
+if [ $relocate = 1 ] ; then
+	$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
+	if [ $? -ne 0 ]; then
+		echo "SDK could not be set up. Relocate script failed. Abort!"
+		exit 1
+	fi
+fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
 $SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$TMPSDKPATH:$target_sdk_dir:g"
@@ -271,11 +310,20 @@ for l in $($SUDO_EXEC find $native_sysroot -type l); do
 	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:") $l
 done
 
+# find out all perl scripts in $native_sysroot and modify them replacing the
+# host perl with SDK perl.
+for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep "^#!.*perl" -l '{}' \;); do
+	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
+		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
+done
+
 echo done
 
 # delete the relocating script, so that user is forced to re-run the installer
 # if he/she wants another location for the sdk
-$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py
+if [ $savescripts = 0 ] ; then
+	$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
+fi
 
 echo "SDK has been successfully set up and is ready to be used."
 
-- 
2.1.2


