Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5E2145296F
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 00:49:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O0n4IO002423;
	Mon, 23 Sep 2013 19:49:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O0n4vd000942;
	Mon, 23 Sep 2013 19:49:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 23 Sep 2013 19:49:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2] sourceipk: do not dereference symlinks
	when packaging data to avoid breakage
Thread-Index: AQHOuL5YhnF5iNjWfEOvT0dci20Kv5nUC9sw
Date: Tue, 24 Sep 2013 00:49:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55B6CB@DFLE08.ent.ti.com>
References: <1379983066-10782-1-git-send-email-denis@denix.org>
In-Reply-To: <1379983066-10782-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Tue, 24 Sep 2013 00:49:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My mail must be acting up since I didn't get this patch until after I sent =
my version.

I can verify that it works since it's almost identical to the patch I sent =
:)

Tested-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 23, 2013 7:38 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCHv2] sourceipk: do not dereference symlinks wh=
en
> packaging data to avoid breakage
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Preserve the sources in its original state, even if there are broken sy=
mlinks.
> * Process patches/ directory to dereference patch files there before pack=
aging.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/classes/sourceipk.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> index 1ea0577..dbe0b70 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -160,6 +160,14 @@ sourceipk_do_create_srcipk() {
>              tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C
> $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
>          fi
>=20
> +        # Fix up patches/ directory to contain actual patches instead of=
 symlinks
> +        if [ -e $tmp_dir/${SRCIPK_INSTALL_DIR}/patches ]
> +        then
> +            mv $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
> $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
> +            cp -rL $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
> $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
> +            rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
> +        fi
> +
>          if [ ${SRCIPK_INCLUDE_EXTRAFILES} !=3D "0" ]
>          then
>              sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/ @@ -
> 167,7 +175,7 @@ sourceipk_do_create_srcipk() {
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

