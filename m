Subject: Re: [tisdk-build-scripts][PATCH 05/10] Remove support for generating installer SDK
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:15:29 -0800
References: <1637640060-31733-18-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-18-git-send-email-denis@denix.org>
Message-ID: <32437.1638227729621148490@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="ZYemNER8KOOUpgFfAgPN"

--ZYemNER8KOOUpgFfAgPN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:

>=20
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Jonathan Humphreys <j-humphreys@ti.com>

>=20
> ---
> lib/oesdk/package-sdks | 496 ---------------------------------------
> lib/oesdk/ti-sdk-host-install.sh | 227 ------------------
> 2 files changed, 723 deletions(-)
> delete mode 100644 lib/oesdk/package-sdks
> delete mode 100755 lib/oesdk/ti-sdk-host-install.sh
>=20
> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
> deleted file mode 100644
> index 2316d40..0000000
> --- a/lib/oesdk/package-sdks
> +++ /dev/null
> @@ -1,496 +0,0 @@
> -#!/bin/bash
> -
> -# This script is intended to be called only from the top-level
> build-oesdk.sh
> -# script which parses the configuration file and sets necessary
> variables.
> -# So check if it is being called from any other context and if so exit.
> -if [ "`basename $0`" !=3D "build-oesdk.sh" ]
> -then
> - log $error_log echo "This is a helper script and should not be run
> directly"
> - exit 1
> -fi
> -
> -create_sd_card_content() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> - package_root=3D"$PACKAGE_ROOT/$m"
> -
> - # Make the machine specific SD card directory
> - sd_card_root=3D"$DEPLOY_ROOT/$m/$BUILD_ID/sd_card_contents"
> -
> - if [ -d $sd_card_root ]
> - then
> - rm -rf $sd_card_root
> - fi
> - mkdir -p $sd_card_root
> -
> - # Create the boot_partition tarball. Some of the files such as the
> - # prebuilt images were already staged here during the build/test phase
> - # and just need to be renamed. Others should be copied from the
> - # SD_CARD_CONTENT directory
> - cd $package_root/boot_partition
> -
> - # Rename the pre-built image files
> - if [ -e u-boot-$m.img ]
> - then
> - mv u-boot-$m.img u-boot.img
> - fi
> -
> - # For machines that use older u-boots that do not use .img files
> - if [ -e u-boot-$m.bin ]
> - then
> - mv u-boot-$m.bin u-boot.bin
> - fi
> -
> - # Remove this binary since it wouldn't be used in the boot partition
> - if [ -e u-boot-spl.bin-$m ]
> - then
> - rm u-boot-spl.bin-$m
> - fi
> -
> - # For some devices the uImage/zImage and dtb files are read
> - # from the /boot directory of the rootfs. In this case do
> - # not package the uImage/zImage and device tree files into
> - # the boot partition as it will cause confusion.
> - if [ "$PACKAGE_BOOT_KERNEL_FILES" =3D "true" ]
> - then
> - if [ -e [uz]Image-$m.bin ]
> - then
> - kernel_image=3D`ls [uz]Image-$m.bin | grep -o [uz]Image`
> - mv [uz]Image-$m.bin $kernel_image
> - fi
> - else
> - rm -f [uz]Image*
> - rm -f *.dtb
> - fi
> -
> - # Copy the MLO if it exists for the device
> - if [ -e MLO-$m ]
> - then
> - mv MLO-$m MLO
> - fi
> -
> - # If there are any extra SD card content files for the boot partition
> - # copy them with the -L to resolve symlinks
> - if [ -d "$SD_CARD_CONTENT/$m/boot" ]
> - then
> - cp -rLf $SD_CARD_CONTENT/$m/boot/* .
> - fi
> -
> - # Now tar up the boot_partition.tar.xz file
> - tar cJf $sd_card_root/boot_partition.tar.xz *
> -
> - if [ "$?" !=3D "0" ]
> - then
> - echo "Could not create boot_partition.tar.xz"
> - echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
> - return 1
> - fi
> -
> - # Move the rootfs tarball we already had to the sd_card_root directory
> - cd $package_root/root_partition
> - mv rootfs_partition.$FS_IMAGE_TYPE $sd_card_root/
> -
> - if [ "$?" !=3D "0" ]
> - then
> - echo "Could not mv rootfs_partition.tar.xz"
> - echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
> - return 1
> - fi
> -
> - # Lastly let's package the start_here partition tarball
> - start_here_root=3D"$package_root/start_here_partition"
> - if [ -d "$start_here_root" ]
> - then
> - rm -rf $start_here_root
> - fi
> - mkdir -p $start_here_root
> -
> - cd $start_here_root
> -
> - # Copy the installer
> - cp $DEPLOY_ROOT/$m/$BUILD_ID/${INSTALLER_PREFIX}-$m* $start_here_root/
> -
> - if [ "$?" !=3D "0" ]
> - then
> - echo "Could not copy installer to start_here"
> - echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
> - return 1
> - fi
> -
> - # Copy the rest of the start_here content from the SD_CARD_CONTENT
> - # directory. This usually contains:
> - # - CCS installer
> - # - quickstart guides
> - # - START_HERE.sh scripts (if needed)
> - if [ -d "$SD_CARD_CONTENT/$m/start_here" ]
> - then
> - cp -rLf $SD_CARD_CONTENT/$m/start_here/* .
> - fi
> -
> - # Now tar up the start_here_partition.tar.xz file
> - tar cJf $sd_card_root/start_here_partition.tar.xz *
> -
> - if [ "$?" !=3D "0" ]
> - then
> - echo "Could not create start_here_partition.tar.xz"
> - echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
> - return 1
> - fi
> -
> - # Lastly copy the create-sdcard.sh script for the extracted SDK
> - # directory to the sd_card_root
> - cp $TEST_ROOT/$m-test/temp/bin/create-sdcard.sh $sd_card_root/
> - chmod +x $sd_card_root/create-sdcard.sh
> -
> - # Mark this step as PASSED since we got here
> - echo "PASSED" > $LOG_DIR/$m-build-sdcard.txt
> -}
> -
> -create_sdk_installer() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> - # Make the machine specific installer root
> - installer_root=3D"$INSTALLER_ROOT/$m"
> -
> - if [ -d $installer_root ]
> - then
> - rm -rf $installer_root
> - fi
> - mkdir -p $installer_root
> -
> - # Copy the installer components into the proper directory
> - cp $PACKAGE_ROOT/$m/$SDK_FILTER* $installer_root/
> -
> - # Get the name of the SDK tarball
> - cd $installer_root
> - sdk_tar=3D"`ls $SDK_FILTER*`"
> - cd -
> -
> - ## Custom Install Builder Parameters
> - # sdk_loc - Location of SDK tarball
> - # sdk_tar_nam - SDK tarball name
> - # output_dir - Location to place SDK installer
> - # platform - Machine name
> - # sdk_version - SDK Version
> - # sdk_name_prefix - SDK name Prefix.
> - #
> - # SDK is referred to as ${sdk_name_prefix}-${platform} in the installer
> - # Ex tisdk-am335x
> - # SDK installer is named after
> ${sdk_name_prefix}-${platform}-${sdk_version}-Linux-x86-Install.bin
> - # Ex ti-sdk-am335x-evm-06.00.00.00-Linux-x86-Install.bin
> -
> -
> - $INSTALL_BUILDER/builder build $INSTALL_BUILDER_PROJECT linux --setvars
> \
> - sdk_loc=3D"$installer_root/" \
> - sdk_name_prefix=3D"${INSTALLER_PREFIX}" \
> - sdk_tar_name=3D$sdk_tar \
> - output_dir=3D"$deploy_root" \
> - platform=3D"$m" \
> - sdk_version=3D"$TISDK_VERSION"
> -
> - if [ "$?" !=3D "0" ]
> - then
> - echo "FAILED" > $LOG_DIR/$m-build-installer.txt
> - return 1
> - else
> - echo "PASSED" > $LOG_DIR/$m-build-installer.txt
> - fi
> -}
> -
> -package_web_content() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> - # Create the exports content for the web page
> - exports_root=3D"$deploy_root/exports"
> -
> - if [ -d $exports_root ]
> - then
> - rm -rf $exports_root
> - fi
> - mkdir -p $exports_root
> -
> - # Copy the manifest file if it exists. Pull it from the extracted
> - # SDK directory from the test step.
> - manifest_file=3D"$TEST_ROOT/$m-test/temp/docs/software_manifest.htm"
> - if [ -e $manifest_file ]
> - then
> - cp $manifest_file $exports_root/
> - else
> - echo "Could not package manifest file"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - # Create the PSP tarballs as well
> - # First the sources tarball
> - cd $TEST_ROOT/$m-test/temp
> -
> - tar --exclude=3Dprebuilt-images -cJf
> $exports_root/$m-sdk-src-$TISDK_VERSION.tar.xz board-support/*
> -
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not create SDK sources tarball"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - # Now Create the pre-built binaries tarball. Make a temporary directory
> - # to copy contents to here so that we can get the right extraction name=
.
>=20
> - tmp_dir=3D"$exports_root/${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}"
> - tmp_dir_bs=3D"$tmp_dir/board-support"
> - mkdir -p $tmp_dir_bs
> -
> - cp -rf board-support/prebuilt-images $tmp_dir_bs
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not copy prebuilt-images"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - cp -rf filesystem $tmp_dir/
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not copy file system tarballs"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - cp -rf bin $tmp_dir/
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not copy bin folder"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - # remove scripts which have dependency on devkit
> - rm $tmp_dir/bin/unshallow-repositories.sh
> - rm $tmp_dir/bin/create-ubifs.sh
> -
> - # modify create-sdcard.sh to use the tarball extraction directory
> - sed -i -e "s|ti-sdk.*\[0-9\]|${tmp_dir##*/}|g"
> $tmp_dir/bin/create-sdcard.sh
> -
> - # modify setup-target-nfs.sh to get the absolute path when running the
> scripts
> - # 1. remove the line to set up "SDKinstall" with TI_SDK_PATH
> - sed -i -e '/^SDKinstall/d' $tmp_dir/bin/setup-targetfs-nfs.sh
> -
> - # 2. add the lines before setting dstdefault to get the absolute path o=
f
> the scripts and SDKinstall,
> - # using the same way as in create-sdcard.sh: PWD=3D`pwd`; EXE=3D`echo $=
0 |
> sed s=3D$PWD=3D=3D`;
> - # EXEPATH=3D"$PWD"/"$EXE"; SDKinstall=3D`echo $EXEPATH | grep -o
> .*ti-sdk.*.[0-9]`
> - sed -i -e '/dstdefault=3D$SDKinstall\/targetNFS/i\PWD=3D`pwd`\nEXE=3D`e=
cho $0
> | sed s=3D$PWD=3D=3D`\nEXEPATH=3D"$PWD"/"$EXE"\nSDKinstall=3D`echo $EXEPA=
TH | grep
> -o '.*ti-sdk.*.[0-9]'`\n' $tmp_dir/bin/setup-targetfs-nfs.sh
> -
> - # 3. use the tarball extraction directory for SDKinstall
> - sed -i -e "s|ti-sdk.*\[0-9\]|${tmp_dir##*/}|g"
> $tmp_dir/bin/setup-targetfs-nfs.sh
> -
> - # create Rules.make with variables to be used from the binary package
> - echo "#platform" >> $tmp_dir/Rules.make
> - echo "PLATFORM=3D$m" >> $tmp_dir/Rules.make
> - echo >> $tmp_dir/Rules.make
> -
> - echo "#root of the target file system for installing applications" >>
> $tmp_dir/Rules.make
> - echo "DESTDIR=3D__DESTDIR__" >> $tmp_dir/Rules.make
> - echo >> $tmp_dir/Rules.make
> -
> - echo "# Set EXEC_DIR to install example binaries" >> $tmp_dir/Rules.mak=
e
>=20
> - echo "EXEC_DIR=3D__EXEC_DIR__" >> $tmp_dir/Rules.make
> -
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not create Rules.make"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - cp -f setup.sh $tmp_dir/
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not copy setup.sh"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - cd $exports_root
> - tar cJf $m-sdk-bin-$TISDK_VERSION.tar.xz
> ${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}/*
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not create SDK binaries tarball"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - rm -rf ${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}
> -
> - if [ "$EXPORT_ARAGO_SRC" =3D=3D "1" ]
> - then
> - tar -C $DL_DIR -cJf $exports_root/$m-sdk-arago-src-$TISDK_VERSION.tar.x=
z
> .
> -
> - if [ "$?" !=3D 0 ]
> - then
> - echo "Could not create arago source tarball"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> - fi
> -
> - # Copy any additional web files that are in the WEB_EXTRAS_ROOT
> - # directory.
> - web_extras=3D"$WEB_EXTRAS_ROOT/$m"
> - if [ -d $web_extras ]
> - then
> - cp -rLf $web_extras/* $exports_root/
> - fi
> -
> - # Move the installer into the exports directory
> - mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/
> -
> - # Create the md5sum file
> - cd $exports_root
> - md5sum * > md5sum.txt
> -
> - # If we got here it means everything else passed
> - echo "PASSED" > $LOG_DIR/$m-web-results.txt
> -}
> -
> -generate_webgen_page() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> -
> - webgen_make=3D"$WEBGEN_MAK_ROOT/$m/webgen.mak"
> -
> - if [ ! -e $webgen_make ]
> - then
> - echo "Could not find the webgen file for machine $m"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - return 1
> - fi
> -
> - # Create the ti.com contents directory
> - mkdir -p $deploy_root/ti_com_contents
> -
> - # Copy the webgen file to the deploy directory
> - cd $deploy_root
> - cp $webgen_make .
> -
> - # Generate the web page
> - $WEBGEN_ROOT/webgen_ext webgen.mak $deploy_root/ti_com_contents exports
> -
> - # Cleanup the misc webgen files
> - cleanup_webgen_page $m
> -}
> -
> -# The webgen tool does a couple of things like make a symlink to the
> exports
> -# directory and has a validationinfo file that needs to be removed befor=
e
>=20
> -# copying. If this is not done then we copy double the files, etc.
> -cleanup_webgen_page() {
> - m=3D"$1"
> -
> - content_dir=3D"$deploy_root/ti_com_contents/`grep 'PRODUCT_NAME=3D'
> $webgen_make | sed -e 's/PRODUCT_NAME=3D//g'`/`echo $TISDK_VERSION | tr '=
.'
> '_'`"
> -
> - # Something went wrong here because I can't find the webgen content
> - if [ ! -d $content_dir ]
> - then
> - echo "Could not find the $content_dir"
> - echo "FAILED" > $LOG_DIR/$m-web-results.txt
> - fi
> -
> - # Remove the exports symlink and move the real exports directory into
> its
> - # place
> - rm -rf $content_dir/exports
> - mv $deploy_root/exports $content_dir/
> -
> - # Remove the .validationinfo file
> - rm -f $content_dir/.validationinfo
> -
> - # Remove the webgen.mak file
> - rm -f $deploy_root/webgen.mak
> -}
> -
> -package_individual_sdk() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> - # Make the machine specific deploy root
> - deploy_root=3D"$DEPLOY_ROOT/$m/$BUILD_ID"
> -
> - if [ -d $deploy_root ]
> - then
> - rm -rf $deploy_root
> - fi
> - mkdir -p $deploy_root
> -
> - # Create the SDK installer in the deploy directory
> - create_sdk_installer $m
> -
> - # Create the SD card tarballs in the deploy directory
> - create_sd_card_content $m
> -
> - # Package the SD card and web page contents to get ready for
> - # generating the webgen page and publishing the SDK
> - package_web_content $m
> -
> - if [ "$?" =3D=3D "0" ]
> - then
> - # Since the packaging worked let's generate the ti.com style
> - # web page.
> - generate_webgen_page $m
> - fi
> -}
> -
> -package_sdks(){
> - # Build a list of machines that passed their build and had no
> - # CRITICAL failures. This can be done by looking for the test
> - # results file for each machine. If the test file does not
> - # exist then the build failed. If it does exist and does not
> - # contain the CRITICAL keyword then we can continue with
> - #packaging.
> - machines=3D""
> -
> - for m in $MACHINES
> - do
> - if [ -e $LOG_DIR/$m-build-result.txt ]
> - then
> - # Check if the build failed
> - grep "FAILED" $LOG_DIR/$m-build-result.txt > /dev/null 2>&1
> - if [ "$?" =3D=3D "0" ]
> - then
> - # The build failed so don't package this device
> - continue
> - fi
> -
> - # Check the test results
> - if [ -e $LOG_DIR/$m-test-result.txt ]
> - then
> - # The build at least PASSED
> - # Check if this was a CRITICAL failure
> - grep "CRITICAL" $LOG_DIR/$m-test-result.txt > /dev/null 2>&1
> - if [ "$?" =3D=3D "0" ]
> - then
> - # This was a critical failure so return without copying
> - # the files
> - continue
> - fi
> -
> - # This was a build with a PASSED, SKIPPED, or non-CRITICAL
> - # test result. Add it to the list of machines to package.
> - machines=3D"$machines""$m "
> - fi
> - fi
> - done
> -
> - echo "machines =3D $machines"
> -
> - # Now that the have the list of machines we can call the rest of the
> - # package functions in parallel.
> - for m in $machines
> - do
> - package_individual_sdk $m &
> - done
> -
> - # Wait for the subprocesses to all finish
> - wait
> -}
> diff --git a/lib/oesdk/ti-sdk-host-install.sh
> b/lib/oesdk/ti-sdk-host-install.sh
> deleted file mode 100755
> index 0dc1fa2..0000000
> --- a/lib/oesdk/ti-sdk-host-install.sh
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -# /usr/bin/env bash
> -set -x
> -#
> -# (C) Copyright 2010 Texas Instrument Inc. All rights reserved.
> -#
> -# Author: Schuyler Patton, Texas Instrunents Inc.
> -#
> -# Script to install TI SDK on User Platform
> -#
> -
> -VERSION=3D"1.0"
> -
> -#
> -# Display program usage
> -#
> -usage()
> -{
> - echo "
> -Usage: `basename $1` [options] --machine <machine_name> <install_dir>
> <tools_dir_prefix> <dest_dir>
> -
> - --help Print this help message
> -"
> - exit 1
> -}
> -
> -#
> -# Display version
> -#
> -version()
> -{
> - echo "
> -`basename $1`: version $VERSION
> -"
> - exit 1
> -}
> -
> -
> -#
> -# execute command
> -#
> -execute ()
> -{
> - #echo "$*"
> - $*
> - if [ $? -ne 0 ]; then
> - echo "ERROR: failed to execute $*"
> - exit 1;
> - fi
> -}
> -
> -#
> -# update sdk Rules.make
> -#
> -update_rules_make()
> -{
> - echo "Updating Rules.make"
> - echo "$install_dir"
> -
> - echo "$install_dir">rm_id.out
> - echo "$cross_compile">rm_cc.out
> - echo "$cross_compile_dir">rm_ccd.out
> - echo "$dest_dir">rm_dd.out
> -
> - sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D $install_dir/Rules=
.make
> - sed -i -e
> s=3D__CROSS_COMPILE__=3D$cross_compile_dir/arm-none-linux-gnueabi-=3D
> $install_dir/Rules.make
> -
> - # Find the linux directory name
> - linux=3D`find $install_dir/board-support -maxdepth 1 -name "linux*"`
> - linux=3D`basename $linux`
> - sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D $install_dir/Rules.make
> -
> - # Extract toolchain sdk
> - $install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
> -
> - # Remove toolchain SDK
> - rm $install_dir/linux-devkit.sh
> -
> -# TODO: Unsure about this one here. This likely should change when the
> -# META_SDK_PATH functionality is put back in.
> - echo "Updating prefix in libtoolize "
> - sed -i -e "s|/arago-2012.10|$install_dir/linux-devkit|g" \
> - $install_dir/linux-devkit/bin/libtoolize
> -}
> -
> -#
> -# update example applications CCS project file
> -#
> -update_ccs_project()
> -{
> - cd $install_dir
> -
> - # Grab some essential variables from environment-setup
> - TARGET_SYS=3D`sed -n 's/^export TARGET_SYS=3D//p'
> linux-devkit/environment-setup`
> - TOOLCHAIN_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p'
> linux-devkit/environment-setup`
> - SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' linux-devkit/environment-se=
tup`
> -
> - # Grab toolchain's GCC version
> - GCC_VERSION=3D`ls
> linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
> -
> -
> TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-devkit/sysroots/$TARGET_SYS/usr/inc=
lude"
>=20
> -
> TOOLCHAIN_INCLUDE_DIR=3D"linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOL=
CHAIN_SYS/$GCC_VERSION/include"
>=20
> -
> - # Update CCS project files using important paths to headers
> - find ./example-applications -type f -exec sed -i
> "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
> - find ./example-applications -type f -exec sed -i
> "s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
> - cd -
> -}
> -
> -#
> -# prepare installer tools
> -#
> -prepare_install ()
> -{
> - echo "Preparing installation ..."
> - cwd=3D$PWD;
> -
> - execute "mkdir -p ${install_dir}"
> - mkdir -p ${dest_dir}
> -
> -}
> -
> -#
> -# install sdk
> -#
> -install_sdk ()
> -{
> - sdk_dir=3D$PWD
> - echo "$sdk_dir">is_sdk_dir.out
> - echo "$install_dir">is_id.out
> - echo "$cross_compile">is_cc.out
> - echo "$cross_compile_dir">is_ccd.out
> - echo "$dest_dir">is_dd.out
> - echo "$sdk_pkg">is_sdk_pkg.out
> -
> -# cp -p ti-sdk-ubuntu-env-setup.sh "$install_dir"
> - echo "Untarring top level SDK $sdk_pkg "
> - tar -xf $sdk_pkg -C $install_dir
> - echo "Untarring top level package complete "
> -
> - # Remove any .svn directories that were packaged by the sourceipks
> - rm -rf `find $install_dir -name ".svn"`
> -
> -}
> -
> -install_ccs()
> -{
> -
> -# $install_source/CCS/setup*.bin &
> -
> -echo "install_ccs is $install_ccs">ccs_iccs.out
> -
> -if [ "$install_ccs" =3D "yes" ]; then
> - $install_source/ccs_install.sh $install_source &
> -fi
> -
> -}
> -
> -
> -# Process command line...
> -while [ $# -gt 0 ]; do
> - case $1 in
> - --help | -h)
> - usage $0
> - ;;
> - --version | -v)
> - version $0
> - ;;
> - --sdk_pkg)
> - shift;
> - sdk_pkg=3D$1;
> - ;;
> - --install_dir)
> - shift;
> - install_dir=3D$1;
> - ;;
> - --install_ccs)
> - shift;
> - install_ccs=3D"yes";
> - ;;
> - --install_source)
> - shift;
> - install_source=3D$1
> - ;;
> - *)
> - shift;
> - ;;
> - esac
> -done
> -
> -echo " "
> -echo " Called with --machine $machine --sdk_pkg $sdk_pkg --install_dir
> $install_dir --cross_compile_dir $cross_compile_dir --cross_compile
> $cross_compile ">called-w-param.out
> -echo " "
> -
> -echo "$machine">machid.out
> -echo "$install_dir">id.out
> -echo "$cross_compile">cc.out
> -echo "$cross_compile_dir">ccd.out
> -echo "$dest_dir">dd.out
> -echo "$install_source">tmp/tmp_iss.out
> -echo "$install_source">iss.out
> -
> -# check if install_dir variable is set.
> -test -z $install_dir && usage $0
> -execute "mkdir -p $install_dir"
> -echo "after mkdir ">oops.out
> -
> -# prepare installation.
> -prepare_install
> -echo "after prepare ">oops.out
> -
> -# install sdk
> -install_sdk
> -echo "after install_sdk ">oops.out
> -
> -# install CCS
> -test -d $install_source/CCS;install_ccs
> -
> -# update rules.make
> -update_rules_make
> -
> -# Update example applications CCS project files
> -update_ccs_project
> -
> -echo "Installation completed!"
> -
> -exit 0
> -
> --
> 2.7.4

