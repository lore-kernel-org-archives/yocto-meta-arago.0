Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 99E585208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 03:52:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s243q1ZX015071
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:52:01 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s243q1iu025191
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:52:01 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Mon, 3 Mar 2014 21:52:01 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v4] linuxptp: Add recipe for linux ptp
Thread-Index: AQHPNmF5x75yWoZSikWmuLCqRY97wprQoeyA//+qgZA=
Date: Tue, 4 Mar 2014 03:52:01 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F48780@DLEE11.ent.ti.com>
References: <1393797046-961-1-git-send-email-sam.nelson@ti.com>
	<20140304025424.GY22125@edge>
In-Reply-To: <20140304025424.GY22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v4] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 04 Mar 2014 03:52:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 03, 2014 9:54 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v4] linuxptp: Add recipe for linux ptp
>=20
> On Sun, Mar 02, 2014 at 04:50:46PM -0500, Sam Nelson wrote:
> > - linuxptp is an implementation of precision time protocol (PTP)
>=20
> Much better! Sorry, couple of comments I missed the last time.
>=20
>=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Change from previous patch
> > * Removed dependency on kernel
> > * Added flags for CLOCKADJTIME & ONESTEPSYNC
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
> > index 0000000..0a36631
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
>=20
> The latest version is 1.4 and you are adding 1.3 - I only checked 1.4, bu=
t
> don't think it changed that much. Do you specifically need 1.3 or 1.4 wil=
l
> also work?
[Sam] Currently system tested with 1.3. Probably will consider 1.4 later. I=
s that Ok?
>=20
>=20
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
>=20
> I didn't see any autotools file in the package - no configure script, no
> Makefile.am, no acinclude.m4 etc., etc.
[Sam] I guess this can be removed.
>=20
>=20
> > +EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}
> ARCH=3D${TARGET_ARCH} \
> > +		EXTRA_CFLAGS=3D\"-D_GNU_SOURCE -
> DHAVE_CLOCK_ADJTIME \
> > +		-DHAVE_ONESTEP_SYNC\""
> > +
> > +do_install() {
> > +	install -d ${D}${bindir}/
> > +	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
> > +}
>=20
> Other than that, looks much cleaner. If you are tired re-iterating it, ju=
st
> answer my 2 questions above and I'll make the amends myself when
> applying your
> patch...
>=20
> --
> Denys

