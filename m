Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5B6FB529DD
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 14:48:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s53EmDiR020008;
	Tue, 3 Jun 2014 09:48:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53EmC2k004531;
	Tue, 3 Jun 2014 09:48:13 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 3 Jun 2014 09:48:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/5] arago-prefs: make ARAGO_QT_PROVIDER
	aware	of Qt5
Thread-Index: AQHPftPJNv4w/KPnA0uEUuEPohPBZptfdl+A
Date: Tue, 3 Jun 2014 14:48:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C22A7@DFLE08.ent.ti.com>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-4-git-send-email-denis@denix.org>
In-Reply-To: <1401762581-31370-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] arago-prefs: make ARAGO_QT_PROVIDER aware	of Qt5
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
X-List-Received-Date: Tue, 03 Jun 2014 14:48:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Currently we also use ARAGO_QT_PROVIDER to determine if we need to include =
 GLES based applications or not specifically quick-playground.

We also use it to set QT_SGX_SUPPORT in packagegroup-arago-qte-toolchain-ta=
rget.bb and packagegroup-arago-qte.bb so maybe we need to pull this variabl=
e to arago-prefs.inc make it a boolean variable. This way we can still cond=
itional set it to TRUE depending on the Qt 4 version we are using and alway=
s set it to true for Qt 5.

Once we fixup the QT_SGX_SUPPORT variable then we can use that variable to =
determine if a gles application should be pulled in or not.


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, June 02, 2014 9:30 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 3/5] arago-prefs: make ARAGO_QT_PROVIDER
> aware of Qt5
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> As ARAGO_QT_PROVIDER is used to select between gles and non-gles versions
> of Qt4, make it aware of Qt5 and set it empty in that case.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 6ae11e9..0885acf 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -25,7 +25,7 @@ PREFERRED_VERSION_libdrm =3D "2.4.46"
>=20
>  PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>=20
> -ARAGO_QT_PROVIDER =3D "${@base_contains('MACHINE_FEATURES','sgx','qt4-
> embedded-gles','qt4-embedded',d)}"
> +ARAGO_QT_PROVIDER =3D
> "${@base_contains('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES
> ','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
>  PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
>=20
>  PREFERRED_VERSION_qt4-embedded =3D "4.8.5"
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