--ZYemNER8KOOUpgFfAgPN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />lib/oesdk/package-sdks | 496 -------------------------=
--------------<br />lib/oesdk/ti-sdk-host-install.sh | 227 ----------------=
--<br />2 files changed, 723 deletions(-)<br />delete mode 100644 lib/oesdk=
/package-sdks<br />delete mode 100755 lib/oesdk/ti-sdk-host-install.sh<br /=
><br />diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks<br />de=
leted file mode 100644<br />index 2316d40..0000000<br />--- a/lib/oesdk/pac=
kage-sdks<br />+++ /dev/null<br />@@ -1,496 +0,0 @@<br />-#!/bin/bash<br />=
-<br />-# This script is intended to be called only from the top-level buil=
d-oesdk.sh<br />-# script which parses the configuration file and sets nece=
ssary variables.<br />-# So check if it is being called from any other cont=
ext and if so exit.<br />-if [ "`basename $0`" !=3D "build-oesdk.sh" ]<br /=
>-then<br />- log $error_log echo "This is a helper script and should not b=
e run directly"<br />- exit 1<br />-fi<br />-<br />-create_sd_card_content(=
) {<br />- # Set m for logging purposes<br />- m=3D"$1"<br />-<br />- packa=
ge_root=3D"$PACKAGE_ROOT/$m"<br />-<br />- # Make the machine specific SD c=
ard directory<br />- sd_card_root=3D"$DEPLOY_ROOT/$m/$BUILD_ID/sd_card_cont=
ents"<br />-<br />- if [ -d $sd_card_root ]<br />- then<br />- rm -rf $sd_c=
ard_root<br />- fi<br />- mkdir -p $sd_card_root<br />-<br />- # Create the=
 boot_partition tarball. Some of the files such as the<br />- # prebuilt im=
ages were already staged here during the build/test phase<br />- # and just=
 need to be renamed. Others should be copied from the<br />- # SD_CARD_CONT=
ENT directory<br />- cd $package_root/boot_partition<br />-<br />- # Rename=
 the pre-built image files<br />- if [ -e u-boot-$m.img ]<br />- then<br />=
- mv u-boot-$m.img u-boot.img<br />- fi<br />-<br />- # For machines that u=
se older u-boots that do not use .img files<br />- if [ -e u-boot-$m.bin ]<=
br />- then<br />- mv u-boot-$m.bin u-boot.bin<br />- fi<br />-<br />- # Re=
move this binary since it wouldn't be used in the boot partition<br />- if =
[ -e u-boot-spl.bin-$m ]<br />- then<br />- rm u-boot-spl.bin-$m<br />- fi<=
br />-<br />- # For some devices the uImage/zImage and dtb files are read<b=
r />- # from the /boot directory of the rootfs. In this case do<br />- # no=
t package the uImage/zImage and device tree files into<br />- # the boot pa=
rtition as it will cause confusion.<br />- if [ "$PACKAGE_BOOT_KERNEL_FILES=
" =3D "true" ]<br />- then<br />- if [ -e [uz]Image-$m.bin ]<br />- then<br=
 />- kernel_image=3D`ls [uz]Image-$m.bin | grep -o [uz]Image`<br />- mv [uz=
]Image-$m.bin $kernel_image<br />- fi<br />- else<br />- rm -f [uz]Image*<b=
r />- rm -f *.dtb<br />- fi<br />-<br />- # Copy the MLO if it exists for t=
he device<br />- if [ -e MLO-$m ]<br />- then<br />- mv MLO-$m MLO<br />- f=
i<br />-<br />- # If there are any extra SD card content files for the boot=
 partition<br />- # copy them with the -L to resolve symlinks<br />- if [ -=
d "$SD_CARD_CONTENT/$m/boot" ]<br />- then<br />- cp -rLf $SD_CARD_CONTENT/=
$m/boot/* .<br />- fi<br />-<br />- # Now tar up the boot_partition.tar.xz =
file<br />- tar cJf $sd_card_root/boot_partition.tar.xz *<br />-<br />- if =
[ "$?" !=3D "0" ]<br />- then<br />- echo "Could not create boot_partition.=
tar.xz"<br />- echo "FAILED" &gt; $LOG_DIR/$m-build-sdcard.txt<br />- retur=
n 1<br />- fi<br />-<br />- # Move the rootfs tarball we already had to the=
 sd_card_root directory<br />- cd $package_root/root_partition<br />- mv ro=
otfs_partition.$FS_IMAGE_TYPE $sd_card_root/<br />-<br />- if [ "$?" !=3D "=
0" ]<br />- then<br />- echo "Could not mv rootfs_partition.tar.xz"<br />- =
echo "FAILED" &gt; $LOG_DIR/$m-build-sdcard.txt<br />- return 1<br />- fi<b=
r />-<br />- # Lastly let's package the start_here partition tarball<br />-=
 start_here_root=3D"$package_root/start_here_partition"<br />- if [ -d "$st=
art_here_root" ]<br />- then<br />- rm -rf $start_here_root<br />- fi<br />=
- mkdir -p $start_here_root<br />-<br />- cd $start_here_root<br />-<br />-=
 # Copy the installer<br />- cp $DEPLOY_ROOT/$m/$BUILD_ID/${INSTALLER_PREFI=
X}-$m* $start_here_root/<br />-<br />- if [ "$?" !=3D "0" ]<br />- then<br =
/>- echo "Could not copy installer to start_here"<br />- echo "FAILED" &gt;=
 $LOG_DIR/$m-build-sdcard.txt<br />- return 1<br />- fi<br />-<br />- # Cop=
y the rest of the start_here content from the SD_CARD_CONTENT<br />- # dire=
ctory. This usually contains:<br />- # - CCS installer<br />- # - quickstar=
t guides<br />- # - START_HERE.sh scripts (if needed)<br />- if [ -d "$SD_C=
ARD_CONTENT/$m/start_here" ]<br />- then<br />- cp -rLf $SD_CARD_CONTENT/$m=
/start_here/* .<br />- fi<br />-<br />- # Now tar up the start_here_partiti=
on.tar.xz file<br />- tar cJf $sd_card_root/start_here_partition.tar.xz *<b=
r />-<br />- if [ "$?" !=3D "0" ]<br />- then<br />- echo "Could not create=
 start_here_partition.tar.xz"<br />- echo "FAILED" &gt; $LOG_DIR/$m-build-s=
dcard.txt<br />- return 1<br />- fi<br />-<br />- # Lastly copy the create-=
sdcard.sh script for the extracted SDK<br />- # directory to the sd_card_ro=
ot<br />- cp $TEST_ROOT/$m-test/temp/bin/create-sdcard.sh $sd_card_root/<br=
 />- chmod +x $sd_card_root/create-sdcard.sh<br />-<br />- # Mark this step=
 as PASSED since we got here<br />- echo "PASSED" &gt; $LOG_DIR/$m-build-sd=
card.txt<br />-}<br />-<br />-create_sdk_installer() {<br />- # Set m for l=
ogging purposes<br />- m=3D"$1"<br />-<br />- # Make the machine specific i=
nstaller root<br />- installer_root=3D"$INSTALLER_ROOT/$m"<br />-<br />- if=
 [ -d $installer_root ]<br />- then<br />- rm -rf $installer_root<br />- fi=
<br />- mkdir -p $installer_root<br />-<br />- # Copy the installer compone=
nts into the proper directory<br />- cp $PACKAGE_ROOT/$m/$SDK_FILTER* $inst=
aller_root/<br />-<br />- # Get the name of the SDK tarball<br />- cd $inst=
aller_root<br />- sdk_tar=3D"`ls $SDK_FILTER*`"<br />- cd -<br />-<br />- #=
# Custom Install Builder Parameters<br />- # sdk_loc - Location of SDK tarb=
all<br />- # sdk_tar_nam - SDK tarball name<br />- # output_dir - Location =
to place SDK installer<br />- # platform - Machine name<br />- # sdk_versio=
n - SDK Version<br />- # sdk_name_prefix - SDK name Prefix.<br />- #<br />-=
 # SDK is referred to as ${sdk_name_prefix}-${platform} in the installer<br=
 />- # Ex tisdk-am335x<br />- # SDK installer is named after ${sdk_name_pre=
fix}-${platform}-${sdk_version}-Linux-x86-Install.bin<br />- # Ex ti-sdk-am=
335x-evm-06.00.00.00-Linux-x86-Install.bin<br />-<br />-<br />- $INSTALL_BU=
ILDER/builder build $INSTALL_BUILDER_PROJECT linux --setvars \<br />- sdk_l=
oc=3D"$installer_root/" \<br />- sdk_name_prefix=3D"${INSTALLER_PREFIX}" \<=
br />- sdk_tar_name=3D$sdk_tar \<br />- output_dir=3D"$deploy_root" \<br />=
- platform=3D"$m" \<br />- sdk_version=3D"$TISDK_VERSION"<br />-<br />- if =
[ "$?" !=3D "0" ]<br />- then<br />- echo "FAILED" &gt; $LOG_DIR/$m-build-i=
nstaller.txt<br />- return 1<br />- else<br />- echo "PASSED" &gt; $LOG_DIR=
/$m-build-installer.txt<br />- fi<br />-}<br />-<br />-package_web_content(=
) {<br />- # Set m for logging purposes<br />- m=3D"$1"<br />-<br />- # Cre=
ate the exports content for the web page<br />- exports_root=3D"$deploy_roo=
t/exports"<br />-<br />- if [ -d $exports_root ]<br />- then<br />- rm -rf =
$exports_root<br />- fi<br />- mkdir -p $exports_root<br />-<br />- # Copy =
the manifest file if it exists. Pull it from the extracted<br />- # SDK dir=
ectory from the test step.<br />- manifest_file=3D"$TEST_ROOT/$m-test/temp/=
docs/software_manifest.htm"<br />- if [ -e $manifest_file ]<br />- then<br =
/>- cp $manifest_file $exports_root/<br />- else<br />- echo "Could not pac=
kage manifest file"<br />- echo "FAILED" &gt; $LOG_DIR/$m-web-results.txt<b=
r />- return 1<br />- fi<br />-<br />- # Create the PSP tarballs as well<br=
 />- # First the sources tarball<br />- cd $TEST_ROOT/$m-test/temp<br />-<b=
r />- tar --exclude=3Dprebuilt-images -cJf $exports_root/$m-sdk-src-$TISDK_=
VERSION.tar.xz board-support/*<br />-<br />- if [ "$?" !=3D 0 ]<br />- then=
<br />- echo "Could not create SDK sources tarball"<br />- echo "FAILED" &g=
t; $LOG_DIR/$m-web-results.txt<br />- return 1<br />- fi<br />-<br />- # No=
w Create the pre-built binaries tarball. Make a temporary directory<br />- =
# to copy contents to here so that we can get the right extraction name.<br=
 />- tmp_dir=3D"$exports_root/${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}"<=
br />- tmp_dir_bs=3D"$tmp_dir/board-support"<br />- mkdir -p $tmp_dir_bs<br=
 />-<br />- cp -rf board-support/prebuilt-images $tmp_dir_bs<br />- if [ "$=
?" !=3D 0 ]<br />- then<br />- echo "Could not copy prebuilt-images"<br />-=
 echo "FAILED" &gt; $LOG_DIR/$m-web-results.txt<br />- return 1<br />- fi<b=
r />-<br />- cp -rf filesystem $tmp_dir/<br />- if [ "$?" !=3D 0 ]<br />- t=
hen<br />- echo "Could not copy file system tarballs"<br />- echo "FAILED" =
&gt; $LOG_DIR/$m-web-results.txt<br />- return 1<br />- fi<br />-<br />- cp=
 -rf bin $tmp_dir/<br />- if [ "$?" !=3D 0 ]<br />- then<br />- echo "Could=
 not copy bin folder"<br />- echo "FAILED" &gt; $LOG_DIR/$m-web-results.txt=
<br />- return 1<br />- fi<br />-<br />- # remove scripts which have depend=
ency on devkit<br />- rm $tmp_dir/bin/unshallow-repositories.sh<br />- rm $=
tmp_dir/bin/create-ubifs.sh<br />-<br />- # modify create-sdcard.sh to use =
the tarball extraction directory<br />- sed -i -e "s|ti-sdk.*\[0-9\]|${tmp_=
dir##*/}|g" $tmp_dir/bin/create-sdcard.sh<br />-<br />- # modify setup-targ=
et-nfs.sh to get the absolute path when running the scripts<br />- # 1. rem=
ove the line to set up "SDKinstall" with TI_SDK_PATH<br />- sed -i -e '/^SD=
Kinstall/d' $tmp_dir/bin/setup-targetfs-nfs.sh<br />-<br />- # 2. add the l=
ines before setting dstdefault to get the absolute path of the scripts and =
SDKinstall,<br />- # using the same way as in create-sdcard.sh: PWD=3D`pwd`=
; EXE=3D`echo $0 | sed s=3D$PWD=3D=3D`;<br />- # EXEPATH=3D"$PWD"/"$EXE"; S=
DKinstall=3D`echo $EXEPATH | grep -o .*ti-sdk.*.[0-9]`<br />- sed -i -e '/d=
stdefault=3D$SDKinstall\/targetNFS/i\PWD=3D`pwd`\nEXE=3D`echo $0 | sed s=3D=
$PWD=3D=3D`\nEXEPATH=3D"$PWD"/"$EXE"\nSDKinstall=3D`echo $EXEPATH | grep -o=
 '.*ti-sdk.*.[0-9]'`\n' $tmp_dir/bin/setup-targetfs-nfs.sh<br />-<br />- # =
