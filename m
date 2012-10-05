Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 71030529E1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:44:00 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95ChxqH032570;
	Fri, 5 Oct 2012 07:43:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95Chx8x012035;
	Fri, 5 Oct 2012 07:43:59 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:43:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-lighttpd: Fix PATH environment
	variable
Thread-Index: AQHNosH9VkFamys3rkK7wg2TLYcXZ5eqqFkQ
Date: Fri, 5 Oct 2012 12:43:58 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247D76@DLEE12.ent.ti.com>
References: <1349419893-21772-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419893-21772-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-lighttpd: Fix PATH environment variable
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
X-List-Received-Date: Fri, 05 Oct 2012 12:44:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:52 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] matrix-lighttpd: Fix PATH
> environment variable
>=20
> * Alot of Matrix applications were failing due to an incomplete
> list of
>   paths listed in the PATH environment variable when a shell
> script is
>   executed by PHP.
> * Add and configure mod_setenv module to explicitly set the PATH
> variable
>   to properly include all the necessary paths.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-lighttpd-config.bb  |    6 +++---
>  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    5 ++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-
> lighttpd-config.bb b/meta-arago-extras/recipes-
> core/matrix/matrix-lighttpd-config.bb
> index 8ecfa55..25188af 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config.bb
> @@ -1,11 +1,11 @@
>  DESCRIPTION =3D "Lighttpd config for Matrix"
>=20
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D
> "file://../lighttpd.conf.matrix;md5=3Dbf036dce30a4114d5942c1f8d0152
> 191"
> +LIC_FILES_CHKSUM =3D
> "file://../lighttpd.conf.matrix;md5=3D298ec80f6b2b837211de52081c5ee
> cc5"

This isn't a real license file.  Can you either add a License header or add=
 a License file to the SRC_URI?

>=20
>  inherit allarch
>=20
> -PR =3D "1"
> +PR =3D "2"

Should we go ahead and change this to r2 instead of just 2?

>=20
>  SRC_URI =3D "file://lighttpd.conf.matrix"
>=20
> @@ -15,7 +15,7 @@ do_install() {
>  }
>=20
>  FILES_${PN} =3D "${sysconfdir}/lighttpd.conf.matrix"
> -RDEPENDS_${PN} =3D "lighttpd"
> +RDEPENDS_${PN} =3D "lighttpd lighttpd-module-setenv"
>=20
>  pkg_postinst_${PN} () {
>  if [ -f $D${sysconfdir}/lighttpd.conf ] ; then
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-
> lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-
> core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> index d2e9217..82a9fb8 100755
> --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config/lighttpd.conf.matrix
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config/lighttpd.conf.matrix
> @@ -20,7 +20,7 @@ server.modules              =3D (
>  #                               "mod_trigger_b4_dl",
>  #                               "mod_auth",
>  #                               "mod_status",
> -#                               "mod_setenv",
> +                                "mod_setenv",
>                                  "mod_expire",
>  #                               "mod_fastcgi",
>  #                               "mod_proxy",
> @@ -296,6 +296,9 @@ $HTTP["url"] =3D~ "\.(jpg|gif|png)$" {
> expire.url =3D ( "" =3D> "access 3 years" ) }
>  #### setenv
>  #setenv.add-request-header  =3D ( "TRAV_ENV" =3D>
> "mysql://user@host/db" )
>  #setenv.add-response-header =3D ( "X-Secret-Message" =3D> "42" )
> +setenv.add-environment =3D (
> +    "PATH" =3D>
> "/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:."
> +)
>=20
>  ## for mod_trigger_b4_dl
>  # trigger-before-download.gdbm-filename =3D
> "/home/weigon/testbase/trigger.db"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

