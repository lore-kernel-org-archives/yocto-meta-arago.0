Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DC455529DE
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 14:34:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBAEYCSU024049
	for <meta-arago@arago-project.org>; Wed, 10 Dec 2014 08:34:12 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAEYCum013792
	for <meta-arago@arago-project.org>; Wed, 10 Dec 2014 08:34:12 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 10 Dec 2014 08:34:11 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAEYBlR024823;
	Wed, 10 Dec 2014 08:34:11 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XyiLD-0002Rk-3C;
	Wed, 10 Dec 2014 09:34:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Dec 2014 09:34:09 -0500
Message-ID: <1418222049-9374-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] package-sdks: Generate the SD Card image.
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
X-List-Received-Date: Wed, 10 Dec 2014 14:34:13 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/package-sdks |   82 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 31a44b6..dc3eb13 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -9,6 +9,84 @@ then
     exit 1
 fi
 
+create_sd_card_img() {
+    m="$1"
+
+    sd_card_img_file="${m}-${TISDK_VERSION}.img"
+
+    # Make the machine specific SD card directory
+    sd_card_img_root="$DEPLOY_ROOT/$m/$BUILD_ID/sd_card_img"
+
+    if [ -d $sd_card_img_root ]
+    then
+        rm -rf $sd_card_img_root
+    fi
+    mkdir -p $sd_card_img_root
+
+    cd $sd_card_img_root
+
+    ## Create an image file full of zeros
+    dd if=/dev/zero of="${sd_card_img_file}" bs=1024 count=$[2000*1024]
+
+    ## Mount the file to the loopback device
+    sudo losetup /dev/loop0 "${sd_card_img_file}"
+
+    ## Partition the loopback into 2 partitions
+    sudo parted -s /dev/loop0 mklabel msdos
+    sudo parted -s /dev/loop0 unit cyl mkpart primary fat32 -- 0 9
+    sudo parted -s /dev/loop0 set 1  boot on
+    sudo parted -s /dev/loop0 unit cyl mkpart primary ext2 -- 9 -2
+
+    ## Format the partitions with the necessary filesystems
+    sudo mkfs.vfat -F 32 -I -n boot /dev/loop0p1
+    sudo mkfs.ext3 -L rootfs /dev/loop0p2
+
+    ## Use fdisk to get offsets (will need to multiply by blocksize (512))
+    sudo fdisk -l ${sd_card_img_file}
+
+    local FDISK_INFO=`sudo fdisk -l "${sd_card_img_file}"`
+
+    local UNIT_SIZE=`echo "$FDISK_INFO" | grep Units | awk '{ print $9 }'`
+
+    local P1_START=`echo "$FDISK_INFO" | grep "${sd_card_img_file}1" | awk '{ print $3 }'`
+    local P1_END=`echo "$FDISK_INFO" | grep "${sd_card_img_file}1" | awk '{ print $4 }'`
+
+    local P2_START=`echo "$FDISK_INFO" | grep "${sd_card_img_file}2" | awk '{ print $2 }'`
+    local P2_END=`echo "$FDISK_INFO" | grep "${sd_card_img_file}2" | awk '{ print $3 }'`
+
+    ## Unmount the loopback device
+    sudo losetup -d /dev/loop0
+
+    ## Mount the individual partitions of the loopback device for file copying
+    ## The Start (after-o option) and sizelimit numbers come from multiplying the output
+    ## of fdisk above by blocksize (512 in this case) for the appropriate partition.
+    ## 1048576 = 2048 * 512
+    ## 74448384 = 145407 * 512
+    sudo losetup /dev/loop0 "${sd_card_img_file}" -o $[$P1_START * $UNIT_SIZE] --sizelimit $[$P1_END * $UNIT_SIZE]
+
+    mkdir ./temp_boot
+    sudo mount -t vfat /dev/loop0 ./temp_boot
+    sudo tar xzf ${sd_card_root}/boot_partition.tar.gz -C ./temp_boot/
+
+    ## Follow the above steps using numbers for the second partition.
+    sudo losetup /dev/loop1 "${sd_card_img_file}" -o $[$P2_START * $UNIT_SIZE] --sizelimit $[$P2_END * $UNIT_SIZE]
+    mkdir ./temp_rootfs
+    sudo mount -t ext3 /dev/loop1 ./temp_rootfs
+    sudo tar xzf ${sd_card_root}/rootfs_partition.tar.gz -C ./temp_rootfs/
+
+    ## Gzip the img file to save lot of space
+    zip -r ${sd_card_img_file}.zip ${sd_card_img_file}
+
+    ## Clean up when done
+    sudo umount ./temp_boot
+    sudo umount ./temp_rootfs
+    sudo rm -rf ./temp_boot/
+    sudo rm -rf ./temp_rootfs/
+    sudo losetup -d /dev/loop0
+    sudo losetup -d /dev/loop1
+    sudo rm -rf ${sd_card_img_file}
+}
+
 create_sd_card_content() {
     # Set m for logging purposes
     m="$1"
@@ -291,6 +369,8 @@ package_web_content() {
     # Move the installer into the exports directory
     mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/
 
+    mv $sd_card_img_root/${m}-${TISDK_VERSION}.img.zip $exports_root/
+
     # Create the md5sum file
     cd $exports_root
     md5sum * > md5sum.txt
@@ -373,6 +453,8 @@ package_individual_sdk() {
     # Create the SD card tarballs in the deploy directory
     create_sd_card_content $m
 
+    create_sd_card_img $m
+
     # Package the SD card and web page contents to get ready for
     # generating the webgen page and publishing the SDK
     package_web_content $m
-- 
1.7.9.5


