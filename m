Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D6DDB5208C
	for <meta-arago@arago-project.org>;
	Sun,  2 Mar 2014 21:51:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s22LpJt3027471
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 15:51:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s22LpIn4028174
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 15:51:19 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Sun, 2 Mar 2014 15:51:18 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v3] linuxptp: Add recipe for linux ptp
Thread-Index: AQHPKB/ksInap3pA6EG1EaCGLVSWJ5qyV5IAgBhNrSCAANHNgIAC+6oQ
Date: Sun, 2 Mar 2014 21:51:18 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F46F71@DLEE11.ent.ti.com>
References: <1392229564-8938-1-git-send-email-sam.nelson@ti.com>
	<20140212183828.GL4346@edge>
	<4F9216F96E5DF9428610502835A9F49057F461DE@DLEE11.ent.ti.com>
	<20140228181737.GQ22125@edge>
In-Reply-To: <20140228181737.GQ22125@edge>
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
X-List-Received-Date: Sun, 02 Mar 2014 21:51:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys. I have sent an updated patch.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, February 28, 2014 1:18 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v3] linuxptp: Add recipe for linux ptp
>=20
> On Fri, Feb 28, 2014 at 06:51:41AM -0500, Nelson, Sam wrote:
> > Considering removing dependency of Kernel see my following comments
> inline.
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, February 12, 2014 1:38 PM
> > > To: Nelson, Sam
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH v3] linuxptp: Add recipe for linux p=
tp
> > >
> > > On Wed, Feb 12, 2014 at 01:26:04PM -0500, Sam Nelson wrote:
> > > > - linuxptp is an implementation of precision time protocol (PTP)
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >
> > > Ack, will push soon.
> > >
> > > > ---
> > > > Change from previous patch
> > > > * Moved to recipes-connectivity directory
> > > > * Updated to use tarball from release
> > > > * Rename recipe to 1.3 version
> > > > * Added SRC_URI checksum
> > > > ---
> > > > ---
> > > >  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   22
> > > ++++++++++++++++++++
> > > >  1 file changed, 22 insertions(+)
> > > >  create mode 100755 meta-arago-extras/recipes-
> > > connectivity/linuxptp/linuxptp_1.3.bb
> > > >
> > > > diff --git a/meta-arago-extras/recipes-
> > > connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-
> > > connectivity/linuxptp/linuxptp_1.3.bb
> > > > new file mode 100755
> > > > index 0000000..33ddb06
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb
> > > > @@ -0,0 +1,22 @@
> > > > +DESCRIPTION =3D "This software is an implementation of the Precisi=
on
> Time
> > > Protocol (PTP) \
> > > > +according to IEEE standard 1588 for Linux"
> > > > +HOMEPAGE =3D "http://linuxptp.sourceforge.net/"
> > > > +SECTION =3D "console/network"
> > > > +LICENSE =3D "GPLv2"
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > > > +DEPENDS +=3D "virtual/kernel"
> > [Sam] I am assuming this can be removed? Do I setup dependency on libc-
> linux
> > headers? How can I do that.
>=20
> Yes, drop the DEPENDS completely.
> Dependency on linux-libc-headers is implicit, as those are part of the sy=
stem
> headers. Similar to eglibc, gcc and everything else you need for compilin=
g
> the
> code - all those dependencies are taken care of automatically.
>=20
>=20
> > > > +PR =3D "r0"
> > > > +
> > > > +SRC_URI =3D
> > > "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-
> ${PV}.tgz"
> > > > +SRC_URI[md5sum] =3D "664706a86fe1413391d4536080548501"
> > > > +SRC_URI[sha256sum] =3D
> > >
> "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad30
> > > 85"
> > > > +
> > > > +inherit autotools
> > > > +
> > > > +EXTRA_OEMAKE =3D "KBUILD_OUTPUT=3D${STAGING_KERNEL_DIR}
>=20
> > [Sam] How can I remove this dependency and point to the libc-linux-
> headers?
> > Especially the linux kernel root directory is used here. ( Can I use
> > STAGING_DIR_TARGET? ). Appreciate your comments.
>=20
> Ok, so I ended up looking into their Makefile and what they try to do the=
re
> with KBUILD_OUTPUT... Besides few errors in their script, what they try t=
o do
> is to check couple header files for availability of specific features and=
 at
> the end pass corresponding defines to their source code. When
> crosscompiling,
> your target kernel is different from host kernel, hence they try to locat=
e the
> correct /usr/include/linux/net_tstamp.h just to see if it contains defini=
tion
> for HWTSTAMP_TX_ONESTEP_SYNC. But that header file hasn't changed in
> at least
> 5 years... They also check time.h to have clock_adjtime.
> Anyway, it should be possible to short-cut those checks, but at the end t=
hey
> need to define these: -D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -
> DHAVE_ONESTEP_SYNC
> We can pass those to EXTRA_CFLAGS directly:
>=20
> EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}
> ARCH=3D${TARGET_ARCH} \
> 		EXTRA_CFLAGS=3D\"-D_GNU_SOURCE -
> DHAVE_CLOCK_ADJTIME \
> 		-DHAVE_ONESTEP_SYNC\""
>=20
>=20
> > > CROSS_COMPILE=3D${TARGET_PREFIX} ARCH=3D${TARGET_ARCH}"
> > > > +
> > > > +do_install() {
> > > > +	install -d ${D}${bindir}/
> > > > +	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
> > > > +}
> > > > +
> > > > --
> > > > 1.7.9.5
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

