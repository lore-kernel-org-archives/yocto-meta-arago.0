Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B184D52A80
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:41:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIfw7i029687;
	Thu, 24 Jul 2014 13:41:58 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIfwPF017217;
	Thu, 24 Jul 2014 13:41:58 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 13:41:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2 11/11] arago.conf: use the new _remove
	override to filter out sgx feature
Thread-Index: AQHPor9LmwZ57zU++UeDt+VlGQknEZuvmEoA
Date: Thu, 24 Jul 2014 18:41:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9C5F@DFLE08.ent.ti.com>
References: <1405709522-404-11-git-send-email-denis@denix.org>
	<1405712061-14868-1-git-send-email-denis@denix.org>
In-Reply-To: <1405712061-14868-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/11] arago.conf: use the new _remove override to filter out sgx feature
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
X-List-Received-Date: Thu, 24 Jul 2014 18:41:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 3:34 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2 11/11] arago.conf: use the new _remove
> override to filter out sgx feature
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - do not remove local filter_out function, still used by ASSUME_PROVID=
ED
>=20
>  meta-arago-distro/conf/distro/arago.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index 2686264..3ac30ce 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -49,7 +49,7 @@ TARGET_CPPFLAGS +=3D "-fstack-protector"
>  require conf/distro/include/arago-prefs.inc
>=20
>  # Hack out sgx flag for now, as breaking on kernels >=3D 3.14 -
> MACHINE_FEATURES :=3D "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
> +MACHINE_FEATURES_remove =3D "sgx"
>=20
>  # Allow branding on top of Arago Distro and Core TI-SDK  # If ARAGO_BRAN=
D
> is not set in local.conf, default to core
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

