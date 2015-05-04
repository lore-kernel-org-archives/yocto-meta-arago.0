Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 65B5952A4D
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2015 11:32:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t44BWLiE014626;
	Mon, 4 May 2015 06:32:21 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t44BWKrG008831;
	Mon, 4 May 2015 06:32:20 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 4 May 2015 06:32:20 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ltp-ddt: don't fail do_install when no
	modules	were built
Thread-Index: AQHQhEsGE+TlYP67AkmL95z1TdLAY51rsw8g
Date: Mon, 4 May 2015 11:32:18 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905819AD68@DLEE11.ent.ti.com>
References: <1430511067-12742-1-git-send-email-denis@denix.org>
In-Reply-To: <1430511067-12742-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ltp-ddt: don't fail do_install when no modules	were built
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
X-List-Received-Date: Mon, 04 May 2015 11:32:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, May 01, 2015 4:11 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] ltp-ddt: don't fail do_install when no modu=
les
> were built
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Reported by Sam Nelson, but implemented in more lightweight fashion.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> index 68e1a3c..3b2132a 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> @@ -87,7 +87,7 @@ do_install() {
>      oe_runmake install
>      install -d ${D}${datadir}
>      install -d ${D}${kmoddir}
> -    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir} || true
>  }
>=20
>  # do_make_scripts should be a separate task for the lock to work
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

