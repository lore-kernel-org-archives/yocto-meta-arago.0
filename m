Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2D5CF52A14
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 18:21:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CILs7I028128
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 12:21:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CILr2S013390
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 12:21:53 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 12 Feb 2014 12:21:53 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] linuxptp: Add recipe for linux ptp
Thread-Index: AQHPJ4T0kbl6CBWD8UuT4UuEaoEj0JqyOg6A//+0WzA=
Date: Wed, 12 Feb 2014 18:21:53 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549F6642@DLEE11.ent.ti.com>
References: <1392163018-32052-1-git-send-email-sam.nelson@ti.com>
	<20140212164829.GH4346@edge>
In-Reply-To: <20140212164829.GH4346@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Wed, 12 Feb 2014 18:21:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 12, 2014 11:48 AM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] linuxptp: Add recipe for linux ptp
>=20
> On Tue, Feb 11, 2014 at 06:56:58PM -0500, Sam Nelson wrote:
> > - linuxptp is an implementation of precision time protocol (PTP)
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Change from previous patch
> > * Removed redundant setting of STAGING_KERNEL_DIR
> > ---
> > ---
> >  .../recipes-bsp/linuxptp/linuxptp_1.0.bb           |   24
> ++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-
> bsp/linuxptp/linuxptp_1.0.bb
>=20
> You keep adding everything to recipes-bsp... This one is not really BSP
> specific. For networking stuff, there's recipes-connectivity directory.
[Sam] I will move to recipes-connectivity.
>=20
> Otherwise looks good. BTW, does that SRCREV correspond to any official
> release? If it is, handling tarball would be easier than checking out fro=
m
> a git repository - release tarballs are usually mirrored much wider...
[Sam]That is a good point.  I will use tarball instead of git and send the =
updated patch.
>=20
>=20
> > diff --git a/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
> b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
> > new file mode 100755
> > index 0000000..6d3d3a1
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "This software is an implementation of the Precision T=
ime
> Protocol (PTP) \
> > +according to IEEE standard 1588 for Linux"
> > +HOMEPAGE =3D "http://linuxptp.sourceforge.net/"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > +DEPENDS +=3D "virtual/kernel"
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D "git://git.code.sf.net/p/linuxptp/code;protocol=3Dgit"
> > +
> > +SRCREV =3D "74e703727ec9b1c334c7bfbba9be1cabf4b7b461"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit autotools
> > +
> > +EXTRA_OEMAKE =3D "KBUILD_OUTPUT=3D${STAGING_KERNEL_DIR}
> CROSS_COMPILE=3D${TARGET_PREFIX} ARCH=3D${TARGET_ARCH}"
> > +
> > +do_install() {
> > +	install -d ${D}${bindir}/
> > +	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
> > +}
> > +
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

