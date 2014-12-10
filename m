Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4A68E529F7
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 17:22:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBAHMIHR020016
	for <meta-arago@arago-project.org>; Wed, 10 Dec 2014 11:22:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAHMHXr026516
	for <meta-arago@arago-project.org>; Wed, 10 Dec 2014 11:22:18 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 10 Dec 2014 11:22:17 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH] package-sdks:
	Generate	the SD Card image.
Thread-Index: AQHQFIZh9SC4Db9JuEe2Dn0cGiTqSJyJEZzQ
Date: Wed, 10 Dec 2014 17:22:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7AAE99@DFLE08.ent.ti.com>
References: <1418222049-9374-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1418222049-9374-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH] package-sdks: Generate	the SD Card image.
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
X-List-Received-Date: Wed, 10 Dec 2014 17:22:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you add some error checking to insure that the loop device is available=
 (not currently being used) and if not switch to another loop device? Also =
in case of an error you free the loop device.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, December 10, 2014 8:34 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH] package-sdks: Generate
> the SD Card image.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/package-sdks |   82
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks index
> 31a44b6..dc3eb13 100644
> --- a/lib/oesdk/package-sdks
> +++ b/lib/oesdk/package-sdks
> @@ -9,6 +9,84 @@ then
>      exit 1
>  fi
>=20
> +create_sd_card_img() {
> +    m=3D"$1"
> +
> +    sd_card_img_file=3D"${m}-${TISDK_VERSION}.img"
> +
> +    # Make the machine specific SD card directory
> +    sd_card_img_root=3D"$DEPLOY_ROOT/$m/$BUILD_ID/sd_card_img"
> +
> +    if [ -d $sd_card_img_root ]
> +    then
> +        rm -rf $sd_card_img_root
> +    fi
> +    mkdir -p $sd_card_img_root
> +
> +    cd $sd_card_img_root
> +
> +    ## Create an image file full of zeros
> +    dd if=3D/dev/zero of=3D"${sd_card_img_file}" bs=3D1024 count=3D$[200=
0*1024]
> +
> +    ## Mount the file to the loopback device
> +    sudo losetup /dev/loop0 "${sd_card_img_file}"
> +
> +    ## Partition the loopback into 2 partitions
> +    sudo parted -s /dev/loop0 mklabel msdos
> +    sudo parted -s /dev/loop0 unit cyl mkpart primary fat32 -- 0 9
> +    sudo parted -s /dev/loop0 set 1  boot on
> +    sudo parted -s /dev/loop0 unit cyl mkpart primary ext2 -- 9 -2
> +
> +    ## Format the partitions with the necessary filesystems
> +    sudo mkfs.vfat -F 32 -I -n boot /dev/loop0p1
> +    sudo mkfs.ext3 -L rootfs /dev/loop0p2
> +
> +    ## Use fdisk to get offsets (will need to multiply by blocksize (512=
))
> +    sudo fdisk -l ${sd_card_img_file}
> +
> +    local FDISK_INFO=3D`sudo fdisk -l "${sd_card_img_file}"`
> +
> +    local UNIT_SIZE=3D`echo "$FDISK_INFO" | grep Units | awk '{ print $9
> + }'`
> +
> +    local P1_START=3D`echo "$FDISK_INFO" | grep "${sd_card_img_file}1" |
> awk '{ print $3 }'`
> +    local P1_END=3D`echo "$FDISK_INFO" | grep "${sd_card_img_file}1" |
> + awk '{ print $4 }'`
> +
> +    local P2_START=3D`echo "$FDISK_INFO" | grep "${sd_card_img_file}2" |
> awk '{ print $2 }'`
> +    local P2_END=3D`echo "$FDISK_INFO" | grep "${sd_card_img_file}2" |
> + awk '{ print $3 }'`
> +
> +    ## Unmount the loopback device
> +    sudo losetup -d /dev/loop0
> +
> +    ## Mount the individual partitions of the loopback device for file c=
opying
> +    ## The Start (after-o option) and sizelimit numbers come from multip=
lying
> the output
> +    ## of fdisk above by blocksize (512 in this case) for the appropriat=
e
> partition.
> +    ## 1048576 =3D 2048 * 512
> +    ## 74448384 =3D 145407 * 512
> +    sudo losetup /dev/loop0 "${sd_card_img_file}" -o $[$P1_START *
> + $UNIT_SIZE] --sizelimit $[$P1_END * $UNIT_SIZE]
> +
> +    mkdir ./temp_boot
> +    sudo mount -t vfat /dev/loop0 ./temp_boot
> +    sudo tar xzf ${sd_card_root}/boot_partition.tar.gz -C ./temp_boot/
> +
> +    ## Follow the above steps using numbers for the second partition.
> +    sudo losetup /dev/loop1 "${sd_card_img_file}" -o $[$P2_START *
> $UNIT_SIZE] --sizelimit $[$P2_END * $UNIT_SIZE]
> +    mkdir ./temp_rootfs
> +    sudo mount -t ext3 /dev/loop1 ./temp_rootfs
> +    sudo tar xzf ${sd_card_root}/rootfs_partition.tar.gz -C
> + ./temp_rootfs/
> +
> +    ## Gzip the img file to save lot of space
> +    zip -r ${sd_card_img_file}.zip ${sd_card_img_file}
> +
> +    ## Clean up when done
> +    sudo umount ./temp_boot
> +    sudo umount ./temp_rootfs
> +    sudo rm -rf ./temp_boot/
> +    sudo rm -rf ./temp_rootfs/
> +    sudo losetup -d /dev/loop0
> +    sudo losetup -d /dev/loop1
> +    sudo rm -rf ${sd_card_img_file}
> +}
> +
>  create_sd_card_content() {
>      # Set m for logging purposes
>      m=3D"$1"
> @@ -291,6 +369,8 @@ package_web_content() {
>      # Move the installer into the exports directory
>      mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/
>=20
> +    mv $sd_card_img_root/${m}-${TISDK_VERSION}.img.zip $exports_root/
> +
>      # Create the md5sum file
>      cd $exports_root
>      md5sum * > md5sum.txt
> @@ -373,6 +453,8 @@ package_individual_sdk() {
>      # Create the SD card tarballs in the deploy directory
>      create_sd_card_content $m
>=20
> +    create_sd_card_img $m
> +
>      # Package the SD card and web page contents to get ready for
>      # generating the webgen page and publishing the SDK
>      package_web_content $m
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

