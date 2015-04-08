Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D386952A81
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 12:02:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38C2uhH018664
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 07:02:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38C2sgv011775
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 07:02:55 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 8 Apr 2015 07:02:54 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host:
	Include tisdk-uenv.
Thread-Index: AQHQcenGSPnQPaU0WEirT4XWALNnIJ1DBBBB
Date: Wed, 8 Apr 2015 12:02:53 +0000
Message-ID: <C8CE0126-1DF0-4B76-ADA7-F331BCF02018@ti.com>
References: <1428490195-31174-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1428490195-31174-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host:	Include tisdk-uenv.
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
X-List-Received-Date: Wed, 08 Apr 2015 12:02:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why do you need uEnv.txt especially since it's blank from what I remember?


> On Apr 8, 2015, at 5:50 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> * If tisdk-readme is packaged, then the uEnv.txt should also be
>  packaged.
> * Package both if not amsdk.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-amsdk-sdk-host.bb
> index 61886ff..c6994ee 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
> @@ -23,8 +23,8 @@ TOOLS_append_am3517-evm =3D " flash-utility"
>=20
> EXTRA_FILES =3D ""
> EXTRA_FILES_omap-a15 =3D "tisdk-readme tisdk-uenv"
> -EXTRA_FILES_ti33x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','tis=
dk-readme',d)}"
> -EXTRA_FILES_ti43x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','tis=
dk-readme',d)}"
> +EXTRA_FILES_ti33x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','tis=
dk-readme tisdk-uenv',d)}"
> +EXTRA_FILES_ti43x =3D "${@base_conditional('ARAGO_BRAND','amsdk','','tis=
dk-readme tisdk-uenv',d)}"
>=20
> RDEPENDS_${PN} =3D "\
>     ${TOOLS} \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

