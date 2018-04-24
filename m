Return-Path: <yan-liu@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 90AD1529C7
	for <meta-arago@arago-project.org>;
	Tue, 24 Apr 2018 17:03:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3OH3cYn016929
	for <meta-arago@arago-project.org>; Tue, 24 Apr 2018 12:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524589418;
	bh=lj71n95K2vRWl6odRMYT+oFb7/G2L36d6HX7Br6pio8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=wHDwpZONu0wRsr5FMtNt+BBBIAW27iADD+Dr07ITTQhjD2xMFAlLbfUMXx4/mzjJz
	3v7P/lSkC9TKVY3HE7OC2u309tyktjXeRzy3jO+BryTmutioGim0FP5lH+z7t2/pz9
	yYb1Da7fplF99KBZsVEF/pAcscI+KfRUHWgXYsss=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3OH3cKC021512
	for <meta-arago@arago-project.org>; Tue, 24 Apr 2018 12:03:38 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Apr 2018 12:03:37 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
	DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
	15.01.1466.003; Tue, 24 Apr 2018 12:03:37 -0500
From: "Liu, Yan" <yan-liu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v1] ltp-ddt: Update to latest
Thread-Index: AQHT2+0QmonJzpEZ+kO5U9a2YI77O6QQJC7g
Date: Tue, 24 Apr 2018 17:03:37 +0000
Message-ID: <eca12ff049be4c14a8706ea2ac0009c8@ti.com>
References: <1524507176-14297-1-git-send-email-yan-liu@ti.com>
	<20180424165534.GF15846@edge>
In-Reply-To: <20180424165534.GF15846@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.223]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Tue, 24 Apr 2018 17:03:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Yes.

I sent one first; but since I did not get email, I thought I did not send. =
So I send it again. Sorry for confusion.

Thanks,
Yan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, April 24, 2018 12:56 PM
To: Liu, Yan
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v1] ltp-ddt: Update to latest

Is it a duplicate of the same one from yesterday?


On Mon, Apr 23, 2018 at 02:12:56PM -0400, yan-liu@ti.com wrote:
> From: Yan Liu <yan-liu@ti.com>
>=20
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> index f506c91..1517d17 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> @@ -4,7 +4,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -PR =3D "r3"
> +PR =3D "r4"
>  PV_append =3D "+git${SRCPV}"
> =20
>  PROVIDES +=3D "ltp"
> @@ -39,7 +39,7 @@ RDEPENDS_${PN} =3D "\
> =20
>  inherit autotools-brokensep
> =20
> -SRCREV =3D "5b4a12d2d372262cf1184a11340c0ee4f8e93f46"
> +SRCREV =3D "e2f4f79f1707b63586157801f63050d8f8479b67"
>  BRANCH ?=3D "master"
> =20
>  SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-dd=
t.git;branch=3D${BRANCH} \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

