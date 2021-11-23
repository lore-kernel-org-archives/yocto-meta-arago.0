Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.7008.1637640071939759624
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 66BAC40C82;
	Tue, 23 Nov 2021 04:01:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ffDYI5funVB; Tue, 23 Nov 2021 04:01:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4701940C7F;
	Tue, 23 Nov 2021 04:01:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0B4941746E6;
	Mon, 22 Nov 2021 23:01:06 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 06/10] Remove code that extracts and repackages SDK for runtime testing
Date: Mon, 22 Nov 2021 23:00:55 -0500
Message-Id: <1637640060-31733-19-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 lib/oesdk/bitbake-test-sdk-image | 381 ---------------------------------------
 1 file changed, 381 deletions(-)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 51796a6..35110aa 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -10,374 +10,6 @@ then
 fi
 
 
-package_tested_rootfs() {
-    # Set m for logging purposes
-    m="$1"
-
-    nfs_dir="$NFS_ROOT/$m-test"
-
-    # Find the target file system
-    filesys_path="temp/filesystem"
-    filesys=`find ./$filesys_path -name "$FS_FILTER*$FS_IMAGE_TYPE" | xargs basename`
-
-    # Check if the nfs_dir is available.  If it is not available then
-    # this must mean that we exited the test because it could not be
-    # created.  So don't try to re-package the tested NFS file system.
-    if [ -e "$nfs_dir" ]
-    then
-        log $machine_build_log echo "packaging tested rootfs for machine $m"
-        # Since opentest run passed let's do some cleanup of the filesystem
-        # and then repackage it and the SDK tarball so that the SDK will ship
-        # with a pre-booted file system, which reduces out-of-the-box boot
-        # time.
-        sudo rm -rf $nfs_dir/$TEST_SCRIPTS_TGT
-        sudo rm -rf $nfs_dir/etc/pointercal
-        sudo rm -rf $nfs_dir/etc/rc5.d/S90-fake-pointercal
-        sudo rm -rf $nfs_dir/etc/rc5.d/S08-fake-weston-calibrate
-        sudo rm -rf $nfs_dir/etc/dropbear/dropbear_rsa_*
-
-        if [ "$(ls -A $nfs_dir/home/root/)" ]
-        then
-            sudo rm -rf $nfs_dir/home/root/*
-        fi
-
-        # Don't forget to remove the original file system tarball
-        sudo rm -rf $nfs_dir/$filesys
-
-        # Tar up the booted file system
-        rm $test_dir/$filesys_path/$filesys
-        cd $nfs_dir
-
-        # Set the tar options based on FS_IMAGE_TYPE
-        if [ "$FS_IMAGE_TYPE" == "tar.gz" ]
-        then
-            fs_tar_opts="czf"
-        elif [ "$FS_IMAGE_TYPE" == "tar.bz2" ]
-        then
-            fs_tar_opts="cjf"
-        else
-            # default to tar.gz
-            fs_tar_opts="czf"
-        fi
-
-        sudo tar $fs_tar_opts $test_dir/$filesys_path/$filesys *
-        cd $test_dir
-    else
-        log $machine_build_log echo "packaging existing rootfs for machine $m"
-    fi
-
-    if [ ! -z $SDK_FILTER ]
-    then
-        # Re-Tar the SDK
-        rm $test_dir/$sdk_image
-        cd temp
-
-        # Set the tar options based on SDK_IMAGE_TYPE
-        if [ "$SDK_IMAGE_TYPE" == "tar.gz" ]
-        then
-            sdk_tar_opts="czf"
-        elif [ "$SDK_IMAGE_TYPE" == "tar.bz2" ]
-        then
-            sdk_tar_opts="cjf"
-        else
-            # default to tar.gz
-            sdk_tar_opts="czf"
-        fi
-
-        tar $sdk_tar_opts $test_dir/$sdk_image *
-        cd $test_dir
-    fi
-
-    # return back to the build directory
-    cd $build_dir
-
-    return 0
-}
-
-# This function will extract the SDK image.  It is always called because
-# even when we don't do target side testing we still want to extract the
-# image to allow packaging the contents.
-extract_sdk_image() {
-    # Set m for logging purposes
-    m=$1
-
-################################################################################
-# Look inside of the arago-tmp directory in the build directory for this
-# list and find the SDK image tarball for this machine.  Copy the tarball
-# to the test directory
-# First find the arago-tmp directory.  Since the Toolchain becomes part
-# of the name we need to search for it.
-# NOTE: This means that if you switch toolchains you need to do a
-#       CLEAN_BUILD
-# NOTE: The assumption here is that we are still in the directory where
-#       the arago-tmp directory is located
-################################################################################
-    arago_tmp=`ls | grep "arago-tmp-*"`
-
-    # This is a critical failure and will not be able to be skipped
-    if [ "$arago_tmp" == "" ]
-    then
-        echo "Could not find the arago-tmp directory"
-        echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
-        return 1
-    fi
-
-    sdk_path="$arago_tmp/deploy/images"
-
-    # check that the sdk_path exists
-    if [ ! -d $sdk_path ]
-    then
-        echo "Images directory is missing from arago-tmp"
-        echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
-        return 1
-    fi
-
-    # prefer sdk_path/m, if exists - Dora and up
-    if [ -d $sdk_path/$m ]
-    then
-        sdk_path="$sdk_path/$m"
-    fi
-
-################################################################################
-# SDK_FILTER variable is used to specify the SDK image produced by the build,
-# that includes bootloaders, kernel, rootfs, devkit and host tools.
-# When SDK_FILTER is not set, it is assumed the individual piecess needed for
-# testing are built and deployed - bootloaders, kernel and (minimal) rootfs
-#
-# NOTE: For SDK-less builds, we need to re-create the same layout with directory
-#       structure following the extracted SDK image, placing the individual
-#       components in their corresponding locations ($test_dir/temp/filesystem
-#       and $test_dir/temp/board-support/prebuilt-images, so the rest of the
-#       test scripts can find them and work for both SDK and non-SDK cases.
-################################################################################
-    if [ ! -z $SDK_FILTER ]
-    then
-        # This filter is used to get the simple image name instead of the
-        # image name with the date and time added.
-        sdk_image=`find ./$sdk_path -name "$SDK_FILTER*$m.$SDK_IMAGE_TYPE" | xargs basename`
-        # This is a critical failure and will not be able to be skipped
-        if [ "$sdk_image" == "" ]
-        then
-            echo "Could not find the SDK image"
-            echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
-            return 1
-        fi
-
-        cp $sdk_path/$sdk_image $test_dir
-
-        # cd into the test dir and extract the SDK image into a temp directory
-        mkdir -p $test_dir/temp
-        cd $test_dir/temp
-        tar xf $test_dir/$sdk_image
-        cd $test_dir
-    else
-        # Special case of non-SDK build, when SDK_FILTER is not specified
-        mkdir -p $test_dir/temp/filesystem
-        mkdir -p $test_dir/temp/board-support/prebuilt-images
-
-        # Find the target file system
-        filesys=`find ./$sdk_path -name "$FS_FILTER*$m.$FS_IMAGE_TYPE" | xargs basename`
-        # This is a critical failure and will not be able to be skipped
-        if [ -z "$filesys" ]
-        then
-            echo "Could not find the target filesystem image"
-            echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
-            return 1
-        fi
-        cp $sdk_path/$filesys $test_dir/temp/filesystem
-
-        # Find the kernel image
-        kernel=`find ./$sdk_path -name "[uz]Image-$m.bin" | xargs basename`
-        # This is a critical failure and will not be able to be skipped
-        if [ -z "$kernel" ]
-        then
-            echo "Could not find the kernel image"
-            echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
-            return 1
-        fi
-        cp $sdk_path/$kernel $test_dir/temp/board-support/prebuilt-images
-
-        # Find the u-boot image
-        uboot=`find ./$sdk_path -name "u-boot-$m.*" | xargs basename`
-        # This is a critical failure and will not be able to be skipped
-        if [ -z "$uboot" ]
-        then
-            echo "Could not find the u-boot image"
-            echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
-            return 1
-        fi
-        cp $sdk_path/$uboot $test_dir/temp/board-support/prebuilt-images
-
-        # This is NOT a critical failure
-        # Find the mlo image
-        mlo=`find ./$sdk_path -name "MLO-$m" | xargs basename`
-        if [ ! -z "$mlo" ]
-        then
-            cp $sdk_path/$mlo $test_dir/temp/board-support/prebuilt-images
-        else
-            # Find the skern image (special case for Keystone)
-            skern=`find ./$sdk_path -name "skern-$m.bin" | xargs basename`
-            if [ ! -z "$skern" ]
-            then
-                cp $sdk_path/$skern $test_dir/temp/board-support/prebuilt-images
-            else
-                echo "Could not find the MLO/skern image, ignoring"
-            fi
-        fi
-
-        # This is NOT a critical failure
-        # Find the spl/uart image
-        spl=`find ./$sdk_path -name "u-boot-spl.bin-$m" | xargs basename`
-        if [ ! -z "$spl" ]
-        then
-            cp $sdk_path/$spl $test_dir/temp/board-support/prebuilt-images
-        else
-            echo "Could not find the SPL/UART image, ignoring"
-        fi
-
-        cd $test_dir
-    fi
-
-    return 0
-}
-
-# This function will copy the SDK image to the PACKAGE_ROOT
-# This image may be the original image depending on whether the
-# test failed with a critical failure or not.  If it was a critical failure
-# then the packaging step will not find the SDK image and will therefore
-# not run.
-copy_files_to_package_root() {
-    # Set m for logging purposes
-    m=$1
-
-    # Make the machine specific package root
-    package_root="$PACKAGE_ROOT/$m"
-
-    if [ -d $package_root ]
-    then
-        rm -rf $package_root
-    fi
-    mkdir -p $package_root
-
-    # Copy the SDK tarball
-    cp $test_dir/$SDK_FILTER* $package_root
-
-    # Since the SDK is still extracted in the "temp" directory go
-    # ahead and copy the pre-built images and file system files
-    # for the SD card contents.  The rest of the contents will be
-    # packaged in a later step.
-    # Create the boot tarball contents
-    boot_partition="$package_root/boot_partition"
-    mkdir -p $boot_partition
-    cp $test_dir/temp/board-support/prebuilt-images/* $boot_partition/
-
-    # Create the rootfs tarball contents
-    root_partition="$package_root/root_partition"
-    mkdir -p $root_partition
-    cp $test_dir/temp/filesystem/$FS_FILTER*.$FS_IMAGE_TYPE $root_partition/rootfs_partition.$FS_IMAGE_TYPE
-}
-
-copy_golden_image() {
-    # Set m for logging purposes
-    m=$1
-
-    arago_tmp=`ls | grep "arago-tmp-*"`
-
-    # This is a critical failure and will not be able to be skipped
-    if [ "$arago_tmp" == "" ]
-    then
-        echo "Could not find the arago-tmp directory"
-        return 1
-    fi
-
-    img_path="$arago_tmp/deploy/images/$m"
-
-    # check that the img_path exists
-    if [ ! -d $img_path ]
-    then
-        echo "Images directory for machine $m is missing from arago-tmp"
-        return 1
-    fi
-
-    dest_path="golden/"
-    rm -rf $dest_path/$m
-
-    mkdir $dest_path/$m
-    cp -a $img_path $dest_path
-}
-
-test_sdk_image() {
-    # Set m for logging purposes
-    m="$1"
-    test_passed="false"
-
-    # Create a temporary directory to extract the build files to for
-    # testing.  If the directory already exists then delete the old
-    # contents first.
-    test_dir="$TEST_ROOT/$m-test"
-
-    if [ -d $test_dir ]
-    then
-        rm -rf $test_dir
-    fi
-    mkdir -p $test_dir
-
-    # Always extract the SDK so we can package the internal contents,
-    # even if we don't do testing and re-package the tested files.
-    extract_sdk_image $m
-    if [ "$?" != "0" ]
-    then
-        return 1
-    fi
-
-    # Delete old rootfs test directory
-    nfs_dir="$NFS_ROOT/$m-test"
-    if [ -d $nfs_dir ]
-    then
-        # Clean the old directory
-        sudo rm -rf $nfs_dir
-    fi
-
-    # Only run the build testing if the config file says to do so
-    if [ "$RUN_BUILD_TESTS" == "true" ]
-    then
-        run_target_side_test $m
-
-        if [ "$?" != "0" ]
-        then
-            # Check if this was a CRITICAL failure
-            grep "CRITICAL" $LOG_DIR/$m-test-result.txt > /dev/null 2>&1
-            if [ "$?" == "0" -a "$SKIP_TEST_FAILURES" == "false" ]
-            then
-                # This was a critical failure so return without copying
-                # the files
-                return 1
-            fi
-        else
-            echo "PASSED" > $LOG_DIR/$m-test-result.txt
-            test_passed="true"
-        fi
-
-    else
-        echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
-    fi
-
-    # Getting here means that either
-    #   1. The test passed
-    #   2. The test failed with a non-CRITICAL error and SKIP_TEST_FAILURES
-    #      was set to true.
-    package_tested_rootfs $m
-    if [ ! -z $SDK_FILTER ]
-    then
-        copy_files_to_package_root $m
-    fi
-
-    if [ "$test_passed" == "true" -a $COPY_GOLDEN_TO_WEB == "true" ]
-    then
-        copy_golden_image $m
-    fi
-}
-
 # This function receives a comma separated list of machines to build and test.
 # The flow is to do the bitbake operations to generate the images and SDK
 # content, then call to the opentest system (if so desired) while starting the
@@ -478,19 +110,6 @@ bitbake_sdk_images(){
         # If it does not exist, then there is not much we can do, so inhibit the
         # error code.
         mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log || true
-
-        # Only run the build testing if the status of the above builds
-        # was "pass"
-        if [ "$build_status" == "pass" ]
-        then
-            if [ ! "$EXIT_AFTER_BUILD" = "true" ]; then
-                test_sdk_image $m &
-            else
-                echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
-            fi
-        else
-            echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
-        fi
     done
 
     # Wait for all build/test processes to finish before exiting
-- 
2.7.4

