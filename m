Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A861052A39
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:17:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNHhWk027544
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:17:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNHhA3020431
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:17:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Sun, 12 May 2013 18:17:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/2] linux-am335x: Update variables for sourceipk
Thread-Index: AQHOSqcnRF/DN2ZbMkSmX4+w7pODSJkCOFxQ
Date: Sun, 12 May 2013 23:17:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C4544D9@DFLE08.ent.ti.com>
References: <1367878495-17492-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1367878495-17492-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux-am335x: Update variables for sourceipk
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
X-List-Received-Date: Sun, 12 May 2013 23:17:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Monday, May 06, 2013 5:15 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 1/2] linux-am335x: Update variables for sourceipk
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../linux/linux-am335x-psp_3.2.bbappend            |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-
> psp_3.2.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x-
> psp_3.2.bbappend
> index 3c02ca6..701666f 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappen=
d
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappe
> +++ nd
> @@ -1,6 +1,6 @@
> -PR_append =3D "-arago3"
> +PR_append =3D "-arago4"
>=20
>  # KVER is used by arago-source-ipk.conf -KVER =3D "${PV}"
> +KVER =3D "3.2.0-psp04.06.00.10"
>=20
>  require copy-defconfig.inc
> --
> 1.7.0.4


