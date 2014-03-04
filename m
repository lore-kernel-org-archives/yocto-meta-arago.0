Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A85E852A5B
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 03:38:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s243cv0b002697
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:38:57 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s243cvsp024999
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:38:57 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 3 Mar 2014 21:38:57 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v3] openntpd: Add recipe for building
	OpenNTPD
Thread-Index: AQHPNmNBSefFZfZ0uEmOySZSl74kiprQpcAA//+jt5A=
Date: Tue, 4 Mar 2014 03:38:56 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F48726@DLEE11.ent.ti.com>
References: <1393797813-21978-1-git-send-email-sam.nelson@ti.com>
	<20140304030810.GA22125@edge>
In-Reply-To: <20140304030810.GA22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v3] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Tue, 04 Mar 2014 03:38:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 03, 2014 10:08 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v3] openntpd: Add recipe for building
> OpenNTPD
>=20
> On Sun, Mar 02, 2014 at 05:03:33PM -0500, Sam Nelson wrote:
> > - OpenNTPD is a open source implementation of Network time protocol
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> The patch looks good, just one question below.
>=20
>=20
> > ---
> > Changes from previous patch
> > * Remove kernel dependency
> > * removed Flags depending on staging  kernel
> > ---
> > ---
> >  .../openntpd/openntpd_3.9p1.bb                     |   22 ++++++++++++=
++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb
> >
> > diff --git a/meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb
> > new file mode 100755
> > index 0000000..9b5e6ce
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implementation of the=
 \
> > +Network Time Protocol."
> > +HOMEPAGE =3D "http://www.openntpd.org/"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "BSD ISC"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3D4b4f5158007cc97e6b0e2325bb99854a"
> > +
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D
> "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
> > +
> > +S =3D "${WORKDIR}/openntpd-${PV}"
> > +EXTRA_OECONF =3D "--disable-strip"
> > +inherit autotools
> > +
> > +LDFLAGS +=3D "-lrt"
> > +CFLAGS +=3D "-DTI_ADD_SUPPORT_HW_TIMESTAMPING"
>=20
> I cannot find any reference for the above define inside OpenNTPD source
> code.
[Sam] I think this is not needed. Previously we were having a patch on top =
of openntpd. This is not needed anymore without the patch. I will send upda=
ted patch.
>=20
>=20
> > +EXTRA_OECONF +=3D "LDFLAGS=3D"${LDFLAGS}" CFLAGS=3D"${CFLAGS}"\
> > +                 --with-privsep-user=3Droot --with-privsep-path=3D/${p=
refix}"
> > +
> > +SRC_URI[md5sum] =3D "afc34175f38d08867c1403d9008600b3"
> > +SRC_URI[sha256sum] =3D
> "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49
> "
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

