Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 736DC52A68
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 03:14:53 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8Q3Eq0k005181;
	Tue, 25 Sep 2012 22:14:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8Q3Eqok001246;
	Tue, 25 Sep 2012 22:14:52 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 25 Sep 2012 22:14:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] dt: Port dt recipe
Thread-Index: AQHNmzBsdzim39D5eUKWNymBUgnEcZeb889I
Date: Wed, 26 Sep 2012 03:14:52 +0000
Message-ID: <9AB6F8BA-EDBA-4BBE-B3D7-100AA06A0F70@ti.com>
References: <1348587502-25473-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1348587502-25473-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] dt: Port dt recipe
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
X-List-Received-Date: Wed, 26 Sep 2012 03:14:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please explain why.  See previous email

Sincerely,
Chase Maupin
On Sep 25, 2012, at 5:14 PM, "Franklin S. Cooper Jr" <fcooperjr27@gmail.com=
> wrote:

> * Port dt recipe from oe-core
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> .../recipes-devtools/dt/dt/no_aio.patch            |   17 +++++++++++
> meta-arago-extras/recipes-devtools/dt/dt_17.07.bb  |   30 +++++++++++++++=
+++++
> 2 files changed, 47 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
> create mode 100644 meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch b/meta=
-arago-extras/recipes-devtools/dt/dt/no_aio.patch
> new file mode 100644
> index 0000000..8253e86
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
> @@ -0,0 +1,17 @@
> +---
> + Makefile.linux |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: dt.d-WIP/Makefile.linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dt.d-WIP/Makefile.linux
> ++++ dt.d-WIP/Makefile.linux
> +@@ -68,7 +68,7 @@ LINTLIBS=3D
> +
> + PORG      =3D -O3
> +
> +-CFLAGS=3D $(PORG) -DAIO -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -=
D_FILE_OFFSET_BITS=3D64
> ++CFLAGS=3D $(PORG) -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE=
_OFFSET_BITS=3D64
> + CPP=3D    /lib/cpp
> + CPPOPTS=3D -D__GNUC__ -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE
> + LDFLAGS=3D
> diff --git a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb b/meta-ara=
go-extras/recipes-devtools/dt/dt_17.07.bb
> new file mode 100644
> index 0000000..22fd6ac
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
> @@ -0,0 +1,30 @@
> +HOMEPAGE =3D "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/dt=
.html"
> +DESCRIPTION =3D "The Data Test Program (dt) is a generic data test progr=
am used to verify proper \
> +operation of peripherals, file systems, device drivers, or any data stre=
am supported by the \
> +operating system."
> +
> +SECTION =3D "console/tests"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfb073c94d1f584010fc75867b686d=
6d3"
> +
> +INC_PR =3D "r0"
> +
> +SRC_URI =3D "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp=
/dt/dt-source.tar.gz"
> +S =3D "${WORKDIR}/dt.d"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +do_compile() {
> +    ${MAKE} -f Makefile.linux
> +}
> +
> +SRC_URI_append_libc-uclibc =3D " file://no_aio.patch "
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 dt ${D}${bindir}
> +}
> +
> +SRC_URI[md5sum] =3D "fc3373e30868698b90f02cc5fab9aabd"
> +SRC_URI[sha256sum] =3D "6a213b8da2b8907c4f1633c3b90229085ac239e4d43aa587=
9b0123c21f951cab"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

