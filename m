Subject: Re: [tisdk-build-scripts][PATCH 06/10] Remove code that extracts and repackages SDK for runtime testing
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:14:35 -0800
References: <1637640060-31733-19-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-19-git-send-email-denis@denix.org>
Message-ID: <22100.1638227675404197249@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="16Urapr045OFaKjzXeTO"

--16Urapr045OFaKjzXeTO
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
> lib/oesdk/bitbake-test-sdk-image | 381
> ---------------------------------------
> 1 file changed, 381 deletions(-)
>=20
> diff --git a/lib/oesdk/bitbake-test-sdk-image
> b/lib/oesdk/bitbake-test-sdk-image
> index 51796a6..35110aa 100644
> --- a/lib/oesdk/bitbake-test-sdk-image
> +++ b/lib/oesdk/bitbake-test-sdk-image
> @@ -10,374 +10,6 @@ then
> fi
>=20
>=20
> -package_tested_rootfs() {
> - # Set m for logging purposes
> - m=3D"$1"
> -
> - nfs_dir=3D"$NFS_ROOT/$m-test"
> -
> - # Find the target file system
> - filesys_path=3D"temp/filesystem"
> - filesys=3D`find ./$filesys_path -name "$FS_FILTER*$FS_IMAGE_TYPE" | xar=
gs
> basename`
> -
> - # Check if the nfs_dir is available. If it is not available then
> - # this must mean that we exited the test because it could not be
> - # created. So don't try to re-package the tested NFS file system.
> - if [ -e "$nfs_dir" ]
> - then
> - log $machine_build_log echo "packaging tested rootfs for machine $m"
> - # Since opentest run passed let's do some cleanup of the filesystem
> - # and then repackage it and the SDK tarball so that the SDK will ship
> - # with a pre-booted file system, which reduces out-of-the-box boot
> - # time.
> - sudo rm -rf $nfs_dir/$TEST_SCRIPTS_TGT
> - sudo rm -rf $nfs_dir/etc/pointercal
> - sudo rm -rf $nfs_dir/etc/rc5.d/S90-fake-pointercal
> - sudo rm -rf $nfs_dir/etc/rc5.d/S08-fake-weston-calibrate
> - sudo rm -rf $nfs_dir/etc/dropbear/dropbear_rsa_*
> -
> - if [ "$(ls -A $nfs_dir/home/root/)" ]
> - then
> - sudo rm -rf $nfs_dir/home/root/*
> - fi
> -
> - # Don't forget to remove the original file system tarball
> - sudo rm -rf $nfs_dir/$filesys
> -
> - # Tar up the booted file system
> - rm $test_dir/$filesys_path/$filesys
> - cd $nfs_dir
> -
> - # Set the tar options based on FS_IMAGE_TYPE
> - if [ "$FS_IMAGE_TYPE" =3D=3D "tar.gz" ]
> - then
> - fs_tar_opts=3D"czf"
> - elif [ "$FS_IMAGE_TYPE" =3D=3D "tar.bz2" ]
> - then
> - fs_tar_opts=3D"cjf"
> - else
> - # default to tar.gz
> - fs_tar_opts=3D"czf"
> - fi
> -
> - sudo tar $fs_tar_opts $test_dir/$filesys_path/$filesys *
> - cd $test_dir
> - else
> - log $machine_build_log echo "packaging existing rootfs for machine $m"
> - fi
> -
> - if [ ! -z $SDK_FILTER ]
> - then
> - # Re-Tar the SDK
> - rm $test_dir/$sdk_image
> - cd temp
> -
> - # Set the tar options based on SDK_IMAGE_TYPE
> - if [ "$SDK_IMAGE_TYPE" =3D=3D "tar.gz" ]
> - then
> - sdk_tar_opts=3D"czf"
> - elif [ "$SDK_IMAGE_TYPE" =3D=3D "tar.bz2" ]
> - then
> - sdk_tar_opts=3D"cjf"
> - else
> - # default to tar.gz
> - sdk_tar_opts=3D"czf"
> - fi
> -
> - tar $sdk_tar_opts $test_dir/$sdk_image *
> - cd $test_dir
> - fi
> -
> - # return back to the build directory
> - cd $build_dir
> -
> - return 0
> -}
> -
> -# This function will extract the SDK image. It is always called because
> -# even when we don't do target side testing we still want to extract the
> -# image to allow packaging the contents.
> -extract_sdk_image() {
> - # Set m for logging purposes
> - m=3D$1
> -
> -########################################################################=
########
>=20
> -# Look inside of the arago-tmp directory in the build directory for this
> -# list and find the SDK image tarball for this machine. Copy the tarball
> -# to the test directory
> -# First find the arago-tmp directory. Since the Toolchain becomes part
> -# of the name we need to search for it.
> -# NOTE: This means that if you switch toolchains you need to do a
> -# CLEAN_BUILD
> -# NOTE: The assumption here is that we are still in the directory where
> -# the arago-tmp directory is located
> -########################################################################=
########
>=20
> - arago_tmp=3D`ls | grep "arago-tmp-*"`
> -
> - # This is a critical failure and will not be able to be skipped
> - if [ "$arago_tmp" =3D=3D "" ]
> - then
> - echo "Could not find the arago-tmp directory"
> - echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
> - return 1
> - fi
> -
> - sdk_path=3D"$arago_tmp/deploy/images"
> -
> - # check that the sdk_path exists
> - if [ ! -d $sdk_path ]
> - then
> - echo "Images directory is missing from arago-tmp"
> - echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
> - return 1
> - fi
> -
> - # prefer sdk_path/m, if exists - Dora and up
> - if [ -d $sdk_path/$m ]
> - then
> - sdk_path=3D"$sdk_path/$m"
> - fi
> -
> -########################################################################=
########
>=20
> -# SDK_FILTER variable is used to specify the SDK image produced by the
> build,
> -# that includes bootloaders, kernel, rootfs, devkit and host tools.
> -# When SDK_FILTER is not set, it is assumed the individual piecess neede=
d
> for
> -# testing are built and deployed - bootloaders, kernel and (minimal)
> rootfs
> -#
> -# NOTE: For SDK-less builds, we need to re-create the same layout with
> directory
> -# structure following the extracted SDK image, placing the individual
> -# components in their corresponding locations ($test_dir/temp/filesystem
> -# and $test_dir/temp/board-support/prebuilt-images, so the rest of the
> -# test scripts can find them and work for both SDK and non-SDK cases.
> -########################################################################=
########
>=20
> - if [ ! -z $SDK_FILTER ]
> - then
> - # This filter is used to get the simple image name instead of the
> - # image name with the date and time added.
> - sdk_image=3D`find ./$sdk_path -name "$SDK_FILTER*$m.$SDK_IMAGE_TYPE" |
> xargs basename`
> - # This is a critical failure and will not be able to be skipped
> - if [ "$sdk_image" =3D=3D "" ]
> - then
> - echo "Could not find the SDK image"
> - echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
> - return 1
> - fi
> -
> - cp $sdk_path/$sdk_image $test_dir
> -
> - # cd into the test dir and extract the SDK image into a temp directory
> - mkdir -p $test_dir/temp
> - cd $test_dir/temp
> - tar xf $test_dir/$sdk_image
> - cd $test_dir
> - else
> - # Special case of non-SDK build, when SDK_FILTER is not specified
> - mkdir -p $test_dir/temp/filesystem
> - mkdir -p $test_dir/temp/board-support/prebuilt-images
> -
> - # Find the target file system
> - filesys=3D`find ./$sdk_path -name "$FS_FILTER*$m.$FS_IMAGE_TYPE" | xarg=
s
> basename`
> - # This is a critical failure and will not be able to be skipped
> - if [ -z "$filesys" ]
> - then
> - echo "Could not find the target filesystem image"
> - echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
> - return 1
> - fi
> - cp $sdk_path/$filesys $test_dir/temp/filesystem
> -
> - # Find the kernel image
> - kernel=3D`find ./$sdk_path -name "[uz]Image-$m.bin" | xargs basename`
> - # This is a critical failure and will not be able to be skipped
> - if [ -z "$kernel" ]
> - then
> - echo "Could not find the kernel image"
> - echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
> - return 1
> - fi
> - cp $sdk_path/$kernel $test_dir/temp/board-support/prebuilt-images
> -
> - # Find the u-boot image
> - uboot=3D`find ./$sdk_path -name "u-boot-$m.*" | xargs basename`
> - # This is a critical failure and will not be able to be skipped
> - if [ -z "$uboot" ]
> - then
> - echo "Could not find the u-boot image"
> - echo "FAILED: CRITICAL" > $LOG_DIR/$m-test-result.txt
> - return 1
> - fi
> - cp $sdk_path/$uboot $test_dir/temp/board-support/prebuilt-images
> -
> - # This is NOT a critical failure
> - # Find the mlo image
> - mlo=3D`find ./$sdk_path -name "MLO-$m" | xargs basename`
> - if [ ! -z "$mlo" ]
> - then
> - cp $sdk_path/$mlo $test_dir/temp/board-support/prebuilt-images
> - else
> - # Find the skern image (special case for Keystone)
> - skern=3D`find ./$sdk_path -name "skern-$m.bin" | xargs basename`
> - if [ ! -z "$skern" ]
> - then
> - cp $sdk_path/$skern $test_dir/temp/board-support/prebuilt-images
> - else
> - echo "Could not find the MLO/skern image, ignoring"
> - fi
> - fi
> -
> - # This is NOT a critical failure
> - # Find the spl/uart image
> - spl=3D`find ./$sdk_path -name "u-boot-spl.bin-$m" | xargs basename`
> - if [ ! -z "$spl" ]
> - then
> - cp $sdk_path/$spl $test_dir/temp/board-support/prebuilt-images
> - else
> - echo "Could not find the SPL/UART image, ignoring"
> - fi
> -
> - cd $test_dir
> - fi
> -
> - return 0
> -}
> -
> -# This function will copy the SDK image to the PACKAGE_ROOT
> -# This image may be the original image depending on whether the
> -# test failed with a critical failure or not. If it was a critical
> failure
> -# then the packaging step will not find the SDK image and will therefore
> -# not run.
> -copy_files_to_package_root() {
> - # Set m for logging purposes
> - m=3D$1
> -
> - # Make the machine specific package root
> - package_root=3D"$PACKAGE_ROOT/$m"
> -
> - if [ -d $package_root ]
> - then
> - rm -rf $package_root
> - fi
> - mkdir -p $package_root
> -
> - # Copy the SDK tarball
> - cp $test_dir/$SDK_FILTER* $package_root
> -
> - # Since the SDK is still extracted in the "temp" directory go
> - # ahead and copy the pre-built images and file system files
> - # for the SD card contents. The rest of the contents will be
> - # packaged in a later step.
> - # Create the boot tarball contents
> - boot_partition=3D"$package_root/boot_partition"
> - mkdir -p $boot_partition
> - cp $test_dir/temp/board-support/prebuilt-images/* $boot_partition/
> -
> - # Create the rootfs tarball contents
> - root_partition=3D"$package_root/root_partition"
> - mkdir -p $root_partition
> - cp $test_dir/temp/filesystem/$FS_FILTER*.$FS_IMAGE_TYPE
> $root_partition/rootfs_partition.$FS_IMAGE_TYPE
> -}
> -
> -copy_golden_image() {
> - # Set m for logging purposes
> - m=3D$1
> -
> - arago_tmp=3D`ls | grep "arago-tmp-*"`
> -
> - # This is a critical failure and will not be able to be skipped
> - if [ "$arago_tmp" =3D=3D "" ]
> - then
> - echo "Could not find the arago-tmp directory"
> - return 1
> - fi
> -
> - img_path=3D"$arago_tmp/deploy/images/$m"
> -
> - # check that the img_path exists
> - if [ ! -d $img_path ]
> - then
> - echo "Images directory for machine $m is missing from arago-tmp"
> - return 1
> - fi
> -
> - dest_path=3D"golden/"
> - rm -rf $dest_path/$m
> -
> - mkdir $dest_path/$m
> - cp -a $img_path $dest_path
> -}
> -
> -test_sdk_image() {
> - # Set m for logging purposes
> - m=3D"$1"
> - test_passed=3D"false"
> -
> - # Create a temporary directory to extract the build files to for
> - # testing. If the directory already exists then delete the old
> - # contents first.
> - test_dir=3D"$TEST_ROOT/$m-test"
> -
> - if [ -d $test_dir ]
> - then
> - rm -rf $test_dir
> - fi
> - mkdir -p $test_dir
> -
> - # Always extract the SDK so we can package the internal contents,
> - # even if we don't do testing and re-package the tested files.
> - extract_sdk_image $m
> - if [ "$?" !=3D "0" ]
> - then
> - return 1
> - fi
> -
> - # Delete old rootfs test directory
> - nfs_dir=3D"$NFS_ROOT/$m-test"
> - if [ -d $nfs_dir ]
> - then
> - # Clean the old directory
> - sudo rm -rf $nfs_dir
> - fi
> -
> - # Only run the build testing if the config file says to do so
> - if [ "$RUN_BUILD_TESTS" =3D=3D "true" ]
> - then
> - run_target_side_test $m
> -
> - if [ "$?" !=3D "0" ]
> - then
> - # Check if this was a CRITICAL failure
> - grep "CRITICAL" $LOG_DIR/$m-test-result.txt > /dev/null 2>&1
> - if [ "$?" =3D=3D "0" -a "$SKIP_TEST_FAILURES" =3D=3D "false" ]
> - then
> - # This was a critical failure so return without copying
> - # the files
> - return 1
> - fi
> - else
> - echo "PASSED" > $LOG_DIR/$m-test-result.txt
> - test_passed=3D"true"
> - fi
> -
> - else
> - echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
> - fi
> -
> - # Getting here means that either
> - # 1. The test passed
> - # 2. The test failed with a non-CRITICAL error and SKIP_TEST_FAILURES
> - # was set to true.
> - package_tested_rootfs $m
> - if [ ! -z $SDK_FILTER ]
> - then
> - copy_files_to_package_root $m
> - fi
> -
> - if [ "$test_passed" =3D=3D "true" -a $COPY_GOLDEN_TO_WEB =3D=3D "true" =
]
> - then
> - copy_golden_image $m
> - fi
> -}
> -
> # This function receives a comma separated list of machines to build and
> test.
> # The flow is to do the bitbake operations to generate the images and SDK
> # content, then call to the opentest system (if so desired) while startin=
g
> the
> @@ -478,19 +110,6 @@ bitbake_sdk_images(){
> # If it does not exist, then there is not much we can do, so inhibit the
> # error code.
> mv $build_dir/bitbake-cookerdaemon.log
> $LOG_DIR/$m-bitbake-cookerdaemon.log || true
> -
> - # Only run the build testing if the status of the above builds
> - # was "pass"
> - if [ "$build_status" =3D=3D "pass" ]
> - then
> - if [ ! "$EXIT_AFTER_BUILD" =3D "true" ]; then
> - test_sdk_image $m &
> - else
> - echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
> - fi
> - else
> - echo "SKIPPED" > $LOG_DIR/$m-test-result.txt
> - fi
> done
>=20
> # Wait for all build/test processes to finish before exiting
> --
> 2.7.4

--16Urapr045OFaKjzXeTO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />lib/oesdk/bitbake-test-sdk-image | 381 ---------------=
------------------------<br />1 file changed, 381 deletions(-)<br /><br />d=
iff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-i=
mage<br />index 51796a6..35110aa 100644<br />--- a/lib/oesdk/bitbake-test-s=
dk-image<br />+++ b/lib/oesdk/bitbake-test-sdk-image<br />@@ -10,374 +10,6 =
@@ then<br />fi<br /><br /><br />-package_tested_rootfs() {<br />- # Set m =
for logging purposes<br />- m=3D"$1"<br />-<br />- nfs_dir=3D"$NFS_ROOT/$m-=
test"<br />-<br />- # Find the target file system<br />- filesys_path=3D"te=
mp/filesystem"<br />- filesys=3D`find ./$filesys_path -name "$FS_FILTER*$FS=
_IMAGE_TYPE" | xargs basename`<br />-<br />- # Check if the nfs_dir is avai=
lable. If it is not available then<br />- # this must mean that we exited t=
he test because it could not be<br />- # created. So don't try to re-packag=
e the tested NFS file system.<br />- if [ -e "$nfs_dir" ]<br />- then<br />=
- log $machine_build_log echo "packaging tested rootfs for machine $m"<br /=
>- # Since opentest run passed let's do some cleanup of the filesystem<br /=
>- # and then repackage it and the SDK tarball so that the SDK will ship<br=
 />- # with a pre-booted file system, which reduces out-of-the-box boot<br =
/>- # time.<br />- sudo rm -rf $nfs_dir/$TEST_SCRIPTS_TGT<br />- sudo rm -r=
f $nfs_dir/etc/pointercal<br />- sudo rm -rf $nfs_dir/etc/rc5.d/S90-fake-po=
intercal<br />- sudo rm -rf $nfs_dir/etc/rc5.d/S08-fake-weston-calibrate<br=
 />- sudo rm -rf $nfs_dir/etc/dropbear/dropbear_rsa_*<br />-<br />- if [ "$=
(ls -A $nfs_dir/home/root/)" ]<br />- then<br />- sudo rm -rf $nfs_dir/home=
/root/*<br />- fi<br />-<br />- # Don't forget to remove the original file =
system tarball<br />- sudo rm -rf $nfs_dir/$filesys<br />-<br />- # Tar up =
the booted file system<br />- rm $test_dir/$filesys_path/$filesys<br />- cd=
 $nfs_dir<br />-<br />- # Set the tar options based on FS_IMAGE_TYPE<br />-=
 if [ "$FS_IMAGE_TYPE" =3D=3D "tar.gz" ]<br />- then<br />- fs_tar_opts=3D"=
czf"<br />- elif [ "$FS_IMAGE_TYPE" =3D=3D "tar.bz2" ]<br />- then<br />- f=
s_tar_opts=3D"cjf"<br />- else<br />- # default to tar.gz<br />- fs_tar_opt=
s=3D"czf"<br />- fi<br />-<br />- sudo tar $fs_tar_opts $test_dir/$filesys_=
path/$filesys *<br />- cd $test_dir<br />- else<br />- log $machine_build_l=
og echo "packaging existing rootfs for machine $m"<br />- fi<br />-<br />- =
if [ ! -z $SDK_FILTER ]<br />- then<br />- # Re-Tar the SDK<br />- rm $test=
_dir/$sdk_image<br />- cd temp<br />-<br />- # Set the tar options based on=
 SDK_IMAGE_TYPE<br />- if [ "$SDK_IMAGE_TYPE" =3D=3D "tar.gz" ]<br />- then=
<br />- sdk_tar_opts=3D"czf"<br />- elif [ "$SDK_IMAGE_TYPE" =3D=3D "tar.bz=
2" ]<br />- then<br />- sdk_tar_opts=3D"cjf"<br />- else<br />- # default t=
o tar.gz<br />- sdk_tar_opts=3D"czf"<br />- fi<br />-<br />- tar $sdk_tar_o=
pts $test_dir/$sdk_image *<br />- cd $test_dir<br />- fi<br />-<br />- # re=
turn back to the build directory<br />- cd $build_dir<br />-<br />- return =
0<br />-}<br />-<br />-# This function will extract the SDK image. It is al=
ways called because<br />-# even when we don't do target side testing we st=
ill want to extract the<br />-# image to allow packaging the contents.<br /=
>-extract_sdk_image() {<br />- # Set m for logging purposes<br />- m=3D$1<b=
r />-<br />-###############################################################=
#################<br />-# Look inside of the arago-tmp directory in the bui=
ld directory for this<br />-# list and find the SDK image tarball for this =
machine. Copy the tarball<br />-# to the test directory<br />-# First find =
the arago-tmp directory. Since the Toolchain becomes part<br />-# of the na=
me we need to search for it.<br />-# NOTE: This means that if you switch to=
olchains you need to do a<br />-# CLEAN_BUILD<br />-# NOTE: The assumption =
here is that we are still in the directory where<br />-# the arago-tmp dire=
ctory is located<br />-####################################################=
############################<br />- arago_tmp=3D`ls | grep "arago-tmp-*"`<b=
r />-<br />- # This is a critical failure and will not be able to be skippe=
d<br />- if [ "$arago_tmp" =3D=3D "" ]<br />- then<br />- echo "Could not f=
ind the arago-tmp directory"<br />- echo "FAILED: CRITICAL" &gt; $LOG_DIR/$=
m-test-result.txt<br />- return 1<br />- fi<br />-<br />- sdk_path=3D"$arag=
o_tmp/deploy/images"<br />-<br />- # check that the sdk_path exists<br />- =
if [ ! -d $sdk_path ]<br />- then<br />- echo "Images directory is missing =
from arago-tmp"<br />- echo "FAILED: CRITICAL" &gt; $LOG_DIR/$m-test-result=
.txt<br />- return 1<br />- fi<br />-<br />- # prefer sdk_path/m, if exists=
 - Dora and up<br />- if [ -d $sdk_path/$m ]<br />- then<br />- sdk_path=3D=
"$sdk_path/$m"<br />- fi<br />-<br />-#####################################=
###########################################<br />-# SDK_FILTER variable is =
used to specify the SDK image produced by the build,<br />-# that includes =
bootloaders, kernel, rootfs, devkit and host tools.<br />-# When SDK_FILTER=
 is not set, it is assumed the individual piecess needed for<br />-# testin=
g are built and deployed - bootloaders, kernel and (minimal) rootfs<br />-#=
<br />-# NOTE: For SDK-less builds, we need to re-create the same layout wi=
th directory<br />-# structure following the extracted SDK image, placing t=
he individual<br />-# components in their corresponding locations ($test_di=
r/temp/filesystem<br />-# and $test_dir/temp/board-support/prebuilt-images,=
 so the rest of the<br />-# test scripts can find them and work for both SD=
K and non-SDK cases.<br />-################################################=
################################<br />- if [ ! -z $SDK_FILTER ]<br />- then=
<br />- # This filter is used to get the simple image name instead of the<b=
r />- # image name with the date and time added.<br />- sdk_image=3D`find .=
/$sdk_path -name "$SDK_FILTER*$m.$SDK_IMAGE_TYPE" | xargs basename`<br />- =
# This is a critical failure and will not be able to be skipped<br />- if [=
 "$sdk_image" =3D=3D "" ]<br />- then<br />- echo "Could not find the SDK i=
mage"<br />- echo "FAILED: CRITICAL" &gt; $LOG_DIR/$m-test-result.txt<br />=
- return 1<br />- fi<br />-<br />- cp $sdk_path/$sdk_image $test_dir<br />-=
<br />- # cd into the test dir and extract the SDK image into a temp direct=
ory<br />- mkdir -p $test_dir/temp<br />- cd $test_dir/temp<br />- tar xf $=
test_dir/$sdk_image<br />- cd $test_dir<br />- else<br />- # Special case o=
f non-SDK build, when SDK_FILTER is not specified<br />- mkdir -p $test_dir=
/temp/filesystem<br />- mkdir -p $test_dir/temp/board-support/prebuilt-imag=
es<br />-<br />- # Find the target file system<br />- filesys=3D`find ./$sd=
k_path -name "$FS_FILTER*$m.$FS_IMAGE_TYPE" | xargs basename`<br />- # This=
 is a critical failure and will not be able to be skipped<br />- if [ -z "$=
filesys" ]<br />- then<br />- echo "Could not find the target filesystem im=
age"<br />- echo "FAILED: CRITICAL" &gt; $LOG_DIR/$m-test-result.txt<br />-=
 return 1<br />- fi<br />- cp $sdk_path/$filesys $test_dir/temp/filesystem<=
br />-<br />- # Find the kernel image<br />- kernel=3D`find ./$sdk_path -na=
me "[uz]Image-$m.bin" | xargs basename`<br />- # This is a critical failure=
 and will not be able to be skipped<br />- if [ -z "$kernel" ]<br />- then<=
br />- echo "Could not find the kernel image"<br />- echo "FAILED: CRITICAL=
" &gt; $LOG_DIR/$m-test-result.txt<br />- return 1<br />- fi<br />- cp $sdk=
_path/$kernel $test_dir/temp/board-support/prebuilt-images<br />-<br />- # =
Find the u-boot image<br />- uboot=3D`find ./$sdk_path -name "u-boot-$m.*" =
| xargs basename`<br />- # This is a critical failure and will not be able =
to be skipped<br />- if [ -z "$uboot" ]<br />- then<br />- echo "Could not =
find the u-boot image"<br />- echo "FAILED: CRITICAL" &gt; $LOG_DIR/$m-test=
-result.txt<br />- return 1<br />- fi<br />- cp $sdk_path/$uboot $test_dir/=
temp/board-support/prebuilt-images<br />-<br />- # This is NOT a critical f=
ailure<br />- # Find the mlo image<br />- mlo=3D`find ./$sdk_path -name "ML=
O-$m" | xargs basename`<br />- if [ ! -z "$mlo" ]<br />- then<br />- cp $sd=
k_path/$mlo $test_dir/temp/board-support/prebuilt-images<br />- else<br />-=
 # Find the skern image (special case for Keystone)<br />- skern=3D`find ./=
$sdk_path -name "skern-$m.bin" | xargs basename`<br />- if [ ! -z "$skern" =
]<br />- then<br />- cp $sdk_path/$skern $test_dir/temp/board-support/prebu=
ilt-images<br />- else<br />- echo "Could not find the MLO/skern image, ign=
oring"<br />- fi<br />- fi<br />-<br />- # This is NOT a critical failure<b=
r />- # Find the spl/uart image<br />- spl=3D`find ./$sdk_path -name "u-boo=
t-spl.bin-$m" | xargs basename`<br />- if [ ! -z "$spl" ]<br />- then<br />=
- cp $sdk_path/$spl $test_dir/temp/board-support/prebuilt-images<br />- els=
e<br />- echo "Could not find the SPL/UART image, ignoring"<br />- fi<br />=
-<br />- cd $test_dir<br />- fi<br />-<br />- return 0<br />-}<br />-<br />=
-# This function will copy the SDK image to the PACKAGE_ROOT<br />-# This i=
mage may be the original image depending on whether the<br />-# test failed=
 with a critical failure or not. If it was a critical failure<br />-# then =
the packaging step will not find the SDK image and will therefore<br />-# n=
ot run.<br />-copy_files_to_package_root() {<br />- # Set m for logging pur=
poses<br />- m=3D$1<br />-<br />- # Make the machine specific package root<=
br />- package_root=3D"$PACKAGE_ROOT/$m"<br />-<br />- if [ -d $package_roo=
t ]<br />- then<br />- rm -rf $package_root<br />- fi<br />- mkdir -p $pack=
age_root<br />-<br />- # Copy the SDK tarball<br />- cp $test_dir/$SDK_FILT=
ER* $package_root<br />-<br />- # Since the SDK is still extracted in the "=
temp" directory go<br />- # ahead and copy the pre-built images and file sy=
stem files<br />- # for the SD card contents. The rest of the contents will=
 be<br />- # packaged in a later step.<br />- # Create the boot tarball con=
tents<br />- boot_partition=3D"$package_root/boot_partition"<br />- mkdir -=
p $boot_partition<br />- cp $test_dir/temp/board-support/prebuilt-images/* =
$boot_partition/<br />-<br />- # Create the rootfs tarball contents<br />- =
root_partition=3D"$package_root/root_partition"<br />- mkdir -p $root_parti=
tion<br />- cp $test_dir/temp/filesystem/$FS_FILTER*.$FS_IMAGE_TYPE $root_p=
artition/rootfs_partition.$FS_IMAGE_TYPE<br />-}<br />-<br />-copy_golden_i=
mage() {<br />- # Set m for logging purposes<br />- m=3D$1<br />-<br />- ar=
ago_tmp=3D`ls | grep "arago-tmp-*"`<br />-<br />- # This is a critical fail=
ure and will not be able to be skipped<br />- if [ "$arago_tmp" =3D=3D "" ]=
<br />- then<br />- echo "Could not find the arago-tmp directory"<br />- re=
turn 1<br />- fi<br />-<br />- img_path=3D"$arago_tmp/deploy/images/$m"<br =
/>-<br />- # check that the img_path exists<br />- if [ ! -d $img_path ]<br=
 />- then<br />- echo "Images directory for machine $m is missing from arag=
o-tmp"<br />- return 1<br />- fi<br />-<br />- dest_path=3D"golden/"<br />-=
 rm -rf $dest_path/$m<br />-<br />- mkdir $dest_path/$m<br />- cp -a $img_p=
ath $dest_path<br />-}<br />-<br />-test_sdk_image() {<br />- # Set m for l=
ogging purposes<br />- m=3D"$1"<br />- test_passed=3D"false"<br />-<br />- =
# Create a temporary directory to extract the build files to for<br />- # t=
esting. If the directory already exists then delete the old<br />- # conten=
ts first.<br />- test_dir=3D"$TEST_ROOT/$m-test"<br />-<br />- if [ -d $tes=
t_dir ]<br />- then<br />- rm -rf $test_dir<br />- fi<br />- mkdir -p $test=
_dir<br />-<br />- # Always extract the SDK so we can package the internal =
contents,<br />- # even if we don't do testing and re-package the tested fi=
les.<br />- extract_sdk_image $m<br />- if [ "$?" !=3D "0" ]<br />- then<br=
 />- return 1<br />- fi<br />-<br />- # Delete old rootfs test directory<br=
 />- nfs_dir=3D"$NFS_ROOT/$m-test"<br />- if [ -d $nfs_dir ]<br />- then<br=
 />- # Clean the old directory<br />- sudo rm -rf $nfs_dir<br />- fi<br />-=
<br />- # Only run the build testing if the config file says to do so<br />=
- if [ "$RUN_BUILD_TESTS" =3D=3D "true" ]<br />- then<br />- run_target_sid=
e_test $m<br />-<br />- if [ "$?" !=3D "0" ]<br />- then<br />- # Check if =
this was a CRITICAL failure<br />- grep "CRITICAL" $LOG_DIR/$m-test-result.=
txt &gt; /dev/null 2&gt;&amp;1<br />- if [ "$?" =3D=3D "0" -a "$SKIP_TEST_F=
AILURES" =3D=3D "false" ]<br />- then<br />- # This was a critical failure =
so return without copying<br />- # the files<br />- return 1<br />- fi<br /=
>- else<br />- echo "PASSED" &gt; $LOG_DIR/$m-test-result.txt<br />- test_p=
assed=3D"true"<br />- fi<br />-<br />- else<br />- echo "SKIPPED" &gt; $LOG=
_DIR/$m-test-result.txt<br />- fi<br />-<br />- # Getting here means that e=
ither<br />- # 1. The test passed<br />- # 2. The test failed with a non-CR=
ITICAL error and SKIP_TEST_FAILURES<br />- # was set to true.<br />- packag=
e_tested_rootfs $m<br />- if [ ! -z $SDK_FILTER ]<br />- then<br />- copy_f=
iles_to_package_root $m<br />- fi<br />-<br />- if [ "$test_passed" =3D=3D =
"true" -a $COPY_GOLDEN_TO_WEB =3D=3D "true" ]<br />- then<br />- copy_golde=
n_image $m<br />- fi<br />-}<br />-<br /># This function receives a comma s=
eparated list of machines to build and test.<br /># The flow is to do the b=
itbake operations to generate the images and SDK<br /># content, then call =
to the opentest system (if so desired) while starting the<br />@@ -478,19 +=
110,6 @@ bitbake_sdk_images(){<br /># If it does not exist, then there is n=
ot much we can do, so inhibit the<br /># error code.<br />mv $build_dir/bit=
bake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log || true<br />-<b=
r />- # Only run the build testing if the status of the above builds<br />-=
 # was "pass"<br />- if [ "$build_status" =3D=3D "pass" ]<br />- then<br />=
- if [ ! "$EXIT_AFTER_BUILD" =3D "true" ]; then<br />- test_sdk_image $m &a=
mp;<br />- else<br />- echo "SKIPPED" &gt; $LOG_DIR/$m-test-result.txt<br /=
>- fi<br />- else<br />- echo "SKIPPED" &gt; $LOG_DIR/$m-test-result.txt<br=
 />- fi<br />done<br /><br /># Wait for all build/test processes to finish =
before exiting<br />-- <br />2.7.4</blockquote>

--16Urapr045OFaKjzXeTO--
