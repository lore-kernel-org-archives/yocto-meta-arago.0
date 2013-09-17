Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5C4A1529CB
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2013 20:05:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8HK5AK8001497
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 15:05:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HK5ApP005079
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 15:05:10 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 17 Sep 2013 15:05:10 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
	file	system image
Thread-Index: AQHOs99tTHafF954906JGDI6H9a4fpnKWBrw
Date: Tue, 17 Sep 2013 20:05:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C553A50@DFLE08.ent.ti.com>
References: <1379445202-31364-1-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8A07BE@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E8A07BE@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] tisdk-rootfs-base-image: Rename base file	system image
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
X-List-Received-Date: Tue, 17 Sep 2013 20:05:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, September 17, 2013 2:52 PM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename bas=
e
> file system image
>=20
> What was the initial reason to start naming rootfs images with tisdk-root=
fs-
> prefix? I remember it was something forced by the SDK setup...
[Franklin]=20
This was before my time so I am not sure what the original reasoning was.

I do assume there might be instances where some script somewhere will need =
to be updated if it refers to the full image as "tisdk-rootfs*"=20

>=20
>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, September 17, 2013 3:13 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base fi=
le
> system image
>=20
> * People are frequently confused by the difference in naming between the
> minimal
>   file system and the larger file system.
> * Rename the minimal file system to mimic the naming convention of the la=
rger
>   file system.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...e-tisdk-image.bb =3D> tisdk-rootfs-base-image.bb} |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)  rename meta-arago-
> distro/recipes-core/images/{arago-base-tisdk-image.bb =3D> tisdk-rootfs-b=
ase-
> image.bb} (87%)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image=
.bb
> b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
> similarity index 87%
> rename from meta-arago-distro/recipes-core/images/arago-base-tisdk-
> image.bb
> rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.b=
b
> index 2c0e217..a3a9123 100644
> --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
> @@ -12,4 +12,4 @@ IMAGE_INSTALL +=3D "\
>      packagegroup-arago-base-tisdk \
>      "
>=20
> -export IMAGE_BASENAME =3D "arago-base-tisdk-image"
> +export IMAGE_BASENAME =3D "tisdk-rootfs-base-image"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

