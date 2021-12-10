Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.14211.1639175510934267042
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 14:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EEB6B40C62;
	Fri, 10 Dec 2021 22:31:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y420cKU3TwVP; Fri, 10 Dec 2021 22:31:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C627840C82;
	Fri, 10 Dec 2021 22:31:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D825D174711;
	Fri, 10 Dec 2021 17:31:46 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 1/3] build-oesdk.sh,lib/: remove support for multi-machine builds
Date: Fri, 10 Dec 2021 17:31:35 -0500
Message-Id: <1639175497-11553-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639175497-11553-1-git-send-email-denis@denix.org>
References: <1639175497-11553-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Remove support for driving multi-machine builds in parallel and serial modes.

Originally, tisdk-build-scripts could take multiple MACHINES and split them
into 3 lists - ARMv5 (ARM9), ARMv7 (CORTEX) and ARMv8 (AARCH64). Then, it
would split each list further down with up to NUM_*_BUILDS machines into
separate buckets and then drive all buckets in parallel, while cycling through
individual machines in each bucket sequentially.

With the introduction of scalable multi-node build farms, this functionality
hasn't been used for years, so remove it to significantly simplify the code.

Add a check that only a single machine is specified in the MACHINES variable
of the config file being processes.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 build-oesdk.sh                       | 128 ++++++-----------------------------
 lib/oesdk/bitbake-test-sdk-image     | 107 +++++++++++------------------
 lib/oesdk/config-build-env           |  34 ++--------
 lib/oesdk/machine-specific-functions |  68 -------------------
 4 files changed, 65 insertions(+), 272 deletions(-)
 delete mode 100644 lib/oesdk/machine-specific-functions

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 9534d99..77c2019 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -9,18 +9,6 @@ trap 'test -z "`jobs -p`" || kill `jobs -p` > /dev/null 2>&1; echo "I got a sign
 source ./lib/oesdk/config-build-env
 source ./lib/common-functions
 source ./lib/oesdk/bitbake-test-sdk-image
-source ./lib/oesdk/machine-specific-functions
-
-# This variable holds the architectures that are being built based
-# on the machines.
-ARCHS=""
-
-# Variables to hold lists of machines sorted by architecture
-ARM9_MACHINES=""
-CORTEX_MACHINE=""
-
-# List of all the dynamically created architecture lists
-LISTS=""
 
 if [ -z $LOG_DIR ]
 then
@@ -32,56 +20,6 @@ usage() {
     exit 0
 }
 
-# The purpose of this function is to take an architecture and go through
-# all the machines for that architecture and create a dynamic set of lists
-# that split the machines up for load balancing.
-create_build_lists() {
-    arch="$1"
-    eval t_machines="$""$arch""_MACHINES"
-    eval t_num_builds="$""NUM_""$arch""_BUILDS"
-
-    # Go through the list of machines per architecture and add the machines
-    # to the list of machines to build in a round robbin fashion.  So for
-    # example if you allow two builds for CORTEX architecture then the
-    # following lists will be created and populated:
-    #    CORTEX_1 = mach1 mach3 mach5
-    #    CORTEX_2 = mach2 mach4
-    # NOTE: If this is a build with an existing build directory then
-    #       there will be a check as to whether or not a machine has
-    #       already been built in a particular directory.  If so it
-    #       will be added to the list for that directory to make the
-    #       build shorter.  Any other machines will be load balanced on
-    #       top of the existing machines.
-    counter=0
-    for m in $t_machines
-    do
-        # Check if machine is already built in a build directory and if so
-        # Add it to that list.
-        list=`find ./build-* -maxdepth 1 -name "machines" | xargs grep -H $m`
-        if [ "$?" == "0" ]
-        then
-            # We have found a match, so now get the list name
-            list=`echo $list | cut -d: -f1 | xargs dirname | cut -d- -f2`
-        else
-            counter=`expr $counter + 1`
-            list="$arch""_$counter"
-        fi
-        eval $list="$""$list,$m"
-
-        # Go ahead and add the list to a raw list of all the lists.  We will
-        # sort this for unique values later.
-        LISTS="$LISTS""\n""$list"
-	if [ "$counter" == "$t_num_builds" ]
-        then
-            counter="0"
-        fi
-    done
-
-    # Sort the list of architecture lists for unique values
-    LISTS=`echo -e $LISTS | sort | uniq`
-}
-
-
 ###############
 # Main Script #
 ###############
@@ -118,20 +56,28 @@ fi
 
 check_mandatory_inputs $MANDATORY_INPUTS
 
