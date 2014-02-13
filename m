Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 89A625299C
	for <meta-arago@arago-project.org>;
	Thu, 13 Feb 2014 04:02:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1D42jD1016405
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 22:02:45 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1D42jcl031310
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 22:02:45 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 12 Feb 2014 22:02:45 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] openntpd: Add recipe for building
	OpenNTPD
Thread-Index: AQHPKCD5alOZQP3K3UuBvG8SEGWRUZqyaEMAgAAhygA=
Date: Thu, 13 Feb 2014 04:02:45 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549F71C4@DLEE11.ent.ti.com>
References: <1392230029-12829-1-git-send-email-sam.nelson@ti.com>
	<20140212193813.GO4346@edge>
In-Reply-To: <20140212193813.GO4346@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Thu, 13 Feb 2014 04:02:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 12, 2014 2:38 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] openntpd: Add recipe for building
> OpenNTPD
>=20
> On Wed, Feb 12, 2014 at 01:33:49PM -0500, Sam Nelson wrote:
> > - OpenNTPD is a open source implementation of Network time protocol
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Changes from previous patch
> > * Moved to recipes-connectivity
> > * Removed redundant setting of STAGING_KERNEL_DIR
> > ---
> > ---
> >  .../openntpd/openntpd_3.9p1.bb                     |   26 ++++++++++++=
++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb
> >
> > diff --git a/meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb
> > new file mode 100755
> > index 0000000..ca090e4
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-
> connectivity/openntpd/openntpd_3.9p1.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implementation of the=
 \
> > +Network Time Protocol."
> > +HOMEPAGE =3D "http://www.openntpd.org/"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "BSD ISC"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3D4b4f5158007cc97e6b0e2325bb99854a"
> > +
> > +DEPENDS +=3D "virtual/kernel"
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
> > +CPPFLAGS =3D "-I${STAGING_KERNEL_DIR}/include"
> > +CPPFLAGS +=3D "-I${STAGING_KERNEL_DIR}/arch/arm/include"
>=20
> Sam, I keep seeing you passing staged kernel location to user-space apps =
and
> daemons and I'm growing suspicious that it's not really needed... Both
> openntpd and linuxptp should be buildable as is w/o needing to have acces=
s
> to
> the staged kernel. Unless I'm missing something and they do use kernel
> headers
> directly (not libc provided) and you have those headers modified for your
> platform... Can you please elaborate here? Thanks.
>=20
[Sam]  I checked on openntp and looks like the kernel reference may be unne=
cessary.  This recipe came from tci6614 and I will check on more details.
But linuxptp does depend on kernel headers.
>=20
> > +EXTRA_OECONF +=3D "CPPFLAGS=3D"${CPPFLAGS}" LDFLAGS=3D"${LDFLAGS}"
> CFLAGS=3D"${CFLAGS}" \
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

