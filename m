Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4BDC3529A0
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2013 19:40:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KJeufH027027;
	Fri, 20 Sep 2013 14:40:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KJeuSo015270;
	Fri, 20 Sep 2013 14:40:56 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 20 Sep 2013 14:40:56 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
	when packaging data to avoid breakage
Thread-Index: AQHOtjOrr8PUTT3Ks02uWWO/clsscJnPBhAA
Date: Fri, 20 Sep 2013 19:40:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5581A4@DFLE08.ent.ti.com>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
In-Reply-To: <1379703595-1330-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Fri, 20 Sep 2013 19:40:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tested-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, September 20, 2013 2:00 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] sourceipk: do not dereference symlinks when
> packaging data to avoid breakage
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/classes/sourceipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> index 1ea0577..777cb4f 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
>          fi
>=20
>          #Write the data tarball
> -        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf $srcipk_dir/data.t=
ar.gz .
> +        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf $srcipk_dir/data.ta=
r.gz .
>=20
>          # Create the debian-binary file
>          echo "2.0" > $srcipk_dir/debian-binary
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

