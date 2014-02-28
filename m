Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 71DA55298A
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2014 11:51:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1SBpfmh011029
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2014 05:51:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1SBpfvK025827
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2014 05:51:41 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 28 Feb 2014 05:51:41 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v3] linuxptp: Add recipe for linux ptp
Thread-Index: AQHPKB/ksInap3pA6EG1EaCGLVSWJ5qyV5IAgBhNrSA=
Date: Fri, 28 Feb 2014 11:51:41 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F461DE@DLEE11.ent.ti.com>
References: <1392229564-8938-1-git-send-email-sam.nelson@ti.com>
	<20140212183828.GL4346@edge>
In-Reply-To: <20140212183828.GL4346@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v3] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Fri, 28 Feb 2014 11:51:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Considering removing dependency of Kernel see my following comments inline.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 12, 2014 1:38 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v3] linuxptp: Add recipe for linux ptp
>=20
> On Wed, Feb 12, 2014 at 01:26:04PM -0500, Sam Nelson wrote:
> > - linuxptp is an implementation of precision time protocol (PTP)
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> Ack, will push soon.
>=20
> > ---
> > Change from previous patch
> > * Moved to recipes-connectivity directory
> > * Updated to use tarball from release
> > * Rename recipe to 1.3 version
> > * Added SRC_URI checksum
> > ---
> > ---
> >  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   22
> ++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb
> >
> > diff --git a/meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb
> > new file mode 100755
> > index 0000000..33ddb06
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> > @@ -0,0 +1,22 @@
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
[Sam] I am assuming this can be removed? Do I setup dependency on libc-linu=
x headers? How can I do that.
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D
> "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-${PV}.tg=
z"
> > +SRC_URI[md5sum] =3D "664706a86fe1413391d4536080548501"
> > +SRC_URI[sha256sum] =3D
> "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad30
> 85"
> > +
> > +inherit autotools
> > +
> > +EXTRA_OEMAKE =3D "KBUILD_OUTPUT=3D${STAGING_KERNEL_DIR}
[Sam] How can I remove this dependency and point to the libc-linux-headers?=
 Especially the linux kernel root directory is used here. ( Can I use STAGI=
NG_DIR_TARGET? ). Appreciate your comments.
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

