Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8DD98529DD
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:03:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76N3OTt029490
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:03:24 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76N3OA3024077
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:03:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 6 Aug 2014 18:03:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/2] u-boot-ti-staging: Use AM57x branch/git tree
Thread-Index: AQHPscMP5sw4uk3GwUiQGL7EvnCsbpvEMZqw
Date: Wed, 6 Aug 2014 23:03:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F5D96@DFLE08.ent.ti.com>
References: <1407362950-18844-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1407362950-18844-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] u-boot-ti-staging: Use AM57x branch/git tree
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
X-List-Received-Date: Wed, 06 Aug 2014 23:03:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore these two patches I need to send updated versions plus an additional=
 patch.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, August 06, 2014 5:09 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 1/2] u-boot-ti-staging: Use AM57x branch/git tree
>=20
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>=20
> * Currently AM57x support is hosted on a separate branch and git tree tha=
t is
>   based on the latest u-boot-ti-staging integration tree.
> * Point to this branch and git tree for am57xx-evm until it is merged.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../u-boot/u-boot-ti-staging_2014.07.bbappend      |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-
> ti-staging_2014.07.bbappend
> index 5b6ab64..1243058 100644
> --- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> staging_2014.07.bbappend
> +++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bba
> +++ ppend
> @@ -1,6 +1,17 @@
>  # Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so
> that  # we can test the latest mainline
>=20
> -PR_append =3D "-arago1+gitr${SRCPV}"
> +PR_append =3D "-arago2+gitr${SRCPV}"
> +
> +# AM57x EVM is currently on a seperate git tree/branch.
> +# Once the software has been integrated to the u-boot-ti-staging #
> +repository these lines can be removed.
> +
> +OLD_BRANCH :=3D "${BRANCH}"
> +SRC_URI_am57xx-evm :=3D "${@oe_filter_out('git://git.ti.com/ti-u-boot/ti=
-u-
> boot.git;protocol=3Dgit;branch=3D${OLD_BRANCH}','${SRC_URI}', d)}"
> +
> +BRANCH_am57xx-evm =3D "beaglex15"
> +
> +SRC_URI_am57xx-evm +=3D "git://github.com/felipebalbi/u-
> boot.git;protocol=3Dhttps;branch=3D${BRANCH}"
>=20
>  SRCREV =3D "${AUTOREV}"
> --
> 1.7.9.5


