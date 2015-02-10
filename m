Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6042152A59
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 20:57:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AKvvN1007581;
	Tue, 10 Feb 2015 14:57:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKvu31001884;
	Tue, 10 Feb 2015 14:57:56 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 14:57:56 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] arago-image,
	packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES,
	sans server
Thread-Index: AQHQRWvuljGcjolcGUyvx6iNcLKjBJzqXYwg
Date: Tue, 10 Feb 2015 20:57:55 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058111A38@DLEE11.ent.ti.com>
References: <1423598270-30922-1-git-send-email-denis@denix.org>
In-Reply-To: <1423598270-30922-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] arago-image, packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES, sans server
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
X-List-Received-Date: Tue, 10 Feb 2015 20:57:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack.=20
This works.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, February 10, 2015 2:58 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2] arago-image, packagegroup-arago-base-
> tisdk: move psplash to IMAGE_FEATURES, sans server
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - rebase against recent master
>=20
>  meta-arago-distro/recipes-core/images/arago-image.inc                  |=
 2 +-
>  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb     |=
 2 ++
>  .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb        |=
 3 +--
>  3 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-
> arago-distro/recipes-core/images/arago-image.inc
> index 98af6c3..977ce8f 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -3,7 +3,7 @@
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
>=20
> -IMAGE_FEATURES +=3D "package-management"
> +IMAGE_FEATURES +=3D "package-management splash"
>=20
>  # 4KB per 1 inode should be enough
>  EXTRA_IMAGECMD_ext2.gz +=3D "-i 4096"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-im=
age.bb
> b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> index e5ce2b5..908325f 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> @@ -3,6 +3,8 @@ COMPATIBLE_MACHINE =3D
> "omap3|omapl138|ti33x|keystone"
>=20
>  require arago-image.inc
>=20
> +SPLASH =3D ""
> +
>  IMAGE_INSTALL +=3D "\
>      packagegroup-arago-base \
>      packagegroup-arago-console \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 7652622..0e8960f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-
> tisdk.bb
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
> @@ -12,7 +12,6 @@ RDEPENDS_${PN} =3D "\
>      libpcre \
>      iptables \
>      iperf \
> -    psplash \
>      arago-gpl-notice \
>      arago-feed-config \
>      nfs-utils-client \
> --
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

