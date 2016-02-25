Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E9802529EA
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 20:04:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PK4khT000624
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 14:04:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PK4kVO032032
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 14:04:46 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 25 Feb 2016 14:04:46 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] Enhance kmscube demo to support AM3
Thread-Index: AQHRcASFx2xB2dl3IEe4iRICF0TzCZ89L1Ew
Date: Thu, 25 Feb 2016 20:04:45 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A14232505@DFLE09.ent.ti.com>
References: <1456428679-25796-1-git-send-email-e-ruei1@ti.com>
	<20160225194113.GK29852@edge>
In-Reply-To: <20160225194113.GK29852@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Enhance kmscube demo to support AM3
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
X-List-Received-Date: Thu, 25 Feb 2016 20:04:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Yes, the one should be applied to GLSDK.

Best regards,

Eric
-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, February 25, 2016 2:41 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] Enhance kmscube demo to support AM3

Eric,

Any plans to upstream patches to GLSDK repo?

Karthik,

Who owns that repo and would you be willing to take them up?

--=20
Denys


On Thu, Feb 25, 2016 at 02:31:19PM -0500, Eric Ruei wrote:
> Enable AM3 support by adding "tilcdc" to the modules list at kmscube.c
>=20
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 ++++++++++++++++=
++++++
>  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  9 +++----
>  2 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube/00=
01-kmscube.c-init_drm-enable-AM3-support.patch
>=20
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmsc=
ube.c-init_drm-enable-AM3-support.patch b/meta-arago-extras/recipes-graphic=
s/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
> new file mode 100644
> index 0000000..64b7b04
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-i=
nit_drm-enable-AM3-support.patch
> @@ -0,0 +1,28 @@
> +From 82a3cc3ddec96fba7204f5ecab0890801a0b54b4 Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Thu, 25 Feb 2016 09:49:24 -0500
> +Subject: [PATCH] kmscube.c: init_drm(): enable AM3 support
> +
> +Enable AM3 support by adding "tilcdc" to the modules list.
> +
> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + kmscube.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/kmscube.c b/kmscube.c
> +index 5a18c32..919b3e7 100644
> +--- a/kmscube.c
> ++++ b/kmscube.c
> +@@ -84,7 +84,7 @@ struct drm_fb {
> + static int init_drm(void)
> + {
> + 	static const char *modules[] =3D {
> +-			"omapdrm", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> ++			"omapdrm", "tilcdc", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> + 	};
> + 	drmModeRes *resources;
> + 	drmModeConnector *connector =3D NULL;
> +--=20
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb =
b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> index 484a46b..138a55b 100644
> --- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> @@ -5,18 +5,19 @@ LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;en=
dline=3D23;md5=3De760965096e52da8
> =20
>  DEPENDS =3D "libdrm libgbm omap5-sgx-ddk-um-linux"
> =20
> -COMPATIBLE_MACHINE =3D "ti43x|omap-a15"
> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  inherit autotools pkgconfig
> =20
> -PR =3D "r4"
> +PR =3D "r5"
>  SRCREV =3D "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
> =20
>  SRC_URI =3D "git://git.ti.com/glsdk/kmscube.git;protocol=3Dgit"
> =20
> -SRC_URI_append_ti43x =3D " \
> -    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.pat=
ch \
> +SRC_URI_append =3D " \
> +    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.pat=
ch \
> +    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

