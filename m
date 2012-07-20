Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EF5BA52079
	for <meta-arago@arago-project.org>;
	Fri, 20 Jul 2012 18:40:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6KIeHmx009152
	for <meta-arago@arago-project.org>; Fri, 20 Jul 2012 13:40:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6KIeHDu022343
	for <meta-arago@arago-project.org>; Fri, 20 Jul 2012 13:40:17 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 20 Jul 2012 13:40:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] am-sysinfo: Spell out protocol
Thread-Index: AQHNZgpsh3GPs9qNIkalS4+TJvK625cyghNA
Date: Fri, 20 Jul 2012 18:40:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015914C712@DLEE12.ent.ti.com>
References: <1342742263-4743-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1342742263-4743-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] am-sysinfo: Spell out protocol
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
X-List-Received-Date: Fri, 20 Jul 2012 18:40:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Thursday, July 19, 2012 6:58 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] am-sysinfo: Spell out protocol
>=20
> * Get rid of the warning that complains that in the SRC_URI proto
> is used
>   instead of protocol
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/am-sysinfo/am-sysinfo_svn.bb      |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-
> sysinfo_svn.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-
> sysinfo_svn.bb
> index 11ce229..40daafa 100644
> --- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
> +++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
> @@ -9,9 +9,9 @@ PACKAGE_STRIP =3D "no"
>=20
>  SRCREV =3D "16"
>  PV =3D "1.0"
> -PR =3D "r2+svnr${SRCPV}"
> +PR =3D "r3+svnr${SRCPV}"
>=20
> -SRC_URI =3D
> "svn://gforge.ti.com/svn/am_sysinfo/;module=3Dtrunk;proto=3Dhttps;use
> r=3Danonymous;pswd=3D''"
> +SRC_URI =3D
> "svn://gforge.ti.com/svn/am_sysinfo/;module=3Dtrunk;protocol=3Dhttps;
> user=3Danonymous;pswd=3D''"
>=20
>  S =3D "${WORKDIR}/trunk"
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