3. use the tarball extraction directory for SDKinstall<br />- sed -i -e "s|=
ti-sdk.*\[0-9\]|${tmp_dir##*/}|g" $tmp_dir/bin/setup-targetfs-nfs.sh<br />-=
<br />- # create Rules.make with variables to be used from the binary packa=
ge<br />- echo "#platform" &gt;&gt; $tmp_dir/Rules.make<br />- echo "PLATFO=
RM=3D$m" &gt;&gt; $tmp_dir/Rules.make<br />- echo &gt;&gt; $tmp_dir/Rules.m=
ake<br />-<br />- echo "#root of the target file system for installing appl=
ications" &gt;&gt; $tmp_dir/Rules.make<br />- echo "DESTDIR=3D__DESTDIR__" =
&gt;&gt; $tmp_dir/Rules.make<br />- echo &gt;&gt; $tmp_dir/Rules.make<br />=
-<br />- echo "# Set EXEC_DIR to install example binaries" &gt;&gt; $tmp_di=
r/Rules.make<br />- echo "EXEC_DIR=3D__EXEC_DIR__" &gt;&gt; $tmp_dir/Rules.=
make<br />-<br />- if [ "$?" !=3D 0 ]<br />- then<br />- echo "Could not cr=
eate Rules.make"<br />- echo "FAILED" &gt; $LOG_DIR/$m-web-results.txt<br /=
>- return 1<br />- fi<br />-<br />- cp -f setup.sh $tmp_dir/<br />- if [ "$=
?" !=3D 0 ]<br />- then<br />- echo "Could not copy setup.sh"<br />- echo "=
FAILED" &gt; $LOG_DIR/$m-web-results.txt<br />- return 1<br />- fi<br />-<b=
r />- cd $exports_root<br />- tar cJf $m-sdk-bin-$TISDK_VERSION.tar.xz ${IN=
STALLER_PREFIX}-$m-bin-${TISDK_VERSION}/*<br />- if [ "$?" !=3D 0 ]<br />- =
then<br />- echo "Could not create SDK binaries tarball"<br />- echo "FAILE=
D" &gt; $LOG_DIR/$m-web-results.txt<br />- return 1<br />- fi<br />-<br />-=
 rm -rf ${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}<br />-<br />- if [ "$EX=
PORT_ARAGO_SRC" =3D=3D "1" ]<br />- then<br />- tar -C $DL_DIR -cJf $export=
s_root/$m-sdk-arago-src-$TISDK_VERSION.tar.xz .<br />-<br />- if [ "$?" !=
=3D 0 ]<br />- then<br />- echo "Could not create arago source tarball"<br =
/>- echo "FAILED" &gt; $LOG_DIR/$m-web-results.txt<br />- return 1<br />- f=
i<br />- fi<br />-<br />- # Copy any additional web files that are in the W=
EB_EXTRAS_ROOT<br />- # directory.<br />- web_extras=3D"$WEB_EXTRAS_ROOT/$m=
"<br />- if [ -d $web_extras ]<br />- then<br />- cp -rLf $web_extras/* $ex=
ports_root/<br />- fi<br />-<br />- # Move the installer into the exports d=
irectory<br />- mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/<br /=
>-<br />- # Create the md5sum file<br />- cd $exports_root<br />- md5sum * =
&gt; md5sum.txt<br />-<br />- # If we got here it means everything else pas=
sed<br />- echo "PASSED" &gt; $LOG_DIR/$m-web-results.txt<br />-}<br />-<br=
 />-generate_webgen_page() {<br />- # Set m for logging purposes<br />- m=
=3D"$1"<br />-<br />- <br />- webgen_make=3D"$WEBGEN_MAK_ROOT/$m/webgen.mak=
"<br />-<br />- if [ ! -e $webgen_make ]<br />- then<br />- echo "Could not=
 find the webgen file for machine $m"<br />- echo "FAILED" &gt; $LOG_DIR/$m=
-web-results.txt<br />- return 1<br />- fi<br />-<br />- # Create the ti.co=
m contents directory<br />- mkdir -p $deploy_root/ti_com_contents<br />-<br=
 />- # Copy the webgen file to the deploy directory<br />- cd $deploy_root<=
br />- cp $webgen_make .<br />-<br />- # Generate the web page<br />- $WEBG=
EN_ROOT/webgen_ext webgen.mak $deploy_root/ti_com_contents exports<br />-<b=
r />- # Cleanup the misc webgen files<br />- cleanup_webgen_page $m<br />-}=
<br />-<br />-# The webgen tool does a couple of things like make a symlink=
 to the exports<br />-# directory and has a validationinfo file that needs =
to be removed before<br />-# copying. If this is not done then we copy doub=
le the files, etc.<br />-cleanup_webgen_page() {<br />- m=3D"$1"<br />-<br =
/>- content_dir=3D"$deploy_root/ti_com_contents/`grep 'PRODUCT_NAME=3D' $we=
bgen_make | sed -e 's/PRODUCT_NAME=3D//g'`/`echo $TISDK_VERSION | tr '.' '_=
'`"<br />-<br />- # Something went wrong here because I can't find the webg=
en content<br />- if [ ! -d $content_dir ]<br />- then<br />- echo "Could n=
ot find the $content_dir"<br />- echo "FAILED" &gt; $LOG_DIR/$m-web-results=
.txt<br />- fi<br />-<br />- # Remove the exports symlink and move the real=
 exports directory into its<br />- # place<br />- rm -rf $content_dir/expor=
ts<br />- mv $deploy_root/exports $content_dir/<br />-<br />- # Remove the =
.validationinfo file<br />- rm -f $content_dir/.validationinfo<br />-<br />=
- # Remove the webgen.mak file<br />- rm -f $deploy_root/webgen.mak<br />-}=
<br />-<br />-package_individual_sdk() {<br />- # Set m for logging purpose=
s<br />- m=3D"$1"<br />-<br />- # Make the machine specific deploy root<br =
/>- deploy_root=3D"$DEPLOY_ROOT/$m/$BUILD_ID"<br />-<br />- if [ -d $deploy=
_root ]<br />- then<br />- rm -rf $deploy_root<br />- fi<br />- mkdir -p $d=
eploy_root<br />-<br />- # Create the SDK installer in the deploy directory=
<br />- create_sdk_installer $m<br />-<br />- # Create the SD card tarballs=
 in the deploy directory<br />- create_sd_card_content $m<br />-<br />- # P=
ackage the SD card and web page contents to get ready for<br />- # generati=
ng the webgen page and publishing the SDK<br />- package_web_content $m<br =
/>-<br />- if [ "$?" =3D=3D "0" ]<br />- then<br />- # Since the packaging =
worked let's generate the ti.com style<br />- # web page.<br />- generate_w=
ebgen_page $m<br />- fi<br />-}<br />-<br />-package_sdks(){<br />- # Build=
 a list of machines that passed their build and had no<br />- # CRITICAL fa=
ilures. This can be done by looking for the test<br />- # results file for =
each machine. If the test file does not<br />- # exist then the build faile=
d. If it does exist and does not<br />- # contain the CRITICAL keyword then=
 we can continue with<br />- #packaging.<br />- machines=3D""<br />-<br />-=
 for m in $MACHINES<br />- do<br />- if [ -e $LOG_DIR/$m-build-result.txt ]=
<br />- then<br />- # Check if the build failed<br />- grep "FAILED" $LOG_D=
IR/$m-build-result.txt &gt; /dev/null 2&gt;&amp;1<br />- if [ "$?" =3D=3D "=
0" ]<br />- then<br />- # The build failed so don't package this device<br =
/>- continue<br />- fi<br />-<br />- # Check the test results<br />- if [ -=
e $LOG_DIR/$m-test-result.txt ]<br />- then<br />- # The build at least PAS=
SED<br />- # Check if this was a CRITICAL failure<br />- grep "CRITICAL" $L=
OG_DIR/$m-test-result.txt &gt; /dev/null 2&gt;&amp;1<br />- if [ "$?" =3D=
=3D "0" ]<br />- then<br />- # This was a critical failure so return withou=
t copying<br />- # the files<br />- continue<br />- fi<br />-<br />- # This=
 was a build with a PASSED, SKIPPED, or non-CRITICAL<br />- # test result. =
Add it to the list of machines to package.<br />- machines=3D"$machines""$m=
 "<br />- fi<br />- fi<br />- done<br />-<br />- echo "machines =3D $machin=
es"<br />-<br />- # Now that the have the list of machines we can call the =
rest of the<br />- # package functions in parallel.<br />- for m in $machin=
es<br />- do<br />- package_individual_sdk $m &amp;<br />- done<br />-<br /=
>- # Wait for the subprocesses to all finish<br />- wait<br />-}<br />diff =
--git a/lib/oesdk/ti-sdk-host-install.sh b/lib/oesdk/ti-sdk-host-install.sh=
<br />deleted file mode 100755<br />index 0dc1fa2..0000000<br />--- a/lib/o=
esdk/ti-sdk-host-install.sh<br />+++ /dev/null<br />@@ -1,227 +0,0 @@<br />=
-# /usr/bin/env bash<br />-set -x<br />-#<br />-# (C) Copyright 2010 Texas =
Instrument Inc. All rights reserved.<br />-#<br />-# Author: Schuyler Patto=
n, Texas Instrunents Inc.<br />-#<br />-# Script to install TI SDK on User =
Platform<br />-#<br />-<br />-VERSION=3D"1.0"<br />-<br />-#<br />-# Displa=
y program usage<br />-#<br />-usage()<br />-{<br />- echo "<br />-Usage: `b=
asename $1` [options] --machine &lt;machine_name&gt; &lt;install_dir&gt; &l=
t;tools_dir_prefix&gt; &lt;dest_dir&gt;<br />-<br />- --help Print this hel=
p message<br />-"<br />- exit 1<br />-}<br />-<br />-#<br />-# Display vers=
ion <br />-#<br />-version()<br />-{<br />- echo "<br />-`basename $1`: ver=
sion $VERSION <br />-"<br />- exit 1<br />-}<br />-<br />-<br />-#<br />-# =
execute command<br />-#<br />-execute ()<br />-{<br />- #echo "$*"<br />- $=
*<br />- if [ $? -ne 0 ]; then<br />- echo "ERROR: failed to execute $*"<br=
 />- exit 1;<br />- fi<br />-}<br />-<br />-#<br />-# update sdk Rules.make=
<br />-#<br />-update_rules_make()<br />-{<br />- echo "Updating Rules.make=
"<br />- echo "$install_dir"<br />-<br />- echo "$install_dir"&gt;rm_id.out=
<br />- echo "$cross_compile"&gt;rm_cc.out<br />- echo "$cross_compile_dir"=
&gt;rm_ccd.out<br />- echo "$dest_dir"&gt;rm_dd.out<br />-<br />- sed -i -e=
 s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D $install_dir/Rules.make <br />-=
 sed -i -e s=3D__CROSS_COMPILE__=3D$cross_compile_dir/arm-none-linux-gnueab=
i-=3D $install_dir/Rules.make<br />-<br />- # Find the linux directory name=
<br />- linux=3D`find $install_dir/board-support -maxdepth 1 -name "linux*"=
`<br />- linux=3D`basename $linux`<br />- sed -i -e s=3D__KERNEL_NAME__=3D$=
linux=3D $install_dir/Rules.make<br />-<br />- # Extract toolchain sdk<br /=
>- $install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit<br />-<br /=
>- # Remove toolchain SDK<br />- rm $install_dir/linux-devkit.sh<br />-<br =
/>-# TODO: Unsure about this one here. This likely should change when the<b=
r />-# META_SDK_PATH functionality is put back in.<br />- echo "Updating pr=
efix in libtoolize "<br />- sed -i -e "s|/arago-2012.10|$install_dir/linux-=
devkit|g" \<br />- $install_dir/linux-devkit/bin/libtoolize<br />-}<br />-<=
br />-#<br />-# update example applications CCS project file<br />-#<br />-=
update_ccs_project()<br />-{<br />- cd $install_dir<br />-<br />- # Grab so=
me essential variables from environment-setup<br />- TARGET_SYS=3D`sed -n '=
s/^export TARGET_SYS=3D//p' linux-devkit/environment-setup`<br />- TOOLCHAI=
N_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p' linux-devkit/environment-se=
tup`<br />- SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' linux-devkit/enviro=
nment-setup`<br />-<br />- # Grab toolchain's GCC version<br />- GCC_VERSIO=
N=3D`ls linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`<br />-<=
br />- TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-devkit/sysroots/$TARGET_SYS/us=
r/include"<br />- TOOLCHAIN_INCLUDE_DIR=3D"linux-devkit/sysroots/$SDK_SYS/u=
sr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/include"<br />-<br />- # Update CCS =
project files using important paths to headers<br />- find ./example-applic=
ations -type f -exec sed -i "s|&lt;TOOLCHAIN_TARGET_INCLUDE_DIR&gt;|$TOOLCH=
AIN_TARGET_INCLUDE_DIR|g" {} \;<br />- find ./example-applications -type f =
-exec sed -i "s|&lt;TOOLCHAIN_INCLUDE_DIR&gt;|$TOOLCHAIN_INCLUDE_DIR|g" {} =
\;<br />- cd -<br />-}<br />-<br />-#<br />-# prepare installer tools <br /=
>-# <br />-prepare_install ()<br />-{<br />- echo "Preparing installation .=
.."<br />- cwd=3D$PWD;<br />-<br />- execute "mkdir -p ${install_dir}"<br /=
>- mkdir -p ${dest_dir}<br />-<br />-}<br />-<br />-#<br />-# install sdk<b=
r />-#<br />-install_sdk ()<br />-{<br />- sdk_dir=3D$PWD <br />- echo "$sd=
k_dir"&gt;is_sdk_dir.out<br />- echo "$install_dir"&gt;is_id.out<br />- ech=
o "$cross_compile"&gt;is_cc.out<br />- echo "$cross_compile_dir"&gt;is_ccd.=
out<br />- echo "$dest_dir"&gt;is_dd.out<br />- echo "$sdk_pkg"&gt;is_sdk_p=
kg.out<br />-<br />-# cp -p ti-sdk-ubuntu-env-setup.sh "$install_dir"<br />=
- echo "Untarring top level SDK $sdk_pkg " <br />- tar -xf $sdk_pkg -C $ins=
tall_dir<br />- echo "Untarring top level package complete "<br />-<br />- =
# Remove any .svn directories that were packaged by the sourceipks<br />- r=
m -rf `find $install_dir -name ".svn"`<br />-<br />-}<br />-<br />-install_=
ccs()<br />-{ <br />-<br />-# $install_source/CCS/setup*.bin &amp;<br />-<b=
r />-echo "install_ccs is $install_ccs"&gt;ccs_iccs.out<br />-<br />-if [ "=
$install_ccs" =3D "yes" ]; then<br />- $install_source/ccs_install.sh $inst=
all_source &amp; <br />-fi<br />- <br />-}<br />-<br />-<br />-# Process co=
mmand line...<br />-while [ $# -gt 0 ]; do<br />- case $1 in<br />- --help =
| -h)<br />- usage $0<br />- ;;<br />- --version | -v)<br />- version $0<br=
 />- ;;<br />- --sdk_pkg)<br />- shift;<br />- sdk_pkg=3D$1;<br />- ;;<br /=
>- --install_dir)<br />- shift;<br />- install_dir=3D$1;<br />- ;;<br />- -=
-install_ccs)<br />- shift;<br />- install_ccs=3D"yes";<br />- ;;<br />- --=
install_source)<br />- shift;<br />- install_source=3D$1<br />- ;;<br />- *=
)<br />- shift;<br />- ;;<br />- esac<br />-done<br />-<br />-echo " "<br /=
>-echo " Called with --machine $machine --sdk_pkg $sdk_pkg --install_dir $i=
nstall_dir --cross_compile_dir $cross_compile_dir --cross_compile $cross_co=
mpile "&gt;called-w-param.out<br />-echo " "<br />-<br />-echo "$machine"&g=
t;machid.out<br />-echo "$install_dir"&gt;id.out<br />-echo "$cross_compile=
"&gt;cc.out<br />-echo "$cross_compile_dir"&gt;ccd.out<br />-echo "$dest_di=
r"&gt;dd.out<br />-echo "$install_source"&gt;tmp/tmp_iss.out<br />-echo "$i=
nstall_source"&gt;iss.out<br />-<br />-# check if install_dir variable is s=
et.<br />-test -z $install_dir &amp;&amp; usage $0<br />-execute "mkdir -p =
$install_dir"<br />-echo "after mkdir "&gt;oops.out<br />-<br />-# prepare =
installation.<br />-prepare_install<br />-echo "after prepare "&gt;oops.out=
<br />-<br />-# install sdk<br />-install_sdk<br />-echo "after install_sdk=
 "&gt;oops.out<br />-<br />-# install CCS<br />-test -d $install_source/CCS=
;install_ccs<br />-<br />-# update rules.make<br />-update_rules_make<br />=
-<br />-# Update example applications CCS project files<br />-update_ccs_pr=
oject<br />-<br />-echo "Installation completed!"<br />-<br />-exit 0<br />=
- <br />-- <br />2.7.4</blockquote>

--ZYemNER8KOOUpgFfAgPN--
