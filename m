Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A0DFA52981
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 01:13:00 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r321CxlH020467;
	Mon, 1 Apr 2013 20:12:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r321CxoU008719;
	Mon, 1 Apr 2013 20:12:59 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 20:12:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/3] RFC: Add branding support for
	products to	tweak preferences
Thread-Index: AQHOLzxXtlPkOoAj+kCZp2u6KmH0jZjCH2mA
Date: Tue, 2 Apr 2013 01:12:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C419438@DFLE08.ent.ti.com>
References: <1364863868-14687-1-git-send-email-denis@denix.org>
In-Reply-To: <1364863868-14687-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] RFC: Add branding support for products to	tweak preferences
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
X-List-Received-Date: Tue, 02 Apr 2013 01:13:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

PATCH 2/3 missing?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, April 01, 2013 7:51 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 0/3] RFC: Add branding support for products
> to tweak preferences
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * For cases when products based on Arago Core TI-SDK need to select
> different
>   providers or versions of packages. For example, AM-SDK needs to stay on
> the
>   stable kernel 3.2, while Core TI-SDK is moving to the new kernel 3.8.
> * Adding new branding policies requires creating a new branding-<name>.in=
c
> file
>   and setting ARAGO_BRAND=3D<name> in the local.conf
> * The default branding is "core" when ARAGO_BRAND is not set and is mostl=
y
> empty
>   to fall back on the default Arago Core TI-SDK preferences.
>=20
> Denys Dmytriyenko (3):
>   arago.conf: add branding support to allow products to tweak
>     preferences
>   branding-amsdk: add the initial AM-SDK branding policy
>   arago-prefs: set default preferences to the latest TI staging kernel
>     and u-boot
>=20
>  meta-arago-distro/conf/distro/arago.conf                 | 7 +++++++
>  meta-arago-distro/conf/distro/include/arago-prefs.inc    | 9 +++------
>  meta-arago-distro/conf/distro/include/branding-amsdk.inc | 8 ++++++++
> meta-arago-distro/conf/distro/include/branding-core.inc  | 6 ++++++
>  4 files changed, 24 insertions(+), 6 deletions(-)  create mode 100644 me=
ta-
> arago-distro/conf/distro/include/branding-amsdk.inc
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> core.inc
>=20
> --
> 1.8.1.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

