Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E92F3529AE
	for <meta-arago@arago-project.org>;
	Wed,  1 Apr 2015 10:39:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t31AdsKl028300
	for <meta-arago@arago-project.org>; Wed, 1 Apr 2015 05:39:54 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t31Adrha005634
	for <meta-arago@arago-project.org>; Wed, 1 Apr 2015 05:39:53 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 1 Apr 2015 05:39:52 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] sdk-install: Modify create-sdcard with
	user-supplied installation directory.
Thread-Index: AQHQYnX6ITouHn8xtUyYmFrQhZ1ZbZ0mXRkAgAOEYnCADinvcA==
Date: Wed, 1 Apr 2015 10:39:52 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411C4DD@DFLE09.ent.ti.com>
References: <1426791202-23545-1-git-send-email-j-stiffler@ti.com>
	<20150320233926.GR11557@edge>
	<4B26FB5A64EBA14C87266869E037F95814110789@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814110789@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sdk-install: Modify create-sdcard with user-supplied installation directory.
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
X-List-Received-Date: Wed, 01 Apr 2015 10:39:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Stiffler, Jacob
Sent: Monday, March 23, 2015 6:23 AM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] sdk-install: Modify create-sdcard with us=
er-supplied installation directory.

This is fine on its own. This is intended to work with the current version =
of create-sdcard.sh used in the SDKs.

-----Original Message-----
From: Dmytriyenko, Denys
Sent: Friday, March 20, 2015 7:39 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] sdk-install: Modify create-sdcard with us=
er-supplied installation directory.

Does this require a corresponding change to create-sdcard.sh in setup scrip=
ts?=20
Or should it go on its own?


On Thu, Mar 19, 2015 at 02:53:22PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../tisdk-install/tisdk-install/sdk-install.sh     |    6 ++++++
>  .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> all.sh
> b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> all.sh
> index cf90089..65c5b69 100644
> ---
> a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> all.sh
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-
> +++ install.sh
> @@ -102,6 +102,12 @@ then
>      sed -i -e s=3D__SDK_INSTALL_DIR__=3D$install_dir=3D
> $install_dir/bin/unshallow-repositories.sh
>  fi
> =20
> +# Modify create-sdcard.sh to have user-supplied installation=20
> +directory if [ -f "${install_dir}/bin/create-sdcard.sh" ] then
> +    sed -i -e "s|ti-sdk.*\[0-9\]|${install_dir##*/}|g"=20
> +${install_dir}/bin/create-sdcard.sh
> +fi
> +
>  # Update CCS project files using important paths to headers
> =20
>  find $install_dir/example-applications -type f -exec sed -i=20
> "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {}=20
> \; diff --git=20
> a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> index 83efd61..a3b88d9 100644
> ---
> a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.
> +++ bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://../sdk-install.sh;beginline=3D3;endline=3D19;md5=3D4b899037
> =20
>  SRC_URI =3D "file://sdk-install.sh"
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  do_install () {
>      install -d ${D}/
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

