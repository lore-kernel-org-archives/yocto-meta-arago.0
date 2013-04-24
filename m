Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2B7C05298C
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 19:16:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OJGYgd009784
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:16:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OJGYqL026037
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:16:34 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 24 Apr 2013 14:16:34 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
	and	.out support in Matrix PHP
Thread-Index: AQHOQRmm2v4/ekKE60WHst7aJ2e8gZjlvKug
Date: Wed, 24 Apr 2013 19:16:34 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1366828154-17755-1-git-send-email-hzhang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-lighttpd-config: add static cgi and	.out support in Matrix PHP
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
X-List-Received-Date: Wed, 24 Apr 2013 19:16:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi" =
=3D> "/bin/sh",  ".o" =3D> "" )

Can you give an example of the .cgi and .o file that requires this change?


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhang, Hao
> Sent: Wednesday, April 24, 2013 1:29 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi and =
.out
> support in Matrix PHP
>=20
> From: Hao Zhang <hzhang@ti.com>
>=20
> ---
>  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config/lighttpd.conf.matrix b/meta-arago-extras/recipes-
> core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> index 82a9fb8..2dce736 100755
> --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config/lighttpd.conf.matrix
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/light
> +++ tpd.conf.matrix
> @@ -137,7 +137,7 @@ $HTTP["url"] =3D~ "\.pdf$" {  # which extensions shou=
ld
> not be handle via static-file transfer  #  # .php, .pl, .fcgi are most of=
ten
> handled by mod_fastcgi or mod_cgi -static-file.exclude-extensions =3D ( "=
.php",
> ".pl", ".fcgi" )
> +static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi", ".cgi", ".o=
"
> +)
>=20
>  ######### Options that are good to be but not neccesary to be changed
> #######
>=20
> @@ -225,7 +225,7 @@ compress.filetype          =3D ("text/plain",
> "text/html","text/javascript","text/
>  #                            )
>=20
>  #### CGI module
> -cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi")
> +cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi"=
 =3D>	"/bin/sh",
> ".o" =3D> "" )
>  #cgi.assign                 =3D ( ".pl"  =3D> "/usr/bin/perl",
>  #                               ".cgi" =3D> "/usr/bin/perl" )
>  #
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

