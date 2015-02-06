Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DFD3352A72
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 18:59:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16IxWwL032146
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 12:59:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16IxV0M000945
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 12:59:31 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 12:59:31 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
	include	file
Thread-Index: AQHQQj5uPxsZ/sIux0GWO+RSCMW0e5zj+UZg
Date: Fri, 6 Feb 2015 18:59:30 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FAE76@DFLE08.ent.ti.com>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] branding-mcsdk: Adding MCSDK branding include	file
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
X-List-Received-Date: Fri, 06 Feb 2015 18:59:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why do u still need the commented PREFERRED_VERSIONs ur branding file?

Also what issue are you seeing that is preventing you from using libjpeg-tu=
rbo-native?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Friday, February 06, 2015 12:55 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> include file
>=20
> - To control preferred version and providers for MCSDK
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../conf/distro/include/branding-mcsdk.inc         |   20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> mcsdk.inc
>=20
> diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/m=
eta-
> arago-distro/conf/distro/include/branding-mcsdk.inc
> new file mode 100644
> index 0000000..d023b67
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> @@ -0,0 +1,20 @@
> +# MCSDK branding configuration
> +
> +# Use the MCSDK supported versions
> +PREFERRED_VERSION_libnl =3D "3.2.24"
> +
> +DISTRO_FEATURES +=3D "x11 opengl"
> +
> +# Java preferences.
> +#PREFERRED_VERSION_openjdk-7-jre =3D "25b30-2.3.12"
> +PREFERRED_VERSION_icedtea7-native =3D "2.1.3"
> +PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"
> +
> +PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
> +
> +PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
> +PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
> +
> +PREFERRED_PROVIDER_jpeg-native =3D "jpeg-native"
> +#PREFERRED_PROVIDER_jpeg-native =3D "libjpeg-turbo-native"
> +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 =3D "nativesdk-eglibc-locale"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

