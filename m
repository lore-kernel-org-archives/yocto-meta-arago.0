Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6BC8152A81
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:39:00 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95CcxoD012621;
	Fri, 5 Oct 2012 07:38:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95Ccxo2008196;
	Fri, 5 Oct 2012 07:38:59 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:38:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] iperf: Update to version 2.0.5
Thread-Index: AQHNosG2rvQJPbSPu0mRB6DjT2yG7Jeqpqng
Date: Fri, 5 Oct 2012 12:38:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247CE5@DLEE12.ent.ti.com>
References: <1349419808-21687-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419808-21687-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] iperf: Update to version 2.0.5
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
X-List-Received-Date: Fri, 05 Oct 2012 12:39:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This needs to be submitted to oe-core (I didn't notice it there but maybe I=
 missed it).

Then please note in the commit log if not as a comment in the recipe itself=
 that it can be removed later when we switch to a new maintenance branch th=
at has this version.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:50 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] iperf: Update to version 2.0.5
>=20
> * Upgrading to newer version of iperf.
> * Newer versions of iperf reduced CPU load thus increasing
> performance in
>   wl12xx tests.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   34
> ++++++++++++++++++++
>  1 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-
> benchmark/iperf/iperf_2.0.5.bb
>=20
> diff --git a/meta-arago-extras/recipes-
> benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-
> benchmark/iperf/iperf_2.0.5.bb
> new file mode 100644
> index 0000000..aff06b2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth,
> allowing the tuning of various parameters and UDP
> characteristics"
> +HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
> +SECTION =3D "console/network"
> +LICENSE =3D "NewBSD"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3De8478eae9f479e39bc34975193360298"
> +
> +SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "44b5536b67719f4250faed632a3cd016"
> +SRC_URI[sha256sum] =3D
> "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b
> "
> +
> +PR =3D "r0"
> +
> +inherit autotools
> +
> +S=3D"${WORKDIR}/iperf-${PV}"
> +
> +EXTRA_OECONF =3D "--exec-
> prefix=3D${STAGING_DIR_HOST}${layout_exec_prefix}"
> +
> +do_configure() {
> +	export ac_cv_func_malloc_0_nonnull=3Dyes
> +	gnu-configize
> +	oe_runconf
> +}
> +
> +do_compile() {
> +	cd ${WORKDIR}/iperf-${PV}
> +	oe_runmake
> +}
> +
> +do_install() {
> +	cd ${WORKDIR}/iperf-${PV}/src
> +	oe_runmake DESTDIR=3D${D} install
> +}
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

