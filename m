Return-Path: <nikhil.nd@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EB30152A4B
	for <meta-arago@arago-project.org>;
	Wed, 28 Jan 2015 06:34:28 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0S6YRf8011872
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 00:34:27 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0S6YM0Y021487
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 12:04:24 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Wed, 28 Jan 2015 12:04:22 +0530
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests
	packages
Thread-Index: AQHQOsQYyv7DA1HJxEeHHtZ3GnUY2JzVErfQ
Date: Wed, 28 Jan 2015 06:34:21 +0000
Message-ID: <E60A9E1B4132A24DB80BD56ABC92684735043FCF@DBDE04.ent.ti.com>
References: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
In-Reply-To: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests packages
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
X-List-Received-Date: Wed, 28 Jan 2015 06:34:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
The patch http://dflvsu0004.dal.design.ti.com/patch/12353/ in meta-ti
Splits the vpdma-fw and vpe-tests recipes
This patch is needed to update the package group in meta-arago correspondin=
gly


> -----Original Message-----
> From: Devshatwar, Nikhil
> Sent: Wednesday, January 28, 2015 12:02 PM
> To: meta-arago@arago-project.org
> Cc: R, Karthik; Devshatwar, Nikhil
> Subject: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests
> packages
>=20
> The vpdma-fw and vpe-tests are independent packages now.
> Adding them both in the packagegroup.
>=20
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-test.bb
> index 6af1321..83ba20e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> @@ -44,7 +44,8 @@ ARAGO_TI_TEST_append_omap-a15 =3D " \
>      "
>=20
>  ARAGO_TI_TEST_append_dra7xx =3D " \
> -    vpe-vpdma \
> +    vpdma-fw \
> +    vpe-tests \
>      "
>=20
>  RDEPENDS_${PN} =3D "\
> --
> 1.7.9.5


