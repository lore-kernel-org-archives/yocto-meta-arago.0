Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D6D5152986
	for <meta-arago@arago-project.org>;
	Tue, 14 Aug 2012 21:11:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7ELBSl7014395;
	Tue, 14 Aug 2012 16:11:28 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7ELBSWh032620;
	Tue, 14 Aug 2012 16:11:28 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 14 Aug 2012 16:11:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH] matrix-gui-oprofile-demos: Update RDEPENDS
Thread-Index: AQHNejQLOUf9OE4dkEe5pjc6mfH9KpdZzZxw
Date: Tue, 14 Aug 2012 21:11:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C29F728@DFLE09.ent.ti.com>
References: <1344873428-7710-1-git-send-email-fcooper@ti.com>
	<1344873428-7710-2-git-send-email-fcooper@ti.com>
	<20120814154647.GA1094@denix.org>
In-Reply-To: <20120814154647.GA1094@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] matrix-gui-oprofile-demos: Update RDEPENDS
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
X-List-Received-Date: Tue, 14 Aug 2012 21:11:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That makes sense. Will do so in the future. Thx

-----Original Message-----
From: Denys Dmytriyenko [mailto:denis@denix.org]=20
Sent: Tuesday, August 14, 2012 10:47 AM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] matrix-gui-oprofile-demos: Update RDEPEND=
S

Franklin,

Just a nit-pick for the future - to not break bisectability, you should=20
normally do this in 2 commits:

1. add oprofile-example recipe AND switch the RDEPENDS
2. remove the old reference from am-sysinfo

Denys


On Mon, Aug 13, 2012 at 10:57:07AM -0500, Franklin S Cooper Jr wrote:
> * Replace the RDEPENDS from am-sysinfo to oprofile-example.
>   The application oprofile-example use to be located within
>   am-sysinfo but now is located in its own repository.
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../matrix/matrix-gui-oprofile-demos_2.0.bb        |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-de=
mos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demo=
s_2.0.bb
> index e8aad0b..d3246f9 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0=
.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0=
.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "CC-BY-SA"
> =20
>  require matrix-gui-apps-git.inc
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  inherit allarch
> =20
> @@ -13,6 +13,6 @@ S =3D "${WORKDIR}/git/oprofile_apps"
>  # Make sure profiling submenu and app images  has been installed
>  # Include am-sysinfo because that package has the sample
>  # executables for profiling.
> -RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-oprofile oprof=
ile am-sysinfo"
> +RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-oprofile oprof=
ile oprofile-example"
> =20
>  FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

