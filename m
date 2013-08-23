Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9A96E529E8
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 21:08:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NL86Gw029139;
	Fri, 23 Aug 2013 16:08:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NL86UD007407;
	Fri, 23 Aug 2013 16:08:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 16:08:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
	LOCALVERSION	and AUTOREV
Thread-Index: AQHOoERNyVGqYPsC8kOE6zc7+d2x8pmjSKeQ
Date: Fri, 23 Aug 2013 21:08:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
References: <1377291818-28047-1-git-send-email-denis@denix.org>
In-Reply-To: <1377291818-28047-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION	and AUTOREV
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
X-List-Received-Date: Fri, 23 Aug 2013 21:08:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, August 23, 2013 4:04 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION
> and AUTOREV
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - removed the comment about upstreaming LOCALVERSION, may not
> happen
>=20
>  .../recipes-kernel/linux/linux-ti-staging_git.bbappend  | 17
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_git.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.=
bbappend
> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
> new file mode 100644
> index 0000000..f99482c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappen=
d
> @@ -0,0 +1,17 @@
> +MACHINE_KERNEL_PR_append =3D "-arago0"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
> +
> +require copy-defconfig.inc
[Franklin] Are we really planning on have different defconfigs for each  ma=
chine? I thought with DT all machines will share the same defconfig.
> +
> +SRCREV =3D "${AUTOREV}"
> +
> +KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).partition('+')[2][0:7]}"
> +
> +kernel_do_configure_prepend() {
> +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> +    then
> +        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> +        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> +    fi
> +}
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

