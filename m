Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 716695208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 03:52:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s243q7qR003908
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:52:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s243q7e0032202
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:52:07 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 3 Mar 2014 21:52:07 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v5] linuxptp: Add recipe for linux ptp
Thread-Index: AQHPNmouo+uCopRS102ZBtf9+TjZEZrQpFEA//+lcgA=
Date: Tue, 4 Mar 2014 03:52:07 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F48788@DLEE11.ent.ti.com>
References: <1393800786-23695-1-git-send-email-sam.nelson@ti.com>
	<20140304030313.GZ22125@edge>
In-Reply-To: <20140304030313.GZ22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v5] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 04 Mar 2014 03:52:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 03, 2014 10:03 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v5] linuxptp: Add recipe for linux ptp
>=20
> On Sun, Mar 02, 2014 at 05:53:06PM -0500, Sam Nelson wrote:
> > - linuxptp is an implementation of precision time protocol (PTP)
>=20
> Ah, didn't see you sent v5 after v4, sorry...
>=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Change from previous patch
> > * Fix issues with passing extra Cflags
>=20
> BTW, you can keep previous patch revisions here as well, just accumulate
> them
> and say something like "Changes in v5". That's basically the Changelog of=
 the
> patch itself, it won't go into git commit message... But it's not a stric=
t
> requirement - it's up to you whether to keep full history of changes in t=
he
> patch, or just the latest one.
[Sam] Makes sense. I will try  to keep the full history.
>=20
> > ---
> > ---
> >  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   23
> ++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb
> >
> > diff --git a/meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-
> connectivity/linuxptp/linuxptp_1.3.bb
> > new file mode 100755
> > index 0000000..d2e39f0
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> > @@ -0,0 +1,23 @@
> > +DESCRIPTION =3D "This software is an implementation of the Precision T=
ime
> Protocol (PTP) \
> > +according to IEEE standard 1588 for Linux"
> > +HOMEPAGE =3D "http://linuxptp.sourceforge.net/"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
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
> > +EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}
> ARCH=3D${TARGET_ARCH} \
> > +		EXTRA_CFLAGS=3D"-D_GNU_SOURCE -
> DHAVE_CLOCK_ADJTIME \
> > +		-DHAVE_ONESTEP_SYNC""
>=20
> Are you sure you don't need to escape quotes in the middle? Or
> alternatively,
> you can use single quotes in the middle, inside outer double quotes...
>=20
[Sam] Adding the escape quotes results in error. I checked without the esca=
pe quotes the flags are passed correctly.
>=20
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

