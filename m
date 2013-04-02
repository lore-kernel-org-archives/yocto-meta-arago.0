Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C1B175298C
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 14:23:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r32EN7TK028304;
	Tue, 2 Apr 2013 09:23:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32EN7qP001499;
	Tue, 2 Apr 2013 09:23:07 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 2 Apr 2013 09:23:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/3] RFC: Add branding support for
	products to	tweak preferences
Thread-Index: AQHOLzxXkDHwDPE0E0iaYBNb+eqbaJjC/J8w
Date: Tue, 2 Apr 2013 14:23:06 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B6B40@DLEE11.ent.ti.com>
References: <1364863868-14687-1-git-send-email-denis@denix.org>
In-Reply-To: <1364863868-14687-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Tue, 02 Apr 2013 14:23:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

For the whole series.  Thanks.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, April 01, 2013 7:51 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 0/3] RFC: Add branding support for
> products to tweak preferences
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * For cases when products based on Arago Core TI-SDK need to
> select different
>   providers or versions of packages. For example, AM-SDK needs to
> stay on the
>   stable kernel 3.2, while Core TI-SDK is moving to the new
> kernel 3.8.
> * Adding new branding policies requires creating a new branding-
> <name>.inc file
>   and setting ARAGO_BRAND=3D<name> in the local.conf
> * The default branding is "core" when ARAGO_BRAND is not set and
> is mostly empty
>   to fall back on the default Arago Core TI-SDK preferences.
>=20
> Denys Dmytriyenko (3):
>   arago.conf: add branding support to allow products to tweak
>     preferences
>   branding-amsdk: add the initial AM-SDK branding policy
>   arago-prefs: set default preferences to the latest TI staging
> kernel
>     and u-boot
>=20
>  meta-arago-distro/conf/distro/arago.conf                 | 7
> +++++++
>  meta-arago-distro/conf/distro/include/arago-prefs.inc    | 9
> +++------
>  meta-arago-distro/conf/distro/include/branding-amsdk.inc | 8
> ++++++++
>  meta-arago-distro/conf/distro/include/branding-core.inc  | 6
> ++++++
>  4 files changed, 24 insertions(+), 6 deletions(-)
>  create mode 100644 meta-arago-
> distro/conf/distro/include/branding-amsdk.inc
>  create mode 100644 meta-arago-
> distro/conf/distro/include/branding-core.inc
>=20
> --
> 1.8.1.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

