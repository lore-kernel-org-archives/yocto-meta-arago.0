Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8241952AB5
	for <meta-arago@arago-project.org>;
	Fri, 19 Oct 2012 17:35:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9JHZOko012208;
	Fri, 19 Oct 2012 12:35:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JHZOQi030602;
	Fri, 19 Oct 2012 12:35:24 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 19 Oct 2012 12:35:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] arago-tisdk-image: Create image that
	builds	Sitara SDK filesystem
Thread-Index: AQHNrYAcOZkPxhrj70SyrBd09LpTzpfA5QrQ
Date: Fri, 19 Oct 2012 17:35:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159271744@DLEE12.ent.ti.com>
References: <1350599386-7511-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350599386-7511-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v2] arago-tisdk-image: Create image that builds	Sitara SDK filesystem
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
X-List-Received-Date: Fri, 19 Oct 2012 17:35:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Thursday, October 18, 2012 5:30 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH v2] arago-tisdk-image: Create image
> that builds Sitara SDK filesystem
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Removed PR_append
>=20
>  .../recipes-core/images/arago-tisdk-image.bb       |   20
> ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/images/arago-
> tisdk-image.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-
> image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-
> image.bb
> new file mode 100644
> index 0000000..2011ab7
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
> @@ -0,0 +1,20 @@
> +# Arago TI SDK base image
> +# gives you an image with Qt/E and other common packages shared
> by all TI SDKs.

This comment doesn't seem right.  This gives you all the packages for an SD=
K, it is not the base image.

> +COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x"
> +
> +require arago-image.inc
> +
> +IMAGE_INSTALL +=3D "\
> +    task-arago-base \
> +    task-arago-base-tisdk \
> +    task-arago-console \
> +    task-arago-tisdk-graphics \
> +    task-arago-qte \
> +    task-arago-tisdk-addons \
> +    task-arago-tisdk-connectivity \
> +    task-arago-tisdk-crypto \
> +    task-arago-tisdk-matrix \
> +    task-arago-tisdk-multimedia \
> +"
> +
> +export IMAGE_BASENAME =3D "tisdk-rootfs"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

