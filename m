Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5A588529AF
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 20:12:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t26KCt8e019457
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 14:12:55 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26KCsDo020981
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 14:12:54 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 6 Mar 2015 14:12:54 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: Add
	dual-camera-demo.
Thread-Index: AQHQWEhJ8lFfZdNrIEm82r2UNJngNZ0P4zoQ
Date: Fri, 6 Mar 2015 20:12:53 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C839010@DFLE08.ent.ti.com>
References: <1425672057-643-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425672057-643-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-arago-tisdk-matrix: Add	dual-camera-demo.
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
X-List-Received-Date: Fri, 06 Mar 2015 20:12:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank and u probably want to bump the PR.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Friday, March 06, 2015 2:01 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: Add dual-
> camera-demo.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 9e00619..228a91a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-matrix.bb
> @@ -82,9 +82,10 @@ MATRIX_APPS_append_ti43x =3D "        \
>      matrix-gui-pm-demos-suspend     \
>      matrix-gui-clocks               \
>      matrix-gui-pm-demos-governor    \
> +    matrix-gui-apps-dual-camera     \
> +    matrix-gui-apps-image-gallery   \
>      ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d=
)} \  "
> -# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-
> camera matrix-gui-apps-image-gallery', d)}
>=20
>  MATRIX_APPS_append_omap-a15 =3D "     \
>      matrix-multimedia-demo-aac      \
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

