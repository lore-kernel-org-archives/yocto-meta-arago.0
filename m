Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 07CB252972
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 20:50:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PKo20e032189
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 15:50:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PKo2XR026517
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 15:50:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 15:50:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] sourceipk: Fix git repo in copied sources
	not	original sources
Thread-Index: AQHO0bndy5gVjLr8h0qd+fqEEIAuEZoF4/YA
Date: Fri, 25 Oct 2013 20:50:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C587C6F@DFLE08.ent.ti.com>
References: <1382733112-3042-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1382733112-3042-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] sourceipk: Fix git repo in copied sources not	original sources
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
X-List-Received-Date: Fri, 25 Oct 2013 20:50:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Thanks for this!

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, October 25, 2013 3:32 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] sourceipk: Fix git repo in copied sources n=
ot
> original sources
>=20
> * Fix the adjust_git function to be called after the copy of
>   the original sources to the tmp_dir and to modify the git
>   sources in the copy rather than the original.
> * This also fixes an issue when trying to preserve the git
>   repository for the kernel where the following would happen:
>     1. sourceipk would run the first time and fix the git
>        remote url in the ${S} directory
>     2. during the compile phase the copy-defconfig functionality
>        would try to re-package the sources.
>     3. At this point the "old" directory found by sourceipk
>        class would be a git:// url instead of a directory on
>        the build system that pointed into the DL_DIR.
>     4. This would fail the -d check and go into the else
>        statement which would do rm -rf .git
>     5. The .git directory would not be preserved.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-arago-distro/classes/sourceipk.bbclass |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> index dbe0b70..b6ab37d 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -65,7 +65,7 @@ adjust_git() {
>=20
>      orig_dir=3D"$PWD"
>=20
> -    cd ${S}
> +    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>=20
>      if [ -d ".git" ]
>      then
> @@ -122,8 +122,6 @@ sourceipk_do_create_srcipk() {
>      if [ ${CREATE_SRCIPK} !=3D "0" ]
>      then
>=20
> -        adjust_git
> -
>          tmp_dir=3D"${WORKDIR}/sourceipk-tmp"
>          srcipk_dir=3D"${WORKDIR}/sourceipk-data"
>          mkdir -p $tmp_dir/CONTROL
> @@ -174,6 +172,10 @@ sourceipk_do_create_srcipk() {
>              cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
>          fi
>=20
> +        # Adjust the git repository if there is one.  Do this adjustment
> +        # here so we don't have to modify the original sources.
> +        adjust_git
> +
>          #Write the data tarball
>          tar -C $tmp_dir --owner=3D0 --group=3D0 -czf $srcipk_dir/data.ta=
r.gz .
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

