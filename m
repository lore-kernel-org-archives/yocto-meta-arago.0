Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CB799529D7
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:08:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ8rZM023966;
	Fri, 20 Jun 2014 14:08:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ8r25017464;
	Fri, 20 Jun 2014 14:08:53 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:08:52 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 17/19] arago.conf: with unification on
	mainline, remove PACKAGE_ARCH logic
Thread-Index: AQHPjLJvD69snGn9hk6vsZvuoNClzZt6XJXA
Date: Fri, 20 Jun 2014 19:08:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D61C9@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-18-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-18-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 17/19] arago.conf: with unification on mainline, remove PACKAGE_ARCH logic
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
X-List-Received-Date: Fri, 20 Jun 2014 19:08:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does this mean that a fix for this issue was pushed to mainline?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, June 20, 2014 12:57 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 17/19] arago.conf: with unification on mainl=
ine,
> remove PACKAGE_ARCH logic
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index 7bd1de2..b652fda 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -72,12 +72,3 @@ ENTERPRISE_DISTRO =3D "1"
>  # Arago based SDK. No need to prevent gst-ffmpeg from being used since w=
e
> # disable troublesome software.
>  LICENSE_FLAGS_WHITELIST =3D "commercial_gst-ffmpeg"
> -
> -# Some machines with the same architecture use different kernel versions=
.
> -# Set PACKAGE_ARCH to allow packages to be seperated by both architectur=
e
> and -# linux-libc-headers version.
> -PACKAGE_ARCH :=3D "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-
> headers}"
> -# Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS variable -
> PACKAGE_ARCHS +=3D "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-
> headers}"
> -# Adjust some vars accordingly
> -STAGING_BINDIR_TOOLCHAIN =3D
> "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}-
> ${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-
> ${TARGET_OS}"
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

