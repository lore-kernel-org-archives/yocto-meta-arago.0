Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9F15D529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:54:50 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA1Isn3W021618;
	Thu, 1 Nov 2012 13:54:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA1IsnEU023292;
	Thu, 1 Nov 2012 13:54:49 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 1 Nov 2012 13:54:49 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-amsdk-image: Add additional tasks
	and	image
Thread-Index: AQHNuF+8eUDVxRuYSkC7eNX4icLRF5fVU6dA
Date: Thu, 1 Nov 2012 18:54:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159290E2B@DLEE12.ent.ti.com>
References: <1351794950-4321-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1351794950-4321-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] arago-amsdk-image: Add additional tasks and	image
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
X-List-Received-Date: Thu, 01 Nov 2012 18:54:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This depends on your patch that renames the arago-tisdk-image.  Without pat=
ch series numbers it's hard to know the ordering.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Thursday, November 01, 2012 1:36 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] arago-amsdk-image: Add additional
> tasks and image
>=20
> * Add additional sdk-host tasks and target filesystem image
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/images/arago-amsdk-image.bb       |   13
> ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-
> image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-
> image.bb
> index 82e0527..6ddcb8b 100644
> --- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> @@ -13,9 +13,16 @@ HOST_CLEANUP_PACKAGES =3D ""
>  TOOLCHAIN_CLEANUP_PACKAGES =3D ""
>=20
>  # List of target side images to build for the SDK
> -TARGET_IMAGES =3D "arago-base-tisdk-image"
> -
> -IMAGE_INSTALL =3D "task-arago-tisdk-addons-sdk-host"
> +TARGET_IMAGES =3D "arago-base-tisdk-image tisdk-rootfs-image"
> +
> +IMAGE_INSTALL =3D "\
> +    task-arago-tisdk-addons-sdk-host \
> +    task-arago-tisdk-connectivity-sdk-host \
> +    task-arago-tisdk-crypto-sdk-host \
> +    task-arago-tisdk-matrix-sdk-host \
> +    task-arago-tisdk-multimedia-sdk-host \
> +    task-arago-tisdk-qte-sdk-host \
> +"
>=20
>  export IMAGE_BASENAME =3D "arago-amsdk-image"
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

