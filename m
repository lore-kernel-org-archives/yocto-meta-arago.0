Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 56838529A6
	for <meta-arago@arago-project.org>;
	Wed, 11 Jun 2014 18:50:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5BIo6AL029577
	for <meta-arago@arago-project.org>; Wed, 11 Jun 2014 13:50:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BIo6Mr015028
	for <meta-arago@arago-project.org>; Wed, 11 Jun 2014 13:50:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 11 Jun 2014 13:50:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ptpd: Add latest version of ptpd 2.3.0
Thread-Index: AQHPhX2H5s93ihapDUi9OUK3/OCpMZtsRSKA//+2S/CAAEUMMA==
Date: Wed, 11 Jun 2014 18:50:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6CA1EF@DFLE08.ent.ti.com>
References: <1402495232-30133-1-git-send-email-fcooper@ti.com>
	<1402495232-30133-2-git-send-email-fcooper@ti.com>
	<20140611140507.GM18034@edge>
	<8F29D6B095ED194EA1980491A5E029710C6C9F3B@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6C9F3B@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ptpd: Add latest version of ptpd 2.3.0
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
X-List-Received-Date: Wed, 11 Jun 2014 18:50:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI I can update it in meta-oe but it still won't help us since it is apart=
 of meta-networking and we don't "depend" on it.=20

Do you want to add that layer as a dependency?
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Wednesday, June 11, 2014 9:42 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] ptpd: Add latest version of ptpd 2.3.0
>=20
> Yes I plan on updating the meta-oe version.
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, June 11, 2014 9:05 AM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] ptpd: Add latest version of ptpd
> > 2.3.0
> >
> > On Wed, Jun 11, 2014 at 09:00:32AM -0500, Franklin S. Cooper Jr wrote:
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >
> > Will you be submitting it to meta-oe?
> >
> >
> > > ---
> > >  .../recipes-daemons/ptpd/ptpd_2.3.0.bb             |   30
> > ++++++++++++++++++++
> > >  1 files changed, 30 insertions(+), 0 deletions(-)  create mode
> > > 100644 meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > > b/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > > new file mode 100644
> > > index 0000000..c54f507
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > > @@ -0,0 +1,30 @@
> > > +SUMMARY =3D "The PTP daemon (PTPd)"
> > > +DESCRIPTION =3D "The PTP daemon (PTPd) implements the Precision Time
> > > +protocol (PTP) as \ defined by the relevant IEEE 1588 standard. PTP
> > > +Version 1 implements IEEE-1588-2002, \ and PTP Version 2 implements
> > > +IEEE-1588-2008. PTP was developed to provide very precise \ time
> > coordination of LAN connected computers."
> > > +HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
> > > +SECTION =3D "network"
> > > +LICENSE =3D "BSD"
> > > +LIC_FILES_CHKSUM =3D
> > "file://COPYRIGHT;md5=3D4019cad2b3cd55f22ea819ffad6ccd41"
> > > +
> > > +DEPENDS =3D "libpcap"
> > > +
> > > +PR =3D "r0"
> > > +
> > > +inherit autotools
> > > +
> > > +SRC_URI =3D
> > "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-
> > ${PV}.tar.gz"
> > > +
> > > +SRC_URI[md5sum] =3D "f5e931b4a229705ff0dbdfe22490566b"
> > > +SRC_URI[sha256sum] =3D
> > "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
> > > +
> > > +S =3D "${WORKDIR}/ptpd-${PV}"
> > > +
> > > +EXTRA_OEMAKE =3D ""
> > > +
> > > +do_install() {
> > > +    install -d ${D}${bindir} ${D}${mandir}/man8
> > > +    install -m 0755 ${S}/src/ptpd2 ${D}${bindir}
> > > +    install -m 0644 ${S}/src/ptpd2.8 ${D}${mandir}/man8 }
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

