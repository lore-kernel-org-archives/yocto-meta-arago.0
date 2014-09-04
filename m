Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6039A52992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:40:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HejCi028731
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:40:45 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Hej7X004200
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:40:45 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 12:40:45 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 2/4] package-sdks:
	Add	configuration parameter to specify the installer prefix.
Thread-Index: AQHPyGYMNKl2EoCUv0un1H/xwdsgmJvxPeLg
Date: Thu, 4 Sep 2014 17:40:44 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C728A52@DFLE08.ent.ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
	<1409851868-7389-2-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1409851868-7389-2-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH 2/4] package-sdks: Add	configuration parameter to specify the installer prefix.
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
X-List-Received-Date: Thu, 04 Sep 2014 17:40:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Thursday, September 04, 2014 12:31 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH 2/4] package-sdks: Add
> configuration parameter to specify the installer prefix.
>=20
> * The configuration parameter INSTALLER_PREFIX is used to set the prefix =
of
> the i
>   installer filename and the default installation directory.
> * This parameter must be set when PRODUCTIZE_SDK=3D"true"
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/package-sdks |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks index
> d6b01f7..9bfd887 100644
> --- a/lib/oesdk/package-sdks
> +++ b/lib/oesdk/package-sdks
> @@ -109,7 +109,7 @@ create_sd_card_content() {
>      cd $start_here_root
>=20
>      # Copy the installer
> -    cp $DEPLOY_ROOT/$m/$BUILD_ID/ti-sdk-$m* $start_here_root/
> +    cp $DEPLOY_ROOT/$m/$BUILD_ID/${INSTALLER_PREFIX}-$m*
> + $start_here_root/
>=20
>      if [ "$?" !=3D "0" ]
>      then
> @@ -184,7 +184,7 @@ create_sdk_installer() {
>=20
>      $INSTALL_BUILDER/builder build $INSTALL_BUILDER_PROJECT linux --
> setvars \
>          sdk_loc=3D"$installer_root/" \
> -        sdk_name_prefix=3D"ti-sdk"                  \
> +        sdk_name_prefix=3D"${INSTALLER_PREFIX}"                  \
>          sdk_tar_name=3D$sdk_tar                     \
>          output_dir=3D"$deploy_root"                 \
>          platform=3D"$m"                             \
> @@ -277,7 +277,7 @@ package_web_content() {
>      fi
>=20
>      # Move the installer into the exports directory
> -    mv $deploy_root/ti-sdk-$m* $exports_root/
> +    mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/
>=20
>      # Create the md5sum file
>      cd $exports_root
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

