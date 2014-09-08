Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 67368529DD
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 21:39:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88LdV22024276;
	Mon, 8 Sep 2014 16:39:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88LdV0q026628;
	Mon, 8 Sep 2014 16:39:31 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 8 Sep 2014 16:39:31 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest:
	only pass u-boot and spl/uart when enabled in config
Thread-Index: AQHPy55Zl/yqFRpxmUKILCVjVA4Z4Zv3wz2A
Date: Mon, 8 Sep 2014 21:39:29 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72C4DB@DFLE08.ent.ti.com>
References: <1410205737-7590-1-git-send-email-denis@denix.org>
In-Reply-To: <1410205737-7590-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH 1/2] run-opentest: only pass u-boot and spl/uart when enabled in config
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
X-List-Received-Date: Mon, 08 Sep 2014 21:39:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Should we make this variable specific to am335x some how then?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 08, 2014 2:49 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest: only
> pass u-boot and spl/uart when enabled in config
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Introduce new variable OPENTEST_BOOTLOADERS to control it, but defaults
> to false.
> This never worked as expected, since SPL/UART is only supported by am335x
> and on other platforms it causes OpenTest to miss the escape window and i=
t
> can't stop boot sequence to configure the necessary parameters.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  configs/arago-core-tisdk-daisy-puget.txt |  4 ++++
>  lib/run-opentest                         | 17 ++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>=20
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
> diff --git a/lib/run-opentest b/lib/run-opentest index a64e4cc..1a71ae8
> 100644
> --- a/lib/run-opentest
> +++ b/lib/run-opentest
> @@ -206,15 +206,18 @@ run_target_side_test() {
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
> +    if [ "$OPENTEST_BOOTLOADERS" =3D=3D "true" ]
>      then
> -        spluart=3D"~primary_bootloader=3D$(ls $test_dir/temp/board-
> support/prebuilt-images/u-boot-spl.bin-$m)"
> +        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.*=
 ]
> +        then
> +            uboot=3D"~secondary_bootloader=3D$(ls $test_dir/temp/board-
> support/prebuilt-images/u-boot-$m.*)"
> +        fi
> +
> +        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.=
bin-$m
> ]
> +        then
> +            spluart=3D"~primary_bootloader=3D$(ls $test_dir/temp/board-
> support/prebuilt-images/u-boot-spl.bin-$m)"
> +        fi
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

