Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7485D52079
	for <meta-arago@arago-project.org>;
	Fri, 20 Jul 2012 18:39:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6KIdub2027952
	for <meta-arago@arago-project.org>; Fri, 20 Jul 2012 13:39:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6KIduI6021814
	for <meta-arago@arago-project.org>; Fri, 20 Jul 2012 13:39:56 -0500
Received: from DFLE51.ent.ti.com (128.247.5.136) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.1.323.3;
	Fri, 20 Jul 2012 13:39:56 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE51.ent.ti.com ([fe80::d0bc:5ddf:b0f3:7664%25]) with mapi id
	14.01.0323.003; Fri, 20 Jul 2012 13:39:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] arm-benchmarks: Fix compile and
	install	issues
Thread-Index: AQHNZgly6HvDTuKz5UCeHhIso3JGbJcygfTA
Date: Fri, 20 Jul 2012 18:39:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015914C708@DLEE12.ent.ti.com>
References: <1342741832-3905-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1342741832-3905-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm-benchmarks: Fix compile and install	issues
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
X-List-Received-Date: Fri, 20 Jul 2012 18:39:58 -0000
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
> Sent: Thursday, July 19, 2012 6:51 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 2/2] arm-benchmarks: Fix compile and
> install issues
>=20
> * The TUNE_PKGARCH variable isn't providing the expected arch
> value. Switch to
>   ARMPKGARCH since it returns the expected value.
> * Spell out protocol to get rid of warning.
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../arm-benchmarks/arm-benchmarks_1.3.bb           |    8 ++++--
> --
>  1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-benchmark/arm-
> benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-
> benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> index 6746ed5..e1f700e 100644
> --- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmarks_1.3.bb
> +++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmarks_1.3.bb
> @@ -5,20 +5,20 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f957922"
>  SECTION =3D "system"
>=20
>  SRCREV =3D "76"
> -PR =3D "r0+svnr${SRCPV}"
> +PR =3D "r1+svnr${SRCPV}"
>=20
> -SRC_URI =3D
> "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;
> user=3Danonymous;pswd=3D''"
> +SRC_URI =3D
> "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;protocol=3Dhtt
> ps;user=3Danonymous;pswd=3D''"
>=20
>  S =3D "${WORKDIR}/trunk"
>=20
>  do_compile() {
>  	export CROSS_COMPILE=3D${TARGET_PREFIX}
> -	export ARCH=3D${TUNE_PKGARCH}
> +	export ARCH=3D${ARMPKGARCH}
>  	# build the release version
>  	make release
>  }
>=20
>  do_install() {
> -	export ARCH=3D${TUNE_PKGARCH}
> +	export ARCH=3D${ARMPKGARCH}
>  	make DESTDIR=3D${D} install
>  }
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

