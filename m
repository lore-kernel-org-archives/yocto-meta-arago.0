Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5C6B95298B
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 16:06:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61G6oEv025268
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:06:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61G6oI4007199
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:06:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 11:06:50 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/5] packagegroup-arago-test: make
	omapdrmtest	depend on mmip
Thread-Index: AQHPlUDMTVwWKb4ua0qSwDMzunix6puLYjMA
Date: Tue, 1 Jul 2014 16:06:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D80CD@DFLE08.ent.ti.com>
References: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
	<1404228360-7510-3-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404228360-7510-3-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] packagegroup-arago-test: make omapdrmtest	depend on mmip
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
X-List-Received-Date: Tue, 01 Jul 2014 16:06:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 10:26 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 3/5] packagegroup-arago-test: make
> omapdrmtest depend on mmip
>=20
> * The omapdrmtest package has dependencies on libdce which are
>   only valid when the MACHINE_FEATURES include mmip.  So don't
>   include this when that feature doesn't exist.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-test.bb
> index 54d44e1..429858b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
[Franklin] Has the PR server been enabled yet? If not PR bump.
> @@ -33,7 +33,7 @@ ARAGO_TI_TEST =3D "\
>  ARAGO_TI_TEST_append_omap-a15 =3D " \
>      omapconf \
>      ipc-test-fw \
> -    omapdrmtest \
> +    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} =
\
>      bvtest \
>      "
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

