Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E8A07529BC
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 16:07:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61G7SwF023940
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:07:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61G7SKL007818
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:07:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 11:07:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/5] packagegroup-arago-gst: make mmip
	elements	depend on mmip feature
Thread-Index: AQHPlUDOSsZuni8Rwkq5wEWverziBpuLYpMQ
Date: Tue, 1 Jul 2014 16:07:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D80DC@DFLE08.ent.ti.com>
References: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
	<1404228360-7510-4-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404228360-7510-4-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] packagegroup-arago-gst: make mmip elements	depend on mmip feature
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
X-List-Received-Date: Tue, 01 Jul 2014 16:07:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 10:26 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/5] packagegroup-arago-gst: make mmip
> elements depend on mmip feature
>=20
> * Don't include the multimedia accelerated elements when the
>   MACHINE_FEATURES do not include the mmip feature.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-gst.bb        |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-gst.bb
> index 03a04c4..a5367ea 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> gst.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> gst.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to add gstreamer and gstreamer plugins"
>  LICENSE =3D "MIT"
> -PR =3D "r7"
> +PR =3D "r8"
>=20
>  inherit packagegroup
>=20
> @@ -15,8 +15,8 @@ GSTREAMER =3D " \
>  "
>=20
>  GSTREAMER_ACCEL_MM =3D ""
> -GSTREAMER_ACCEL_MM_omap-a15 =3D "gst-plugins-ducati"
> -GSTREAMER_ACCEL_MM_append_dra7xx =3D " gst-plugins-vpe"
> +GSTREAMER_ACCEL_MM_omap-a15 =3D
> "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-ducati', '', d=
)}"
> +GSTREAMER_ACCEL_MM_append_dra7xx =3D
> "${@base_contains('MACHINE_FEATURES', 'mmip', ' gst-plugins-vpe', '', d)}=
"
>=20
>  RDEPENDS_${PN} =3D "\
>      ${GSTREAMER} \
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

