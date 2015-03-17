Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3515152A0B
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 15:38:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HFc5I7031847
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:38:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HFc4wl023318
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:38:04 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 10:38:04 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-processor-sdk: Set more preferences
Thread-Index: AQHQYMLM/5jwaMMnpEK3AT8N+H1lsZ0hGLEA//+2SvA=
Date: Tue, 17 Mar 2015 15:38:03 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410F4DD@DFLE09.ent.ti.com>
References: <1426604292-11709-1-git-send-email-j-stiffler@ti.com>
	<20150317150108.GH4669@edge>
In-Reply-To: <20150317150108.GH4669@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] branding-processor-sdk: Set more preferences
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
X-List-Received-Date: Tue, 17 Mar 2015 15:38:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. But I wanted to have this here for our release in case it may change i=
n the future.=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 17, 2015 11:01 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] branding-processor-sdk: Set more preferen=
ces

Isn't u-boot-ti-staging-2014.07% already a default for am3/4?

On Tue, Mar 17, 2015 at 10:58:12AM -0400, Jacob Stiffler wrote:
> * AUTOREV linux-ti-staging and u-boot-ti-staging for omap-a15
> * Freeze u-boot for am335x-evm and am437x-evm.
> * Add commit message for linux-ti-staging.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/include/branding-processor-sdk.inc |   23 ++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git=20
> a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc=20
> b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> index d277aac..c2327fa 100644
> --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -4,10 +4,30 @@ ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
>  DISTRO_FEATURES_remove_ti33x =3D "wayland"
>  DISTRO_FEATURES_remove_ti43x =3D "wayland"
> =20
> +# Set preferred providers and srcrevs
>  PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "sitara-linux-ti-stagin=
g"
>  PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "sitara-linux-ti-stagin=
g"
>  PREFERRED_VERSION_sitara-linux-ti-staging =3D "3.14%"
> =20
> +# Auto rev important packages to pick up latest
> +SRCREV_pn-u-boot-ti-staging_omap-a15 =3D "${AUTOREV}"
> +SRCREV_pn-ltp-ddt_omap-a15 =3D "${AUTOREV}"
> +
> +# am3 and am4 use sitara-linux-ti-staging, so this only applies to=20
> +omap-a15 SRCREV_pn-linux-ti-staging =3D "${AUTOREV}"
> +
> +# Freeze am3 and am4 u-boot
> +PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-ti-staging"
> +PREFERRED_VERSION_u-boot-ti-staging_am335x-evm =3D "2014.07%"
> +SRCREV_pn-u-boot-ti-staging_am335x-evm =3D "7e537bfdd261bf8bf444f3ac4d1b=
e3db4ee124e8"
> +
> +PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
> +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D "2014.07%"
> +SRCREV_pn-u-boot-ti-staging_am437x-evm =3D "7e537bfdd261bf8bf444f3ac4d1b=
e3db4ee124e8"
> +
> +
>  # To create newlines in the message \n is used and the slash must be=20
> escaped  # to function properly
> =20
> @@ -28,6 +48,9 @@ script located in the sdk\'s bin directory\\n\  The=20
> script may take several minutes but you will then have a full copy=20
> of\\n\  the git repository including its entire git history.\\n"
> =20
> +SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging =3D "processor-sdk-1.0"
> +SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging =3D "${SRCIPK_SHALLOW_GIT_=
COMMIT_MESSAGE}"
> +
>  SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging =3D "processor-sdk-1=
.0"
>  SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging =3D "${SRCIPK_SHALL=
OW_GIT_COMMIT_MESSAGE}"
> =20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

