Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 680BF52972
	for <meta-arago@arago-project.org>;
	Thu, 11 Sep 2014 23:22:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8BNM9l6014547;
	Thu, 11 Sep 2014 18:22:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8BNM9Q2018411;
	Thu, 11 Sep 2014 18:22:09 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 11 Sep 2014 18:22:09 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2 1/2] run-opentest: only pass u-boot and
	spl/uart for am335x paltforms when enabled in config
Thread-Index: AQHPzhaXLvzLXXNwSEW018YcC4Kp+Zv8khhw
Date: Thu, 11 Sep 2014 23:22:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72FA06@DFLE08.ent.ti.com>
References: <1410477436-16291-1-git-send-email-denis@denix.org>
In-Reply-To: <1410477436-16291-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] run-opentest: only pass u-boot and spl/uart for am335x paltforms when enabled in config
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
X-List-Received-Date: Thu, 11 Sep 2014 23:22:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks!

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, September 11, 2014 6:17 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2 1/2] run-opentest: only pass u-boot and
> spl/uart for am335x paltforms when enabled in config
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Introduce new variable OPENTEST_BOOTLOADERS to control it, which
> defaults to true.
> * Since SPL/UART is only supported by am335x, check for the platform
> before passing it
>   to OpenTest.
> * On other platforms it causes OpenTest to miss the escape window and it
> can't stop
>   boot sequence to configure the necessary parameters.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - do machine check, switch the default to "true" as before
>=20
>  configs/amsdk/amsdk-config-08.00.00.00.txt      |  4 ++++
>  configs/arago-core-tisdk-daisy-puget.txt        |  4 ++++
>  configs/coresdk/arago-core-tisdk-2014.08.00.txt |  4 ++++
>  configs/distroless-meta-ti-puget.txt            |  4 ++++
>  lib/run-opentest                                | 26 +++++++++++++++++--=
------
>  5 files changed, 34 insertions(+), 8 deletions(-)
>=20
> diff --git a/configs/amsdk/amsdk-config-08.00.00.00.txt
> b/configs/amsdk/amsdk-config-08.00.00.00.txt
> index ff724e9..07d3024 100644
> --- a/configs/amsdk/amsdk-config-08.00.00.00.txt
> +++ b/configs/amsdk/amsdk-config-08.00.00.00.txt
> @@ -176,6 +176,10 @@ OPENTEST_TEE_IP=3D"none"
>  # Defaults to "linux" if not set
>  OPENTEST_HW_CAP=3D"linux_tid_farm"
>=20
> +# Determine whether SPL/UART and U-boot binaries are passed to
> OpenTest
> +for # testing. Otherwise uses existing bootloaders on the board (SD,
> +NAND, etc) OPENTEST_BOOTLOADERS=3D"true"
> +
>  # This variable will allow control over whether to perform build testing=
 or  #
> skip it.  This should usually be set to true but may be changed for  #
> prototyping.
> diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-cor=
e-
> tisdk-daisy-puget.txt
> index c132baf..f8bfb7a 100644
> --- a/configs/arago-core-tisdk-daisy-puget.txt
> +++ b/configs/arago-core-tisdk-daisy-puget.txt
> @@ -177,6 +177,10 @@ OPENTEST_TEE_IP=3D"none"
>  # Limit the board selection to official TI GT farm, avoiding personal bo=
ards
> OPENTEST_HW_CAP=3D"linux_tigt_farm"
>=20
> +# Determine whether SPL/UART and U-boot binaries are passed to
> OpenTest
> +for # testing. Otherwise uses existing bootloaders on the board (SD,
> +NAND, etc) OPENTEST_BOOTLOADERS=3D"false"
> +
>  # This variable will allow control over whether to perform build testing=
 or  #
