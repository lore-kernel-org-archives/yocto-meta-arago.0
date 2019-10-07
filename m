Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7447A52A05
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2019 22:35:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97MYYYw042179
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 17:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570487674;
	bh=A+9uedzKcNbz+4IQ7zyZGg6P+fmkgZXOTQXntul96JA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bNsRRLVBzE7w9eIwxnGFtbvbWii45kI0ZBI7u+BzkHuRz1Si4cl54cayexIk9YtsL
	TvMj6QaoYWGlvvcv6a0VGc7EfD7fq2JzFUEdCrD70RxeFYpNmD0eEEBRS1knTjSM3h
	R42pfpiOvXrSSr01Aw2ur5jEUk46CfeyIb9fMpzQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97MYYqD109375
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 17:34:34 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 7 Oct 2019 17:34:31 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1713.004; Mon, 7 Oct 2019 17:34:31 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master/thud/ti2019.03 2/4] tiovx-lib-host: add
	recipe for TI OpenVX library, host side
Thread-Index: AQHVfUySTEPjh5DCRE+zz5vQkPbjs6dPw78Q
Date: Mon, 7 Oct 2019 22:34:31 +0000
Message-ID: <d3dd16d6835049428bc3fe08bccead4c@ti.com>
References: <20190923192121.29814-1-a0271529@ti.com>
	<20190923192121.29814-2-a0271529@ti.com> <20191001200348.GC18229@beryl>
	<20191007201951.GD2144@beryl>
In-Reply-To: <20191007201951.GD2144@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.170]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: [master/thud/ti2019.03 2/4] tiovx-lib-host: add recipe for TI OpenVX library, host side
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
X-List-Received-Date: Mon, 07 Oct 2019 22:35:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

v2 is now submitted for the first 3 patches of the patch set.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, October 07, 2019 4:20 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org; Senicic, Djordje; Senicic, Djordje
> Subject: Re: [meta-arago] [master/thud/ti2019.03 2/4] tiovx-lib-host: add
> recipe for TI OpenVX library, host side
>=20
> Ping?
>=20
> On Tue, Oct 01, 2019 at 04:03:49PM -0400, Denys Dmytriyenko wrote:
> > On Mon, Sep 23, 2019 at 03:21:19PM -0400, Hongmei Gou wrote:
> > > Signed-off-by: Djordje Senicic <x0157990@ti.com>
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > ---
> > >  ...r-Yocto-build-and-add-RTOS-build-var.patch | 133
> ++++++++++++++++++
> > >  .../recipes-ti/tiovx/tiovx-lib-host.bb        |  41 ++++++
> > >  2 files changed, 174 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-ti/tiovx/files/0001-Fix=
-
> paths-for-Yocto-build-and-add-RTOS-build-var.patch
> > >  create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-
> host.bb
> >
> > [...]
> >
> >
> > > diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/m=
eta-
> arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> > > new file mode 100644
> > > index 00000000..6115b195
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> > > @@ -0,0 +1,41 @@
> > > +SUMMARY =3D "TI OpenVX HOST (Linux A15) side library"
> > > +DESCRIPTION =3D "TI OpenVX implementation, TIOVX, based on Khronos
> OpenVX framework implementation including multiple C66 optimized
> kernels. Khronos defined conformance test is part of this package as well=
 as
> additional TI specific tests. Few tutorial examples are also included. Th=
is
> package creates necessary libraries and header files for Linux Host side =
only.
> "
> > > +
> > > +LICENSE =3D "TI-TSPA"
> > > +LIC_FILES_CHKSUM =3D
> "file://docs/manifest/TIOVX_manifest.html;md5=3Dedd4fbfc6c1f01c20d49def4
> 670efac0"
> > > +
> > > +require recipes-ti/includes/tisdk-paths.inc
> >
> > ERROR: ParseError at .../meta-arago/meta-arago-extras/recipes-
> ti/tiovx/tiovx-lib-host.bb:7: Could not include required file recipes-
> ti/includes/tisdk-paths.inc
> >
> >
> > > +
> > > +COMPATIBLE_MACHINE =3D "dra7xx"
> > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > +
> > > +PV =3D "01.00.00.00"
> > > +PR =3D "r1"
> > > +
> > > +BRANCH =3D "master"
> > > +SRC_URI =3D "git://git.ti.com/processor-
> sdk/tiovx.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > +SRC_URI +=3D "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-bui=
ld-
> var.patch "
> > > +SRCREV =3D "2bfa01201804eaf2e675c743e708e88ab612049e"
> > > +
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +DEPENDS =3D " tiovx-sys-iface "
> > > +
> > > +EXTRA_OEMAKE +=3D " GCCLINARO=3D${TOOLCHAIN_PATH} "
> > > +EXTRA_OEMAKE +=3D "
> SDKPLATFORMIFPATH=3D${TIOVX_INSTALL_DIR}/sys-iface BUILD_RTOS=3Dno "
> > > +
> > > +do_install () {
> > > +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-
> preserve=3Downership"
> > > +    install -d ${D}${includedir}/VX
> > > +    install -d ${D}${includedir}/VX/TI
> > > +    install -d ${D}${libdir}
> > > +    cp ${CP_ARGS} ${S}/lib/TDAX/A15/LINUX/release/*.a ${D}${libdir}
> > > +    cp ${CP_ARGS} ${S}/include/VX/* ${D}${includedir}/VX
> > > +    cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
> > > +}
> > > +
> > > +FILES_${PN}-staticdev =3D "${libdir}"
> > > +FILES_${PN}-dev =3D "${includedir}"
> > > +
> > > +ALLOW_EMPTY_${PN} =3D "1"
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