+if [ `echo $MACHINES | wc -w` != 1 ]
+then
+    echo "Only a single machine must be specified"
+    exit 1
+fi
+
 # Clean the build if the CLEAN Flags are set
 if [ "$CLEAN_ALL" == "true" ]
 then
     echo "Removing $BUILD_ROOT"
     rm -rf $BUILD_ROOT
-elif [ "$CLEAN_BUILD" == "true" ]
-then
-    echo "Removing $BUILD_ROOT/build-*/arago-tmp-*"
-    rm -rf $BUILD_ROOT/build-*/arago-tmp-*
-fi
-if [ "$CLEAN_SSTATE" == "true" ]
-then
-    echo "Removing $BUILD_ROOT/build-*/sstate-cache"
-    rm -rf $BUILD_ROOT/build-*/sstate-cache
+else
+    if [ "$CLEAN_BUILD" == "true" ]
+    then
+        echo "Removing $BUILD_ROOT/build/arago-tmp-*"
+        rm -rf $BUILD_ROOT/build/arago-tmp-*
+    fi
+    if [ "$CLEAN_SSTATE" == "true" ]
+    then
+        echo "Removing $BUILD_ROOT/build/sstate-cache"
+        rm -rf $BUILD_ROOT/build/sstate-cache
+    fi
 fi
 
 # Make the directory structure leading up to BUILD_ROOT.  BUILD_ROOT will
@@ -155,44 +101,8 @@ rm -rf $LOG_DIR/*
 # The rest of this script will assume we are running from BUILD_ROOT
 cd $BUILD_ROOT
 
-# Configure the basic build root.  The individual build directories will
-# be configured later
-log $general_log configure_build_root
-
-# Parse the list of machines to sort them into the <ARCH>_MACHINES lists
-# and create the list of architectures being built.
-parse_machines
-
-# Create the set of "lists" of machines to build.  These are the load-balanced
-# lists that will be run through as parallel builds in the build process.
-create_build_lists "CORTEX"
-create_build_lists "ARM9"
-create_build_lists "AARCH64"
-
-# Go through the list of "lists" and configure the individual build
-# directories for each one
-for l in $LISTS
-do
-    # This will also set the local.conf and setenv values
-    log $general_log config_build_dir $l &
-done
-
-# Wait for the configurations to finish before starting the builds
-wait
-
-# Remove the original "build" directory to prevent confusion and force
-# regenerating it on each update
-rm -rf "$BUILD_ROOT/build"
-
-# Go through the list of "lists" and kick off parallel build and test processes
-for l in $LISTS
-do
-    # Start the SDK build bitbake process
-#    eval bitbake_sdk_images \$"$l" &
-    bitbake_sdk_images $l &
-done
+log $general_log config_build_dir
 
-# Wait for all build and test processes to finish
-wait
+bitbake_sdk_images
 
 echo "Build Finished"
diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 35110aa..09d0d04 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -15,22 +15,9 @@ fi
 # content, then call to the opentest system (if so desired) while starting the
 # next build.
 bitbake_sdk_images(){
-    list="$1"
-    eval machines=\$$list
-    build_dir="$BUILD_ROOT/build-$list"
-
-    # Add the proper toolchain to the PATH
-    add_toolchain_to_path $list
+    build_dir="$BUILD_ROOT/build"
 
     # Export secure device signing tools
-    if [ ! -z $TI_SECURE_DEV_PKG_AM4 ]
-    then
-        export TI_SECURE_DEV_PKG_AM4
-    fi
-    if [ ! -z $TI_SECURE_DEV_PKG_DRA7 ]
-    then
-        export TI_SECURE_DEV_PKG_DRA7
-    fi
     if [ ! -z $TI_SECURE_DEV_PKG_CAT ]
     then
         export TI_SECURE_DEV_PKG_CAT
@@ -43,10 +30,6 @@ bitbake_sdk_images(){
     then
         export TI_SECURE_DEV_PKG_K3
     fi
-    if [ ! -z $SYSFW_FILE ]
-    then
-        export SYSFW_FILE
-    fi
 
     # Change directory into the build directory for this list of machines
     cd $build_dir
@@ -54,66 +37,56 @@ bitbake_sdk_images(){
     # Source the setenv script to get ready for building
     source ./conf/setenv
 
-    # Preserve default delimiter
     OLD_IFS="$IFS"
-
-    # Use semicolon as delimiter
     IFS=";"
-
     bitbake_command_list=( $BITBAKE_COMMAND )
-
-    # Restore delimiter
     IFS="$OLD_IFS"
 
-    for m in `IFS=","; echo $machines`
-    do
-
-        # Build status is required when allowing multiple build commands because
-        # you may break the inner for loop on a failure and you want to make
-        # sure that you don't run the test step against a broken build
-        build_status="pass"
+    m=$MACHINES
 
-        for c in "${bitbake_command_list[@]}"
-        do
-            log $machine_build_log echo "executing bitbake command $c for machine $m"
-            if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
-                MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c 2>&1 | eval tee -a $machine_build_log
-            else
-                MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c
-            fi
+    # Build status is required when allowing multiple build commands because
+    # you may break the inner for loop on a failure and you want to make
+    # sure that you don't run the test step against a broken build
+    build_status="pass"
 
-            # Check the return status of the build process.  If the build returned
-            # a non-zero exit value then log the failure and continue (without
-            # testing).  A lack of a test file will indicate a test skip
-            if [ "${PIPESTATUS[0]}" != "0" ]
+    # cycle through defined bitbake commands
+    for c in "${bitbake_command_list[@]}"
+    do
+        log $machine_build_log echo "executing bitbake command $c for machine $m"
+        if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
+            MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c 2>&1 | eval tee -a $machine_build_log
+        else
+            MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c
+        fi
+
+        # Check the return status of the build process.  If the build returned
+        # a non-zero exit value then log the failure and continue (without
+        # testing).  A lack of a test file will indicate a test skip
+        if [ "${PIPESTATUS[0]}" != "0" ]
+        then
+            echo "FAILED" > $LOG_DIR/$m-build-result.txt
+            build_status="fail"
+            if [ "$BUILD_LOG_VERBOSE" = "true" ]
             then
-                echo "FAILED" > $LOG_DIR/$m-build-result.txt
-                build_status="fail"
-
-                if [ "$BUILD_LOG_VERBOSE" = "true" ]; then
-                    # Parse the build_log to obtain the individual recipe error logs.
-                    mkdir -p ${LOG_DIR}/${m}-error-logs
-                    ERR_LOGS=`eval grep \"^ERROR: Logfile\" \"$machine_build_log\" | sed -e 's|^.*:||g'`
-                    for err_log in $ERR_LOGS; do
-                        err_log_name=`echo $err_log | sed -e 's|^.*/\(.*\)/\(.*\)/temp/log\.\(.*\)\.\(.*\)|\1_\2_\3|g'`
-                        cp $err_log ${LOG_DIR}/${m}-error-logs/${err_log_name}.log
-                    done
-                fi
-                break;
-            else
-                echo "PASSED" > $LOG_DIR/$m-build-result.txt
+                # Parse the build_log to obtain the individual recipe error logs.
+                mkdir -p ${LOG_DIR}/${m}-error-logs
+                ERR_LOGS=`eval grep \"^ERROR: Logfile\" \"$machine_build_log\" | sed -e 's|^.*:||g'`
+                for err_log in $ERR_LOGS
+                do
+                    err_log_name=`echo $err_log | sed -e 's|^.*/\(.*\)/\(.*\)/temp/log\.\(.*\)\.\(.*\)|\1_\2_\3|g'`
+                    cp $err_log ${LOG_DIR}/${m}-error-logs/${err_log_name}.log
+                done
             fi