> skip it.  This should usually be set to true but may be changed for  #
> prototyping.
> diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> index 1a5e20c..f0ff41c 100644
> --- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> +++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> @@ -176,6 +176,10 @@ OPENTEST_TEE_IP=3D"none"
>  # Defaults to "linux" if not set
>  OPENTEST_HW_CAP=3D"linux_tid_farm"
>=20
> +# Determine whether SPL/UART and U-boot binaries are passed to
> OpenTest
> +for # testing. Otherwise uses existing bootloaders on the board (SD,
> +NAND, etc) OPENTEST_BOOTLOADERS=3D"false"
> +
>  # This variable will allow control over whether to perform build testing=
 or  #
> skip it.  This should usually be set to true but may be changed for  #
> prototyping.
> diff --git a/configs/distroless-meta-ti-puget.txt b/configs/distroless-me=
ta-ti-
> puget.txt
> index 917b125..d08d0b1 100644
> --- a/configs/distroless-meta-ti-puget.txt
> +++ b/configs/distroless-meta-ti-puget.txt
> @@ -163,6 +163,10 @@ OPENTEST_TEE_IP=3D"none"
>  # Limit the board selection to official TI GT farm, avoiding personal bo=
ards
> OPENTEST_HW_CAP=3D"linux_tigt_farm"
>=20
> +# Determine whether SPL/UART and U-boot binaries are passed to
> OpenTest
> +for # testing. Otherwise uses existing bootloaders on the board (SD,
> +NAND, etc) OPENTEST_BOOTLOADERS=3D"false"
> +
>  # This variable will allow control over whether to perform build testing=
 or  #
> skip it.  This should usually be set to true but may be changed for  #
> prototyping.
> diff --git a/lib/run-opentest b/lib/run-opentest index a64e4cc..4d8d2b0
> 100644
> --- a/lib/run-opentest
> +++ b/lib/run-opentest
> @@ -5,7 +5,7 @@ set_opentest_platform() {
>      machine=3D"$1"
>=20
>      case $machine in
> -        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-
> evm|beagleboard|am335x-evm|omap5-evm|dra7xx-evm )
> +
> + am37x-evm|am180x-evm|am3517-evm|da850-omapl138-
> evm|beagleboard|beagleb
> + one|am335x-evm|omap5-evm|dra7xx-evm )
>              oplatform=3D$machine
>              ;;
>          am437x-evm )
> @@ -28,6 +28,9 @@ set_opentest_dtb() {
>          am335x-evm )
>              odtb=3D"am335x-evm.dtb"
>              ;;
> +        beaglebone )
> +            odtb=3D"am335x-boneblack.dtb"
> +            ;;
>          am437x-evm )
>              odtb=3D"am43x-epos-evm.dtb"
>              ;;
> @@ -206,15 +209,22 @@ run_target_side_test() {
>      fi
>=20
>      uboot=3D""
> -    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
> -    then
> -        uboot=3D"~secondary_bootloader=3D$(ls $test_dir/temp/board-
> support/prebuilt-images/u-boot-$m.*)"
> -    fi
> -
>      spluart=3D""
> -    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-=
$m ]
> +    if [ "$OPENTEST_BOOTLOADERS" !=3D "false" ]
>      then
> -        spluart=3D"~primary_bootloader=3D$(ls $test_dir/temp/board-
> support/prebuilt-images/u-boot-spl.bin-$m)"
> +        case $m in
> +            am335x-evm|beaglebone )
> +                if [ -f $test_dir/temp/board-support/prebuilt-images/u-b=
oot-$m.*
> ]
> +                then
> +                    uboot=3D"~secondary_bootloader=3D$(ls $test_dir/temp=
/board-
> support/prebuilt-images/u-boot-$m.*)"
> +                fi
> +
> +                if [ -f $test_dir/temp/board-support/prebuilt-images/u-b=
oot-
> spl.bin-$m ]
> +                then
> +                    spluart=3D"~primary_bootloader=3D$(ls $test_dir/temp=
/board-
> support/prebuilt-images/u-boot-spl.bin-$m)"
> +                fi
> +                ;;
> +        esac
>      fi
>=20
>      # Start the STAF process if not already started
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

