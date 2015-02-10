Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C31DB52A7E
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 19:50:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AJo7b8032049;
	Tue, 10 Feb 2015 13:50:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AJo6Sp021899;
	Tue, 10 Feb 2015 13:50:06 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 13:50:06 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-image,
	packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES,
	sans server
Thread-Index: AQHQRWaNb5nesldtbkaOY6OE7vaZEZzqSZcw
Date: Tue, 10 Feb 2015 19:50:05 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905811188E@DLEE11.ent.ti.com>
References: <1423595959-23271-1-git-send-email-denis@denix.org>
In-Reply-To: <1423595959-23271-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-image, packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES, sans server
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
X-List-Received-Date: Tue, 10 Feb 2015 19:50:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is this patch based on master? I am having trouble using the patch AS IS.
See comments inline.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, February 10, 2015 2:19 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago-image, packagegroup-arago-base-tisdk:
> move psplash to IMAGE_FEATURES, sans server
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
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
[Sam] I am not sure why is this needed. Appreciate if you clarify.
>  IMAGE_INSTALL +=3D "\
>      packagegroup-arago-base \
>      packagegroup-arago-console \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 704e840..c291a42 100644
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
> -PR =3D "r14"
> +PR =3D "r15"
>=20
>  inherit packagegroup
>=20
> @@ -12,7 +12,6 @@ RDEPENDS_${PN} =3D "\
>      libpcre \
>      iptables \
>      iperf \
> -    psplash \
[Sam] I see psplash getting removed here. Does not this be moved to a diffe=
rent package group? ( I don't see any addition to different package group).
>      arago-gpl-notice \
>      nfs-utils-client \
>      "
> --
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