-        done
-
-        # Move the bitbake-cooker.log as some errors may get hidden in there.
-        #
-        # If it does not exist, then there is not much we can do, so inhibit the
-        # error code.
-        mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log || true
+            break;
+        else
+            echo "PASSED" > $LOG_DIR/$m-build-result.txt
+        fi
     done
 
-    # Wait for all build/test processes to finish before exiting
-    wait
+    # Move the bitbake-cooker.log as some errors may get hidden in there.
+    # If it does not exist, then there is not much we can do, so inhibit the
+    # error code.
+    mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log || true
 
     return 0
 }
diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 7f914ba..6f500cd 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -47,8 +47,8 @@ checkout_layer_scripts() {
     else
         # This looks to be a git repo.  Hopefully it is the right one :)
         cd $BUILD_ROOT
-	# In case we have changed the location of our build scripts
-	# we should change our git url towards it.
+        # In case we have changed the location of our build scripts
+        # we should change our git url towards it.
         mygit='git remote get-url  origin'
         if [ "$mygit" != "$TI_SDK_OELAYER_SETUP" ]; then
             echo "$TI_SDK_OELAYER_SETUP Mismatch in git URL: $mygit vs $TI_SDK_OELAYER_SETUP. Force resetting the origin!"
@@ -60,40 +60,18 @@ checkout_layer_scripts() {
     fi
 }
 
-# Run the oe-layertool-setup.sh script to checkout/update the git repositories
-# based on the configuration setting.
-#   - The config file used is the one from the CONFIG_FILE variable in the
-#     build script config file.
-configure_build_root() {
-    ./oe-layertool-setup.sh -r -f ${CONFIG_FILE}
-}
-
 # This function will create the build directory a given build list with
 # the following features:
-#   1. A "machines" file containing the list of machines this directory
-#      is configured to build for
-#   2. Modify the conf/local.conf to point to the following:
+#   1. Modify the conf/local.conf to point to the following:
 #       - DL_DIR = DL_DIR
 #       - SSTATE_DIR = BUILD_ROOT/sstate-cache
 #       - TMPDIR = BUILD_ROOT/<build dir>/arago-tmp
 #       - DEPLOY_DIR = BUILD_ROOT/<build dir>/deploy
-#   3. Modify the conf/setenv file to point to the following:
+#   2. Modify the conf/setenv file to point to the following:
 #       - BUILDDIR=BUILD_ROOT/<build dir>
 config_build_dir() {
-    list="$1"
-
-    # Print the list of machines in each build list for the log
-    eval t_machines=\$$list
-    t_machines=`echo $t_machines | sed 's/,/ /g'`
-    log $general_log echo "Machines in $list = $t_machines"
-
-    build_dir="build-$list"
-
-    # Copy the template "build" directory to the list specific name
-    cp -rf build $build_dir
-
-    # Write the list of machines for future builds
-    echo "$t_machines" > $build_dir/machines
+    ./oe-layertool-setup.sh -r -f ${CONFIG_FILE}
+    build_dir="build"
 
     # Change directory into build_dir/conf to make life easier here.
     # Change back when done.
diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
deleted file mode 100644
index 31baa81..0000000
--- a/lib/oesdk/machine-specific-functions
+++ /dev/null
@@ -1,68 +0,0 @@
-#!/bin/bash
-
-# This script will contain the functions that are "machine" specific.  What
-# this means is that this should be where new machines are added and the
-# rest of the script should work as-is
-
-# This script is intended to be called only from the top-level build-oesdk.sh
-# script which parses the configuration file and sets necessary variables.
-# So check if it is being called from any other context and if so exit.
-if [ "`basename $0`" != "build-oesdk.sh" ]
-then
-    log $error_log echo "This is a helper script and should not be run directly"
-    exit 1
-fi
-
-parse_machines() {
-    for m in $MACHINES
-    do
-        case $m in
-            am180x-evm | omapl138-lcdk )
-                ARM9_MACHINES="$ARM9_MACHINES"" $m"
-                ARCHS="$ARCHS""\n""ARM9"
-                ;;
-            am335x-evm | am335x-hs-evm | am437x-evm | am437x-hs-evm | am37x-evm | am3517-evm | k2hk-evm | k2hk-hs-evm | k2e-evm | k2e-hs-evm | k2g-evm | k2g-hs-evm | k2g-ice | k2l-evm | k2l-hs-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | dra7xx-hs-evm | am57xx-evm | am57xx-hs-evm )
-                CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
-                ARCHS="$ARCHS""\n""CORTEX"
-                ;;
-            am64xx-evm | am64xx-hs-evm | am65xx-evm | am65xx-hs-evm | j7-evm | j7-hs-evm | j7200-evm | j7200-hs-evm )
-                AARCH64_MACHINES="$AARCH64_MACHINES"" $m"
-                ARCHS="$ARCHS""\n""AARCH64"
-                ;;
-            * )
-                log $error_log echo "Unknown machine ($m) specified"
-                exit 1
-                ;;
-        esac
-    done
-
-    # Sort the list of architectures to get the unique set
-    ARCHS=`echo -e $ARCHS | sort | uniq`
-}
-
-add_toolchain_to_path() {
-    case $1 in
-        ARM9* )
-            if [ ! -z $TOOLCHAIN_ROOT_ARM9 ]
-            then
-                export PATH="$TOOLCHAIN_ROOT_ARM9:$PATH"
-            fi
-            ;;
-        CORTEX* )
-            if [ ! -z $TOOLCHAIN_ROOT_CORTEX ]
-            then
-                export PATH="$TOOLCHAIN_ROOT_CORTEX:$PATH"
-            fi
-            ;;
-        AARCH64* )
-            if [ ! -z $TOOLCHAIN_ROOT_AARCH64 ]
-            then
-                export PATH="$TOOLCHAIN_ROOT_AARCH64:$PATH"
-            fi
-            ;;
-        * )
-            log $error_log echo "Unknown machine ($m) specified.  Cannot set PATH"
-            exit 1
-            ;;
-    esac
-}
-- 
2.7.4

