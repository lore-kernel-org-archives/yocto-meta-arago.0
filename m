Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C5CA65297F
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:16:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGGLpK002977
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:16:21 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGGKJK030849
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:16:20 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 10:16:19 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
	psplash	conditional with splash feature
Thread-Index: AQHQRUrSpfcJZ/Wr3ky4aFvJIjT345zqDUvA
Date: Tue, 10 Feb 2015 16:16:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FE138@DFLE08.ent.ti.com>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: Make psplash	conditional with splash feature
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
X-List-Received-Date: Tue, 10 Feb 2015 16:16:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Splash is not a distro feature we use so this will essentially remove it fr=
om all devices.

You can either put this in a packagegroup that isn't included for headless =
filesystems. But pick one that makes sense.
You can conditional include or not include psplash depending on machines.
You can use machine features and check for touchscreen. Although some kind =
of generic "display" machine feature would be better. But it currently does=
n't exist.
Or you can add splash as a distro feature for the various branding files ex=
cluding yours.


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Tuesday, February 10, 2015 10:01 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make psplash
> conditional with splash feature
>=20
> - This is meant to avoid error message with headless distribution
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 7652622..7b71aa4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Additional packages beyond console packages shared by T=
I
> SDKs"
>  LICENSE =3D "MIT"
> -PR =3D "r15"
> +PR =3D "r16"
>=20
>  inherit packagegroup
>=20
> @@ -12,7 +12,7 @@ RDEPENDS_${PN} =3D "\
>      libpcre \
>      iptables \
>      iperf \
> -    psplash \
> +    ${@base_contains('DISTRO_FEATURES', 'splash', 'psplash', '',d)} \
>      arago-gpl-notice \
>      arago-feed-config \
>      nfs-utils-client \
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

