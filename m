Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2449E52981
	for <meta-arago@arago-project.org>;
	Mon, 11 Aug 2014 20:48:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7BKmJjm020641
	for <meta-arago@arago-project.org>; Mon, 11 Aug 2014 15:48:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7BKmJcr028245
	for <meta-arago@arago-project.org>; Mon, 11 Aug 2014 15:48:19 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Mon, 11 Aug 2014 15:48:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 4/4 v2] linux-ti-staging: Use AM57x branch/git tree
Thread-Index: AQHPsngZAPyYg7S+EkGjA2PodkilVpvL5frQ
Date: Mon, 11 Aug 2014 20:48:18 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F9023@DFLE08.ent.ti.com>
References: <1407440703-21811-1-git-send-email-fcooper@ti.com>
	<1407440703-21811-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1407440703-21811-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4 v2] linux-ti-staging: Use AM57x branch/git tree
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
X-List-Received-Date: Mon, 11 Aug 2014 20:48:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You can ignore this patch since there are no longer separate kernel integra=
tion trees for am57x evm.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, August 07, 2014 2:45 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 4/4 v2] linux-ti-staging: Use AM57x branch/git tree
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
>  .../linux/linux-ti-staging_3.14.bbappend           |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.14.bbappend
> index b178b5e..b25df8f 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappe=
nd
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.14.bbappend
> @@ -1,4 +1,13 @@
> -MACHINE_KERNEL_PR_append =3D "-arago1"
> +MACHINE_KERNEL_PR_append =3D "-arago2"
> +
> +OLD_BRANCH :=3D "${BRANCH}"
> +SRC_URI_am57xx-evm :=3D "${@oe_filter_out('git://git.ti.com/ti-linux-
> kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${OLD_BRANCH}','${SRC_URI}', d)}"
> +
> +BRANCH_am57xx-evm =3D "beagle-x15-v3.14"
> +
> +SRC_URI_am57xx-evm +=3D "git://git.ti.com/~nmenon/ti-linux-kernel/ti-
> linux-x15-validate.git;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb am57xx-beagle-x15.dtb"
>=20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>=20
> --
> 1.7.9.5


